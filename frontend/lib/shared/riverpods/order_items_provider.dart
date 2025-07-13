import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:api_client/api_client.dart';
import 'package:frontend/shared/riverpods/items_provider.dart';
import 'package:built_collection/built_collection.dart';

part 'order_items_provider.g.dart';

typedef SelectedItemsWithAmount = Map<MenuItemResponse, int>;

@riverpod
class SelectedItemsNotifier extends _$SelectedItemsNotifier {
  @override
  Map<int, int> build() {
    ref.keepAlive();
    return {};
  }

  /// Creates an order with the currently selected items
  /// Returns the created order response
  Future<OrderResponse?> createOrder({required String paymentMethod}) async {
    if (state.isEmpty) {
      throw Exception('No items selected for order');
    }

    final api = GetIt.I<OrderApi>();
    final allItemsAsync = ref.read(itemListProvider);

    // Get the list of items to fetch unit prices
    final allItems = await allItemsAsync.when(
      data: (items) async => items,
      loading: () => throw Exception('Items are still loading'),
      error: (error, stack) => throw Exception('Failed to load items: $error'),
    );

    if (allItems == null || allItems.isEmpty) {
      throw Exception('No menu items available');
    }

    // Create a map for quick item lookup
    final itemsMap = {for (var item in allItems) item.itemId: item};

    // Build order item requests with unit prices from the menu items
    final orderItemRequests = <CreateOrderItemRequest>[];
    for (final entry in state.entries) {
      final itemId = entry.key;
      final quantity = entry.value;
      final menuItem = itemsMap[itemId];

      if (menuItem == null) {
        throw Exception('Menu item with ID $itemId not found');
      }

      orderItemRequests.add(
        CreateOrderItemRequest(
          (b) =>
              b
                ..itemId = itemId
                ..quantity = quantity
                ..unitPrice = menuItem.basePrice,
        ),
      );
    }

    // Create the order request
    final createOrderRequest = CreateOrdersRequest(
      (b) =>
          b
            ..paymentStatus =
                paymentMethod == PaymentStatus.cash
                    ? PaymentStatus.paid
                    : PaymentStatus.waitingPayment
            ..createOrderItemRequests = ListBuilder<CreateOrderItemRequest>(
              orderItemRequests,
            )
            ..createPaymentRequest =
                CreatePaymentRequest(
                  (pb) => pb..paymentMethod = paymentMethod,
                ).toBuilder(),
    );

    try {
      final response = await api.orderPost(
        createOrdersRequest: createOrderRequest,
      );

      if (response.statusCode == 201) {
        // Clear the selected items after successful order creation
        clearItems();
        return response.data;
      } else {
        throw Exception('Failed to create order: ${response.statusMessage}');
      }
    } catch (e) {
      throw Exception('Error creating order: $e');
    }
  }

  /// Polls for payment status changes using short polling
  /// Returns a stream of payment status updates
  Stream<PaymentStatusResponse> pollPaymentStatus(
    int orderId, {
    Duration pollInterval = const Duration(seconds: 5),
    Duration timeout = const Duration(minutes: 5),
  }) async* {
    final api = GetIt.I<OrderApi>();
    final startTime = DateTime.now();
    String? lastKnownStatus;

    while (DateTime.now().difference(startTime) < timeout) {
      try {
        print('Polling payment status for order $orderId...'); // Debug
        final response = await api.orderIdPaymentStatusGet(
          id: orderId,
          // No timeout parameter needed since backend now returns immediately
        );

        print(
          'Response status: ${response.statusCode}, data: ${response.data}',
        ); // Debug
        if (response.statusCode == 200 && response.data != null) {
          final paymentStatus = response.data!;

          // Only yield if status changed or if it's the first check
          if (lastKnownStatus != paymentStatus.paymentStatus) {
            print(
              'Status changed from $lastKnownStatus to ${paymentStatus.paymentStatus}',
            ); // Debug
            lastKnownStatus = paymentStatus.paymentStatus;
            yield paymentStatus;

            // Stop polling if payment is completed
            if (paymentStatus.isPaid == true) {
              print('Payment completed, stopping polling'); // Debug
              break;
            }
          } else {
            print('No status change, continuing polling...'); // Debug
          }
        }
      } catch (e) {
        print('Error during polling: $e'); // Debug
        // Handle errors gracefully - you might want to yield an error status
        yield PaymentStatusResponse(
          (b) =>
              b
                ..orderId = orderId
                ..paymentStatus = PaymentStatus.error
                ..isPaid = false
                ..message = "Error checking payment status: $e",
        );
        break;
      }

      // Wait before next poll
      await Future.delayed(pollInterval);
    }

    // If we reach here due to timeout, yield a timeout status
    if (DateTime.now().difference(startTime) >= timeout) {
      yield PaymentStatusResponse(
        (b) =>
            b
              ..orderId = orderId
              ..paymentStatus = lastKnownStatus ?? "Unknown"
              ..isPaid = false
              ..message = "Payment status polling timed out",
      );
    }
  }

  /// Checks payment status once
  /// Useful for one-time status checks
  Future<PaymentStatusResponse?> checkPaymentStatus(int orderId) async {
    final api = GetIt.I<OrderApi>();

    try {
      final response = await api.orderIdPaymentStatusGet(
        id: orderId,
        // No timeout parameter needed since backend returns immediately
      );

      if (response.statusCode == 200) {
        return response.data;
      }
      return null;
    } catch (e) {
      throw Exception('Error checking payment status: $e');
    }
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

// Vietnamese payment status constants
class PaymentStatus {
  static const String cash = "Tien mat";
  static const String bankTransfer = "Chuyen khoan";
  static const String paid = "Da thanh toan";
  static const String waitingPayment = "Doi thanh toan";
  static const String error = "Loi";
}
