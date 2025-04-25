import 'package:api_client/api_client.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/features/item/widgets/payment_card.dart';
import 'package:frontend/shared/riverpods/order_items_provider.dart';

class SelectedItemsSidebar extends ConsumerWidget {
  final SelectedItemsWithAmount selectedItemsMap;

  const SelectedItemsSidebar({super.key, required this.selectedItemsMap});

  // Handle secondary (right) tap - decrements amount
  void _handleItemSecondaryTap(WidgetRef ref, MenuItemResponse item) {
    final itemId = item.itemId;
    if (itemId == null) return;

    // Call the notifier method
    ref.read(selectedItemsNotifierProvider.notifier).decrementItem(itemId);
    // State update and notification happens within the notifier
  }

  void _clearSelections(WidgetRef ref) {
    // Call the notifier method to clear selections
    ref.read(selectedItemsNotifierProvider.notifier).clearItems();
    // State update and notification happens within the notifier/derived provider
  }

  void _showPaymentMethodDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          child: _buildPaymentMethodContent(context),
        );
      },
    );
  }

  Widget _buildPaymentMethodContent(BuildContext context) {
    final router = AutoRouter.of(context);
    return Container(
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.only(top: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: const Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment:
            CrossAxisAlignment.start, // Align content to the start
        children: <Widget>[
          Text(
            "Payment Method",
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 8.0),
          Text(
            "Select a payment method to proceed with the order.",
            style: TextStyle(fontSize: 14.0),
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              PaymentCard(
                icon: Icons.money,
                text: "Cash",
                onTap: () {
                  Navigator.of(context).pop();
                  router.navigatePath("/items/confirm");
                },
              ),
              PaymentCard(
                icon: Icons.qr_code_2,
                text: "Bank",
                onTap: () {
                  Navigator.of(context).pop();
                  router.navigatePath("/items/order");
                },
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Row(
            // Use a Row to align the button to the end
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: Text("CANCEL"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedItemsList = selectedItemsMap.entries.toList();

    if (selectedItemsList.isEmpty) {
      // This case should ideally be handled by the parent not showing the sidebar,
      // but it's a safe fallback.
      return const SizedBox.shrink();
    }

    var total = selectedItemsMap.entries.fold(
      0.0,
      (sum, entry) => sum + ((entry.key.basePrice ?? 0) * entry.value),
    );

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Selected Items (${selectedItemsList.length})',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => _clearSelections(ref), // Use ref to clear
                tooltip: 'Clear Selection',
              ),
            ],
          ),
        ),
        const Divider(height: 1),
        Expanded(
          child: ListView.builder(
            itemCount: selectedItemsList.length,
            itemBuilder: (context, index) {
              final entry = selectedItemsList[index];
              final item = entry.key;
              final amount = entry.value;

              return ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 4.0,
                ),
                leading: SizedBox(
                  width: 40,
                  height: 40,
                  child: Image.network(
                    item.itemId
                        .toString(), // TODO: Replace with actual image URL
                    fit: BoxFit.cover,
                    errorBuilder:
                        (context, error, stackTrace) =>
                            const Icon(Icons.fastfood),
                  ),
                ),
                title: Text(
                  item.itemName ?? 'Unnamed',
                  style: const TextStyle(fontSize: 14),
                ),
                subtitle: Text(
                  // Display price per item and total for this item
                  '\$${item.basePrice?.toStringAsFixed(2) ?? '0.00'} x $amount = \$${((item.basePrice ?? 0) * amount).toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 12),
                ),
                trailing: IconButton(
                  icon: const Icon(
                    Icons.remove_circle_outline,
                    color: Colors.red,
                  ),
                  onPressed:
                      () => _handleItemSecondaryTap(
                        ref,
                        item,
                      ), // Use ref and item
                  tooltip: 'Remove one',
                ),
              );
            },
          ),
        ),
        const Divider(height: 1),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Total: \$${total.toStringAsFixed(2)}',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: FilledButton(
            onPressed:
                selectedItemsList.isNotEmpty
                    ? () {
                      _showPaymentMethodDialog(context);
                    }
                    : null,
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
            ),
            child: Text("Order ${selectedItemsList.length} items"),
          ),
        ),
      ],
    );
  }
}
