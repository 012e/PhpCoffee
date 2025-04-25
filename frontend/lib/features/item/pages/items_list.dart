import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/features/item/widgets/item_card.dart';
import 'package:frontend/shared/riverpods/items_provider.dart';
import 'package:api_client/api_client.dart';

// Define a type for the selected items with amount
typedef SelectedItemsWithAmount = Map<MenuItemResponse, int>;

class ItemsList extends ConsumerStatefulWidget {
  // Updated the callback signature to provide selected items with their amounts
  final Function(SelectedItemsWithAmount selectedItems)? onSelectionChanged;

  const ItemsList({super.key, this.onSelectionChanged});

  @override
  ConsumerState<ItemsList> createState() => _ItemsListState();
}

class _ItemsListState extends ConsumerState<ItemsList> {
  // Use a Map to store item ID and its amount
  final Map<int, int> _selectedItemIdsWithAmount = {};
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      _searchQuery = _searchController.text.toLowerCase();
    });
  }

  void _handleItemTap(MenuItemResponse item) {
    setState(() {
      final itemId = item.itemId;
      if (itemId == null) return; // Cannot select item without ID

      if (_selectedItemIdsWithAmount.containsKey(itemId)) {
        // If item is already selected, increment the amount
        _selectedItemIdsWithAmount[itemId] =
            (_selectedItemIdsWithAmount[itemId] ?? 0) + 1;
      } else {
        // If item is not selected, add it with amount 1
        _selectedItemIdsWithAmount[itemId] = 1;
      }
    });
    _notifySelectionChanged();
  }

  void _decrementItemAmount(MenuItemResponse item) {
    setState(() {
      final itemId = item.itemId;
      if (itemId == null) return;

      if (_selectedItemIdsWithAmount.containsKey(itemId)) {
        int currentAmount = _selectedItemIdsWithAmount[itemId] ?? 0;
        if (currentAmount > 1) {
          // Decrease amount if greater than 1
          _selectedItemIdsWithAmount[itemId] = currentAmount - 1;
        } else {
          // Remove item if amount is 1
          _selectedItemIdsWithAmount.remove(itemId);
        }
      }
    });
    _notifySelectionChanged();
  }

  void _notifySelectionChanged() {
    if (widget.onSelectionChanged != null) {
      final asyncItems = ref.read(itemListProvider);
      asyncItems.whenData((items) {
        if (items != null) {
          // Build the map of selected items with their current amounts
          final SelectedItemsWithAmount selectedItemsMap = {};
          for (final itemId in _selectedItemIdsWithAmount.keys) {
            final item = items.firstWhere((item) => item.itemId == itemId);
            selectedItemsMap[item] = _selectedItemIdsWithAmount[itemId] ?? 0;
          }
          widget.onSelectionChanged!(selectedItemsMap);
        }
      });
    }
  }

  void clearSelections() {
    setState(() {
      _selectedItemIdsWithAmount.clear();
    });
    _notifySelectionChanged();
  }

  Widget _buildItemGrid(BuiltList<MenuItemResponse> items) {
    final filteredItems =
        items.where((item) {
          return item.itemName?.toLowerCase().contains(_searchQuery) ?? false;
        }).toBuiltList();

    if (filteredItems.isEmpty) {
      return const Center(child: Text('No matching items found'));
    }

    return GridView.builder(
      itemCount: filteredItems.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        childAspectRatio: 0.75,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        final item = filteredItems[index];
        // Get the amount for this item from the selected items map
        final amount = _selectedItemIdsWithAmount[item.itemId] ?? 0;
        return ItemCard(
          item: item,
          key: ValueKey(item.itemId),
          amount: amount, // Pass the amount to ItemCard
          onTap: () => _handleItemTap(item),
        );
      },
    );
  }

  Widget _buildSidebar(SelectedItemsWithAmount selectedItemsMap) {
    final selectedItemsList = selectedItemsMap.entries.toList();

    if (selectedItemsList.isEmpty) {
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
                'Selected Items (${selectedItemsList.length})',
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
                  onPressed: () => _decrementItemAmount(item),
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
            'Total: \$${selectedItemsMap.entries.fold(0.0, (sum, entry) => sum + ((entry.key.basePrice ?? 0) * entry.value)).toStringAsFixed(2)}',
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

        // Construct the map of selected items with amounts for the sidebar
        final SelectedItemsWithAmount selectedItemsMap = {};
        for (final itemId in _selectedItemIdsWithAmount.keys) {
          final item = items.firstWhere((item) => item.itemId == itemId);
          selectedItemsMap[item] = _selectedItemIdsWithAmount[itemId] ?? 0;
        }

        return Row(
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8), // Use const
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 4.0,
                      ),
                      child: TextField(
                        controller: _searchController,
                        decoration: const InputDecoration(
                          labelText: 'Search items',
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _buildItemGrid(items),
                      ),
                    ),
                  ],
                ),
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
                  selectedItemsMap.isNotEmpty
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
                          child: _buildSidebar(selectedItemsMap),
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
