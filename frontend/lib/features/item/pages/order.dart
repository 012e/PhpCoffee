import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/features/item/widgets/readonly_selected_items.dart';
import 'package:frontend/shared/riverpods/order_items_provider.dart';
import 'package:api_client/api_client.dart';
import 'dart:async';

@RoutePage()
class OrderPage extends ConsumerStatefulWidget {
  const OrderPage({super.key});

  @override
  ConsumerState<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends ConsumerState<OrderPage> {
  OrderResponse? _createdOrder;
  PaymentStatusResponse? _paymentStatus;
  bool _isCreatingOrder = false;
  bool _isPollingPayment = false;
  StreamSubscription<PaymentStatusResponse>? _paymentSubscription;

  @override
  void initState() {
    super.initState();
    // Create order automatically when page loads, but wait for items to be loaded
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _createOrderWhenReady();
    });
  }

  // Wait for selected items to be available before creating order
  void _createOrderWhenReady() async {
    final selectedItems = ref.read(selectedItemsWithDetailsProvider);
    if (selectedItems.isNotEmpty) {
      _createOrder();
    } else {
      // Wait a bit and try again
      await Future.delayed(const Duration(milliseconds: 500));
      if (mounted) {
        _createOrderWhenReady();
      }
    }
  }

  @override
  void dispose() {
    _paymentSubscription?.cancel();
    super.dispose();
  }

  Future<void> _createOrder() async {
    if (_isCreatingOrder) return;

    // Check if there are selected items
    final selectedItems = ref.read(selectedItemsWithDetailsProvider);
    if (selectedItems.isEmpty) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('No items selected for order'),
            backgroundColor: Colors.orange,
          ),
        );
      }
      return;
    }

    setState(() {
      _isCreatingOrder = true;
    });

    try {
      final selectedItemsNotifier = ref.read(
        selectedItemsNotifierProvider.notifier,
      );
      final order = await selectedItemsNotifier.createOrder(
        paymentMethod: PaymentStatus.bankTransfer, // Bank transfer
      );

      setState(() {
        _createdOrder = order;
      });

      // Start payment polling if order was created successfully
      if (order != null &&
          order.paymentStatus == PaymentStatus.waitingPayment) {
        _startPaymentPolling(order.orderId!);
      }

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Order #${order?.orderId} created successfully!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to create order: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      setState(() {
        _isCreatingOrder = false;
      });
    }
  }

  void _startPaymentPolling(int orderId) {
    if (_isPollingPayment) return;

    setState(() {
      _isPollingPayment = true;
    });

    final selectedItemsNotifier = ref.read(
      selectedItemsNotifierProvider.notifier,
    );

    _paymentSubscription = selectedItemsNotifier
        .pollPaymentStatus(
          orderId,
          pollInterval: const Duration(seconds: 5), // 5-second polling
        )
        .listen(
          (paymentStatus) {
            print('Payment status update: ${paymentStatus.paymentStatus}, isPaid: ${paymentStatus.isPaid}'); // Debug
            setState(() {
              _paymentStatus = paymentStatus;
            });

            // Stop polling when payment is confirmed or an error occurs
            if (paymentStatus.isPaid == true ||
                (paymentStatus.message != null &&
                    paymentStatus.message!.toLowerCase().contains('error'))) {
              print('Stopping polling: isPaid=${paymentStatus.isPaid}, hasError=${paymentStatus.message?.contains('error')}'); // Debug
              setState(() {
                _isPollingPayment = false;
              });
              _paymentSubscription?.cancel();

              if (paymentStatus.isPaid == true && mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Payment confirmed! ✅'),
                    backgroundColor: Colors.green,
                  ),
                );
              }
            }
          },
          onError: (error) {
            setState(() {
              _isPollingPayment = false;
            });

            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Payment polling error: $error'),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          onDone: () {
            setState(() {
              _isPollingPayment = false;
            });
          },
        );
  }

  @override
  Widget build(BuildContext context) {
    final selectedItems = ref.watch(selectedItemsWithDetailsProvider);

    // Calculate the total amount
    double total;
    if (_createdOrder != null && _createdOrder!.totalAmount != null) {
      // Use the total from the created order
      total = _createdOrder!.totalAmount!;
    } else {
      // Fallback to calculating from selected items
      total = selectedItems.entries.fold(
        0.0,
        (sum, entry) => sum + ((entry.key.basePrice ?? 0) * entry.value),
      );
    }

    // Convert total to integer (multiplied by 1000 as specified)
    final totalAmount = (total * 1000).toInt();

    // Generate QR code URL with order ID if available
    String orderDescription = 'CK';
    if (_createdOrder != null) {
      orderDescription = _createdOrder!.orderId.toString();
    }
    
    final qrUrl =
        'https://qr.sepay.vn/img?acc=96247R3YHR&bank=BIDV&amount=$totalAmount&des=$orderDescription';

    return Scaffold(
      appBar: AppBar(
        title: const Text("Order"),
        leading: AutoLeadingButton(showIfParentCanPop: false),
        actions: [
          // Order status indicator
          if (_createdOrder != null)
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: _getStatusColor(),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    _getStatusText(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
      body:
          _isCreatingOrder
              ? const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 16),
                    Text('Creating your order...'),
                  ],
                ),
              )
              : Column(
                children: [
                  // Payment status banner
                  if (_createdOrder != null) ...[
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      color: _getStatusColor().withOpacity(0.1),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Order #${_createdOrder!.orderId}',
                            style: Theme.of(context).textTheme.titleLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Total: \$${_createdOrder!.totalAmount?.toStringAsFixed(2) ?? '0.00'}',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (_isPollingPayment) ...[
                                const SizedBox(
                                  width: 16,
                                  height: 16,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                ),
                                const SizedBox(width: 8),
                              ],
                              Text(
                                _getDetailedStatusText(),
                                style: Theme.of(context).textTheme.bodyMedium,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],

                  // Main content
                  Expanded(
                    child: Flex(
                      direction: Axis.horizontal,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Scan QR Code to Pay',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox(height: 16),
                              Image.network(
                                qrUrl,
                                fit: BoxFit.contain,
                                errorBuilder:
                                    (context, error, stackTrace) =>
                                        const Center(
                                          child: Icon(Icons.qr_code, size: 100),
                                        ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Amount: \$${total.toStringAsFixed(2)}',
                                style: Theme.of(context).textTheme.titleMedium
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              // Debug button for testing
                              if (_createdOrder != null) ...[
                                const SizedBox(height: 16),
                                ElevatedButton(
                                  onPressed: _isPollingPayment 
                                      ? null 
                                      : () => _startPaymentPolling(_createdOrder!.orderId!),
                                  child: Text(_isPollingPayment 
                                      ? 'Polling...' 
                                      : 'Test Polling'),
                                ),
                              ],
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            margin: const EdgeInsets.all(90),
                            child: ReadonlySelectedItems(
                              selectedItemsMap: selectedItems,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
    );
  }

  Color _getStatusColor() {
    if (_paymentStatus?.isPaid == true) {
      return Colors.green;
    } else if (_hasError()) {
      return Colors.red;
    } else if (_isPollingPayment) {
      return Colors.orange;
    }
    return Colors.blue;
  }

  String _getStatusText() {
    if (_paymentStatus?.isPaid == true) {
      return 'PAID';
    } else if (_hasError()) {
      return 'ERROR';
    } else if (_isPollingPayment) {
      return 'PENDING';
    }
    return 'WAITING';
  }

  String _getDetailedStatusText() {
    if (_paymentStatus?.isPaid == true) {
      return 'Payment confirmed! Your order is complete.';
    } else if (_hasError()) {
      return _paymentStatus?.message ?? 'Payment verification failed.';
    } else if (_isPollingPayment) {
      return 'Waiting for payment confirmation...';
    }
    return 'Please scan the QR code to complete payment.';
  }

  bool _hasError() {
    return _paymentStatus?.message != null &&
        _paymentStatus!.message!.toLowerCase().contains('error');
  }
}
