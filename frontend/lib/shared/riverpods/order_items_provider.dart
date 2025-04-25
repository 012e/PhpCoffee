import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:api_client/api_client.dart';
import 'package:frontend/shared/riverpods/items_provider.dart'; // Assuming items_provider is here

part 'order_items_provider.g.dart';

typedef SelectedItemsWithAmount = Map<MenuItemResponse, int>;

@riverpod
class SelectedItemsNotifier extends _$SelectedItemsNotifier {
  @override
  Map<int, int> build() {
    return {};
  }

  void addItem(int itemId) {
    state = {
      ...state,
      itemId: (state[itemId] ?? 0) + 1, // Increment or set to 1
    };
  }

  void decrementItem(int itemId) {
    if (!state.containsKey(itemId)) {
      return;
    }

    int currentAmount = state[itemId] ?? 0;
    if (currentAmount > 1) {
      state = {...state, itemId: currentAmount - 1};
    } else {
      state = Map.from(state)..remove(itemId);
    }
  }

  void clearItems() {
    state = {};
  }
}

/// A provider that combines the selected item IDs and amounts
/// with the actual MenuItemResponse objects from the item list provider.
@riverpod
SelectedItemsWithAmount selectedItemsWithDetails(Ref ref) {
  // Watch the selected item IDs and amounts state
  final selectedIdsWithAmount = ref.watch(selectedItemsNotifierProvider);

  // Watch the list of all menu items (assuming this is the source of MenuItemResponse objects)
  final asyncItems = ref.watch(itemListProvider);

  // Handle different states of the item list provider
  return asyncItems.when(
    data: (items) {
      if (items == null || items.isEmpty) {
        // If no items available, selected items map should be empty
        return {};
      }

      final SelectedItemsWithAmount selectedItemsMap = {};
      final currentItemsMap = {for (var item in items) item.itemId: item};

      // Iterate through selected item IDs and build the map with details
      // .toList() is important to avoid concurrent modification if selectedIdsWithAmount changes during iteration
      for (final itemId in selectedIdsWithAmount.keys.toList()) {
        final item = currentItemsMap[itemId];
        final amount = selectedIdsWithAmount[itemId] ?? 0;

        // Only include items that still exist in the main item list
        if (item != null && amount > 0) {
          selectedItemsMap[item] = amount;
        } else if (item == null) {
          // Optional: Clean up selected state if an item is no longer in the list
          // This is safe because we are iterating on a .toList() copy
          ref
              .read(selectedItemsNotifierProvider.notifier)
              .decrementItem(itemId);
        }
      }

      return selectedItemsMap;
    },
    loading: () {
      // While items are loading, return an empty map for selected items
      return {};
    },
    error: (e, s) {
      // If item list loading failed, return an empty map for selected items
      throw 'Error fetching items for selected details: $e';
    },
  );
}
