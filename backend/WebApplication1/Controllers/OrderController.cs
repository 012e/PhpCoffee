using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebApplication1.Database;
using WebApplication1.Dtos.Mappers;
using WebApplication1.Dtos.Requests.Orders;
using WebApplication1.Dtos.Responses;
using QuestPDF.Fluent;
using QuestPDF.Helpers;
using QuestPDF.Infrastructure;
using QuestPDF.Drawing;
namespace WebApplication1.Controllers;

[Route("[controller]")]
[ApiController]
public class OrderController : Controller
{
    private readonly ApplicationDbContext _context;
    private readonly OrdersMapper _ordersMapper;

    public OrderController(ApplicationDbContext context, OrdersMapper ordersMapper)
    {
        _ordersMapper = ordersMapper;
        _context = context;
    }

    [HttpPost]
    [ProducesResponseType(typeof(OrderResponse), StatusCodes.Status201Created)]
    [ProducesResponseType(StatusCodes.Status400BadRequest)]
    public async Task<ActionResult<OrderResponse>> Create(CreateOrdersRequest createOrdersRequest)
    {
        await using var transaction = await _context.Database.BeginTransactionAsync();
        try
        {
            var newOrder = _ordersMapper.CreateOrdersRequestToOrder(createOrdersRequest);
            _context.Orders.Add(newOrder);
            await _context.SaveChangesAsync();
            foreach (var item in createOrdersRequest.CreateOrderItemRequests)
            {
                var newItem = _ordersMapper.CreateOrderItemRequestInOrders(item);
                newItem.TotalPrice = newItem.UnitPrice * newItem.Quantity;
                newItem.OrderId = newOrder.OrderId;
                _context.OrderItems.Add(newItem);
                newOrder.TotalAmount += newItem.TotalPrice;
            }

            newOrder.Remaining = newOrder.TotalAmount;
            _context.Orders.Update(newOrder);
            await _context.SaveChangesAsync();

            var newPayment = _ordersMapper.CreatePaymentRequestInOrders(createOrdersRequest.CreatePaymentRequest);
            newPayment.OrderId = newOrder.OrderId;
            newPayment.Amount = newOrder.Remaining;

            _context.Payments.Add(newPayment);

            newOrder.PaymentStatus = newPayment.PaymentMethod switch
            {
                "Tien mat" => "Da thanh toan",
                "Chuyen khoan" => "Doi thanh toan",
                _ => newOrder.PaymentStatus
            };

            _context.Update(newOrder);
            await _context.SaveChangesAsync();
            await transaction.CommitAsync();

            // Load related data for the response
            var completeOrder = await _context.Orders
                .Include(o => o.OrderItems)
                .ThenInclude(oi => oi.Item)
                .Include(o => o.Payments)
                .FirstOrDefaultAsync(o => o.OrderId == newOrder.OrderId);

            // Map to response DTO
            var orderResponse = _ordersMapper.OrderToOrderResponse(completeOrder);

            return CreatedAtAction(nameof(GetOrderById), new { id = newOrder.OrderId }, orderResponse);
        }
        catch (Exception ex)
        {
            await transaction.RollbackAsync();
            return BadRequest(new ProblemDetails
            {
                Detail = "Failed to create order: " + ex.Message,
                Title = "Order Creation Failed",
                Status = 400
            });
        }
    }

    [HttpGet("{id}")]
    [ProducesResponseType(typeof(OrderResponse), StatusCodes.Status200OK)]
    [ProducesResponseType(StatusCodes.Status404NotFound)]
    public async Task<ActionResult<OrderResponse>> GetOrderById(int id)
    {
        var order = await _context.Orders
            .Include(o => o.OrderItems)
            .ThenInclude(oi => oi.Item)
            .Include(o => o.Payments)
            .FirstOrDefaultAsync(o => o.OrderId == id);

        if (order == null)
        {
            return NotFound(new ProblemDetails
            {
                Detail = $"Order with ID {id} not found",
                Title = "Resource Not Found",
                Status = 404
            });
        }

        var orderResponse = _ordersMapper.OrderToOrderResponse(order);
        return Ok(orderResponse);
    }

    [HttpGet("{id}/payment-status")]
    [ProducesResponseType(typeof(PaymentStatusResponse), StatusCodes.Status200OK)]
    [ProducesResponseType(StatusCodes.Status404NotFound)]
    [ProducesResponseType(StatusCodes.Status408RequestTimeout)]
    public async Task<ActionResult<PaymentStatusResponse>> ValidatePaymentStatus(int id,
        [FromQuery] int timeoutSeconds = 30)
    {
        // Set a maximum timeout limit to prevent excessive resource usage
        if (timeoutSeconds > 120)
        {
            timeoutSeconds = 120;
        }

        // Create a cancellation token that will timeout after specified seconds
        using var cts = new CancellationTokenSource(TimeSpan.FromSeconds(timeoutSeconds));

        try
        {
            // Check if the order exists
            var orderExists = await _context.Orders.AnyAsync(o => o.OrderId == id);
            if (!orderExists)
            {
                return NotFound(new ProblemDetails
                {
                    Detail = $"Order with ID {id} not found",
                    Title = "Resource Not Found",
                    Status = 404
                });
            }

            // Poll for payment status changes
            var startTime = DateTime.UtcNow;
            string currentStatus = await GetCurrentPaymentStatus(id);

            // If already paid, return immediately
            if (currentStatus == "Da thanh toan")
            {
                return Ok(new PaymentStatusResponse
                {
                    PaymentStatus = currentStatus,
                    OrderId = id,
                    IsPaid = true
                });
            }

            // Long polling loop
            while (!cts.Token.IsCancellationRequested)
            {
                // Wait a short time before checking again to avoid hammering the database
                await Task.Delay(1000, cts.Token);

                // Get latest payment status
                string latestStatus = await GetCurrentPaymentStatus(id);

                // If status changed to paid, return immediately
                if (latestStatus == "Da thanh toan")
                {
                    return Ok(new PaymentStatusResponse
                    {
                        PaymentStatus = latestStatus,
                        OrderId = id,
                        IsPaid = true
                    });
                }

                // If status changed at all, return the new status
                if (latestStatus != currentStatus)
                {
                    return Ok(new PaymentStatusResponse
                    {
                        PaymentStatus = latestStatus,
                        OrderId = id,
                        IsPaid = false
                    });
                }
            }

            // If we reach here, we timed out without a status change
            return StatusCode(StatusCodes.Status408RequestTimeout, new PaymentStatusResponse
            {
                PaymentStatus = currentStatus,
                OrderId = id,
                IsPaid = currentStatus == "Da thanh toan",
                Message = "Long polling timed out. No payment status change detected."
            });
        }
        catch (OperationCanceledException)
        {
            // Handle timeout
            var finalStatus = await GetCurrentPaymentStatus(id);
            return StatusCode(StatusCodes.Status408RequestTimeout, new PaymentStatusResponse
            {
                PaymentStatus = finalStatus,
                OrderId = id,
                IsPaid = finalStatus == "Da thanh toan",
                Message = "Request timed out"
            });
        }
        catch (Exception ex)
        {
            return StatusCode(500, new ProblemDetails
            {
                Detail = "Error checking payment status: " + ex.Message,
                Title = "Internal Server Error",
                Status = 500
            });
        }
    }

    private async Task<string> GetCurrentPaymentStatus(int orderId)
    {
        var order = await _context.Orders
            .AsNoTracking()
            .Where(o => o.OrderId == orderId)
            .Select(o => o.PaymentStatus)
            .FirstOrDefaultAsync();

        return order ?? "Unknown";
    }

    [HttpGet("{id}/export-pdf")]
    public async Task<IActionResult> ExportOrderToPdf(int id)
    {
        // Lấy dữ liệu đơn hàng và các item
        var order = await _context.Orders
            .Include(o => o.OrderItems)
                .ThenInclude(oi => oi.Item)
            .FirstOrDefaultAsync(o => o.OrderId == id);

        if (order == null)
        {
            return NotFound(new ProblemDetails
            {
                Detail = $"Order with ID {id} not found",
                Title = "Resource Not Found",
                Status = 404
            });
        }

        var stream = new MemoryStream();

        // Generate PDF
        Document.Create(container =>
        {
            container.Page(page =>
            {
                page.Size(PageSizes.A4);
                page.Margin(30);
                page.Header().Text($"ORDER #{order.OrderId}")
                    .FontSize(20)
                    .SemiBold()
                    .AlignCenter();

                page.Content().Column(col =>
                {
                    col.Item().Text($"Order Date: {order.OrderDate?.ToString("yyyy-MM-dd HH:mm:ss") ?? ""}").FontSize(12);
                    col.Item().PaddingBottom(10).Text($"Total Amount: {order.TotalAmount:C}").FontSize(12);

                    col.Item().LineHorizontal(1).LineColor(Colors.Grey.Lighten1);

                    col.Item().Table(table =>
                    {
                        table.ColumnsDefinition(columns =>
                        {
                            columns.ConstantColumn(40);     // STT
                            columns.RelativeColumn(2);      // Item Name
                            columns.RelativeColumn(1);      // Quantity
                            columns.RelativeColumn(1);      // Unit Price
                            columns.RelativeColumn(1);      // Total Price
                        });

                        // Table Header
                        table.Header(header =>
                        {
                            header.Cell().Text("No.").SemiBold();
                            header.Cell().Text("Item Name").SemiBold();
                            header.Cell().Text("Quantity").SemiBold();
                            header.Cell().Text("Unit Price").SemiBold();
                            header.Cell().Text("Total Price").SemiBold();
                        });

                        // Table Body
                        int stt = 1;
                        foreach (var item in order.OrderItems)
                        {
                            table.Cell().Text(stt.ToString());
                            table.Cell().Text(item.Item?.ItemName ?? "");
                            table.Cell().Text(item.Quantity.ToString());
                            table.Cell().Text(item.UnitPrice.ToString("C"));
                            table.Cell().Text(item.TotalPrice.ToString("C"));
                            stt++;
                        }
                    });
                });

                page.Footer()
                    .AlignCenter()
                    .Text(txt =>
                    {
                        txt.Span("Generated by MyApp").FontSize(10);
                        txt.Span($"  -  {DateTime.Now:yyyy-MM-dd HH:mm:ss}").FontSize(10);
                    });
            });
        }).GeneratePdf(stream);

        stream.Position = 0;
        var fileName = $"Order_{order.OrderId}_{DateTime.Now:yyyyMMddHHmmss}.pdf";
        return File(stream.ToArray(), "application/pdf", fileName);
    }
}