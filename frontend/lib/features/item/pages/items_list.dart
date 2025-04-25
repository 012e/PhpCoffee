import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/features/item/widgets/item_card.dart';
import 'package:frontend/shared/riverpods/items_provider.dart';
import 'package:api_client/api_client.dart';

class ItemsList extends ConsumerStatefulWidget {
  final Function(List<MenuItemResponse>)? onSelectionChanged;
  const ItemsList({super.key, this.onSelectionChanged});

  @override
  ConsumerState<ItemsList> createState() => _ItemsListState();
}

class _ItemsListState extends ConsumerState<ItemsList> {
  // Set to track selected item IDs
  final Set<int> _selectedItemIds = {};

  void _toggleItemSelection(MenuItemResponse item) {
    setState(() {
      final itemId = item.itemId;
      if (_selectedItemIds.contains(itemId)) {
        _selectedItemIds.remove(itemId);
      } else {
        _selectedItemIds.add(itemId!);
      }
      // Notify parent about selection changes if callback is provided
      if (widget.onSelectionChanged != null) {
        final asyncItems = ref.read(itemListProvider);
        asyncItems.whenData((items) {
          if (items != null) {
            final selectedItems =
                items
                    .where((item) => _selectedItemIds.contains(item.itemId))
                    .toList();
            widget.onSelectionChanged!(selectedItems);
          }
        });
      }
    });
  }

  // Public method to get all currently selected items
  BuiltList<MenuItemResponse> _getSelectedItems(
    BuiltList<MenuItemResponse> allItems,
  ) {
    return allItems
        .where((item) => _selectedItemIds.contains(item.itemId))
        .toBuiltList();
  }

  // Public method to clear all selections
  void clearSelections() {
    setState(() {
      _selectedItemIds.clear();
      // Notify parent about cleared selection
      if (widget.onSelectionChanged != null) {
        widget.onSelectionChanged!([]);
      }
    });
  }

  Widget _buildItemGrid(BuiltList<MenuItemResponse> items) {
    return GridView.builder(
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        childAspectRatio: 0.75,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        final item = items[index];
        final isSelected = _selectedItemIds.contains(item.itemId);
        return ItemCard(
          item: item,
          key: ValueKey(item.itemId),
          isSelected: isSelected,
          onTap: () => _toggleItemSelection(item),
        );
      },
    );
  }

  Widget _buildSidebar(BuiltList<MenuItemResponse> selectedItems) {
    if (selectedItems.isEmpty) {
      return const SizedBox.shrink();
    }

    // Sidebar to show selected items

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Selected Items (${selectedItems.length})',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: clearSelections,
                tooltip: 'Clear Selection',
              ),
            ],
          ),
        ),
        const Divider(height: 1),
        Expanded(
          child: ListView.builder(
            itemCount: selectedItems.length,
            itemBuilder: (context, index) {
              final item = selectedItems[index];
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
                  '\$${item.basePrice?.toStringAsFixed(2) ?? '0.00'}',
                  style: const TextStyle(fontSize: 12),
                ),
                trailing: IconButton(
                  icon: const Icon(
                    Icons.remove_circle_outline,
                    color: Colors.red,
                  ),
                  onPressed: () => _toggleItemSelection(item),
                  tooltip: 'Remove',
                ),
              );
            },
          ),
        ),
        const Divider(height: 1),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Total: \$${selectedItems.fold(0.0, (sum, item) => sum + (item.basePrice ?? 0)).toStringAsFixed(2)}',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final asyncItems = ref.watch(itemListProvider);

    return asyncItems.when(
      data: (items) {
        if (items == null || items.isEmpty) {
          return const Center(child: Text('No menu items available'));
        }

        // Get selected items for the sidebar
        final selectedItems = _getSelectedItems(items);

        return Row(
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: _buildItemGrid(items),
              ),
            ),

            // Animated sidebar
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (Widget child, Animation<double> animation) {
                final offsetAnimation = Tween<Offset>(
                  begin: const Offset(1, 0),
                  end: Offset.zero,
                ).animate(animation);
                return SlideTransition(position: offsetAnimation, child: child);
              },
              child:
                  _selectedItemIds.isNotEmpty
                      ? SizedBox(
                        key: const ValueKey('sidebar'),
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            border: Border(
                              left: BorderSide(
                                color: Colors.grey.shade300,
                                width: 1,
                              ),
                            ),
                          ),
                          child: _buildSidebar(selectedItems),
                        ),
                      )
                      : const SizedBox(key: ValueKey('empty'), width: 0),
            ),
          ],
        );
      },
      error: (e, s) => const Center(child: Text('Error loading items')),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
