import 'package:api_client/api_client.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/features/item/widgets/payment_card.dart';
import 'package:frontend/shared/riverpods/order_items_provider.dart';

class SelectedItemsSidebar extends ConsumerWidget {
  final SelectedItemsWithAmount selectedItemsMap;

  const SelectedItemsSidebar({super.key, required this.selectedItemsMap});

  // Centralized color variables
  static const Color _dialogBackgroundColor = Colors.transparent;
  static const Color _dialogShadowColor = Colors.black26;
  // Using theme color for sidebar border (defined in build method)
  static const double _sidebarBorderWidth = 1.0;

  void _handleItemSecondaryTap(WidgetRef ref, MenuItemResponse item) {
    final itemId = item.itemId;
    if (itemId == null) return;

    ref.read(selectedItemsNotifierProvider.notifier).decrementItem(itemId);
  }

  void _clearSelections(WidgetRef ref) {
    ref.read(selectedItemsNotifierProvider.notifier).clearItems();
  }

  void _showPaymentMethodDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          elevation: 16.0,
          backgroundColor: _dialogBackgroundColor,
          child: _buildPaymentMethodContent(context),
        );
      },
    );
  }

  Widget _buildPaymentMethodContent(BuildContext context) {
    final router = AutoRouter.of(context);
    final Color dialogContainerColor = Theme.of(context).cardColor;

    return Container(
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.only(top: 8.0),
      decoration: BoxDecoration(
        color: dialogContainerColor,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: _dialogShadowColor,
            blurRadius: 10.0,
            offset: const Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Payment Method",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
              color: Theme.of(context).textTheme.titleLarge?.color,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            "Select a payment method to proceed with the order.",
            style: TextStyle(
              fontSize: 14.0,
              color: Theme.of(context).textTheme.bodyMedium?.color,
            ),
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
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
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
      return const SizedBox.shrink();
    }

    var total = selectedItemsMap.entries.fold(
      0.0,
      (sum, entry) => sum + ((entry.key.basePrice ?? 0) * entry.value),
    );

    final Color removeIconColor = Theme.of(context).colorScheme.error;
    final Color totalTextColor =
        Theme.of(context).textTheme.titleMedium?.color ??
        Theme.of(context).colorScheme.onSurface;
    final Color sidebarBackgroundColor =
        Theme.of(context).colorScheme.surfaceContainer;
    // Define sidebar border color using theme
    final Color sidebarBorderColor = Theme.of(context).colorScheme.outline;

    return Material(
      color: sidebarBackgroundColor,
      elevation: 2.0,
      // Add border using shape
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: sidebarBorderColor, // Use theme-derived border color
          width: _sidebarBorderWidth, // Use defined border width
        ),
        borderRadius: BorderRadius.zero, // Keep sharp corners
      ),
      child: Column(
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
                  onPressed: () => _clearSelections(ref),
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
                          .toString(), // TODO: Verify this is the correct image URL
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
                    '\$${item.basePrice?.toStringAsFixed(2) ?? '0.00'} x $amount = \$${((item.basePrice ?? 0) * amount).toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 12),
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.remove_circle_outline,
                      color: removeIconColor,
                    ),
                    onPressed: () => _handleItemSecondaryTap(ref, item),
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
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: totalTextColor,
              ),
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
      ),
    );
  }
}
