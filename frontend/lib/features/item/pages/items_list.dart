import 'package:auto_route/auto_route.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/features/item/widgets/item_card.dart';
import 'package:frontend/shared/riverpods/items_provider.dart';
import 'package:api_client/api_client.dart';
import 'package:frontend/shared/riverpods/order_items_provider.dart';
import 'package:frontend/features/item/widgets/selected_items_sidebar.dart';

@RoutePage()
class ItemsListPage extends ConsumerStatefulWidget {
  // Keep this callback if the parent widget needs to react to selection changes
  final Function(SelectedItemsWithAmount selectedItems)? onSelectionChanged;

  const ItemsListPage({super.key, this.onSelectionChanged});

  @override
  ConsumerState<ItemsListPage> createState() => _ItemsListState();
}

class _ItemsListState extends ConsumerState<ItemsListPage> {
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
    final itemId = item.itemId;
    if (itemId == null) return;

    ref.read(selectedItemsNotifierProvider.notifier).addItem(itemId);
  }

  void _handleItemSecondaryTap(MenuItemResponse item) {
    final itemId = item.itemId;
    if (itemId == null) return;

    ref.read(selectedItemsNotifierProvider.notifier).decrementItem(itemId);
  }

  Widget _buildItemGrid(BuiltList<MenuItemResponse> items) {
    final selectedIdsWithAmount = ref.watch(selectedItemsNotifierProvider);

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
        final amount = selectedIdsWithAmount[item.itemId] ?? 0;
        return ItemCard(
          item: item,
          key: ValueKey(item.itemId),
          amount: amount,
          onTap: () => _handleItemTap(item),
          onSecondaryTap: () => _handleItemSecondaryTap(item),
        );
      },
    );
  }

  // Removed the _buildSidebar method

  @override
  Widget build(BuildContext context) {
    final asyncItems = ref.watch(itemListProvider);
    final selectedItemsMap = ref.watch(selectedItemsWithDetailsProvider);

    ref.listen<SelectedItemsWithAmount>(selectedItemsWithDetailsProvider, (
      previousSelectedItems,
      newSelectedItems,
    ) {
      if (widget.onSelectionChanged != null) {
        widget.onSelectionChanged!(newSelectedItems);
      }
    });

    return asyncItems.when(
      data: (items) {
        if (items == null || items.isEmpty) {
          return const Center(child: Text('No menu items available'));
        }

        return Row(
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8),
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
                          child: SelectedItemsSidebar(
                            selectedItemsMap: selectedItemsMap,
                          ),
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
