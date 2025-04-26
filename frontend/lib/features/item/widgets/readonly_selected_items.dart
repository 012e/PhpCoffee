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

    // Define colors consistent with SelectedItemsSidebar
    // Use a surface container color for the background
    final Color sidebarBackgroundColor =
        Theme.of(context).colorScheme.surfaceContainer;
    // Use outline color for the border
    final Color sidebarBorderColor = Theme.of(context).colorScheme.outline;
    const double sidebarBorderWidth = 1.0;
    // Use the same logic for the total text color as in the sidebar
    final Color totalTextColor =
        Theme.of(context).textTheme.titleMedium?.color ??
        Theme.of(context).colorScheme.onSurface;
    // Text colors for title, list items, etc., will rely on the theme's TextTheme defaults.

    return Material(
      // Wrap in Material to control background and shape
      color:
          sidebarBackgroundColor, // Set the background color using theme color
      elevation: 2.0, // Optional: add some elevation for visual separation
      shape: RoundedRectangleBorder(
        // Add border using shape
        side: BorderSide(
          color: sidebarBorderColor, // Use theme-derived border color
          width: sidebarBorderWidth, // Use defined border width
        ),
        borderRadius:
            BorderRadius
                .zero, // Keep sharp corners to match typical sidebar design
      ),
      child: Column(
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
                  // Text color is handled by the theme's TextTheme.
                ),
                // Removed the "Clear Selection" button as this is read-only.
              ],
            ),
          ),
          const Divider(height: 1), // Divider color is handled by the theme.
          Expanded(
            child: ListView.builder(
              itemCount: selectedItemsList.length,
              itemBuilder: (context, index) {
                final entry = selectedItemsList[index];
                final item = entry.key;
                final amount = entry.value;

                // Display each selected item.
                return ListTile(
                  // ListTile colors (background, text) are handled by the theme.
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 4.0,
                  ),
                  leading: SizedBox(
                    width: 40,
                    height: 40,
                    // Placeholder for item image. Icon color is handled by the theme.
                    child: Image.network(
                      item.itemId
                          .toString(), // TODO: Replace with actual image URL
                      fit: BoxFit.cover,
                      errorBuilder:
                          (context, error, stackTrace) => const Icon(
                            Icons.fastfood,
                          ), // Fallback icon color is handled by the theme.
                    ),
                  ),
                  title: Text(
                    item.itemName ?? 'Unnamed',
                    style: const TextStyle(fontSize: 14),
                    // Text color is handled by the theme's TextTheme.
                  ),
                  subtitle: Text(
                    // Display price per item and total for this item.
                    '\$${item.basePrice?.toStringAsFixed(2) ?? '0.00'} x $amount = \$${((item.basePrice ?? 0) * amount).toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 12),
                    // Text color is handled by the theme's TextTheme.
                  ),
                );
              },
            ),
          ),
          const Divider(height: 1), // Divider color is handled by the theme.
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  // Text color is handled by the theme's TextTheme.
                ),
                // Display the total price.
                Text(
                  '\$${total.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: totalTextColor, // Use consistent total text color
                  ),
                ),
              ],
            ),
          ),
          // Removed the submit button as this is a read-only component.
        ],
      ),
    );
  }
}
