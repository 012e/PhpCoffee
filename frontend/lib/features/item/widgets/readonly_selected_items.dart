import 'package:flutter/material.dart';
import 'package:frontend/shared/riverpods/order_items_provider.dart';

class ReadonlySelectedItems extends StatelessWidget {
  final SelectedItemsWithAmount selectedItemsMap;

  const ReadonlySelectedItems({super.key, required this.selectedItemsMap});

  @override
  Widget build(BuildContext context) {
    final selectedItemsList = selectedItemsMap.entries.toList();

    if (selectedItemsList.isEmpty) {
      return const SizedBox.shrink();
    }

    // Calculate the total price of the selected items.
    final total = selectedItemsMap.entries.fold(
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
              // Display the title with the count of selected items.
              Text(
                'Selected Items (${selectedItemsList.length})',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              // Removed the "Clear Selection" button as this is read-only.
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

              // Display each selected item.
              return ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 4.0,
                ),
                leading: SizedBox(
                  width: 40,
                  height: 40,
                  // Placeholder for item image.
                  child: Image.network(
                    item.itemId
                        .toString(), // TODO: Replace with actual image URL
                    fit: BoxFit.cover,
                    errorBuilder:
                        (context, error, stackTrace) =>
                            const Icon(Icons.fastfood), // Fallback icon
                  ),
                ),
                title: Text(
                  item.itemName ?? 'Unnamed',
                  style: const TextStyle(fontSize: 14),
                ),
                subtitle: Text(
                  // Display price per item and total for this item.
                  '\$${item.basePrice?.toStringAsFixed(2) ?? '0.00'} x $amount = \$${((item.basePrice ?? 0) * amount).toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 12),
                ),
                // Removed the trailing IconButton to decrease the item amount
                // as this component is read-only.
              );
            },
          ),
        ),
        const Divider(height: 1),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              // Display the total price.
              Text(
                '\$${total.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        // Removed the submit button as this is a read-only component.
      ],
    );
  }
}
