import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:api_client/api_client.dart';
import 'package:frontend/shared/riverpods/items_provider.dart'; // Assuming items_provider is here

part 'order_items_provider.g.dart';

typedef SelectedItemsWithAmount = Map<MenuItemResponse, int>;

/// A Notifier that manages the selected menu items by their ID and amount.
/// The state is Map<int, int> where the key is itemId and the value is amount.
@riverpod
class SelectedItemsNotifier extends _$SelectedItemsNotifier {
  @override
  Map<int, int> build() {
    // Initial state is an empty map
    return {};
  }

  /// Increments the amount of a selected item or adds it if not selected.
  void addItem(int itemId) {
    state = {
      ...state, // Copy existing state
      itemId: (state[itemId] ?? 0) + 1, // Increment or set to 1
    };
  }

  /// Decrements the amount of a selected item. Removes the item if amount becomes 0 or less.
  void decrementItem(int itemId) {
    if (!state.containsKey(itemId)) {
      return; // Item not selected, nothing to do
    }

    int currentAmount = state[itemId] ?? 0;
    if (currentAmount > 1) {
      state = {...state, itemId: currentAmount - 1};
    } else {
      // Amount is 1 or less, remove the item
      state = Map.from(state)..remove(itemId); // Create new map and remove
    }
  }

  /// Clears all selected items.
  void clearItems() {
    state = {}; // Set state to an empty map
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
