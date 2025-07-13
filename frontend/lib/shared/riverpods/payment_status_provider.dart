import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:api_client/api_client.dart';
import 'package:frontend/shared/riverpods/order_items_provider.dart';

/// State class for payment status
sealed class PaymentStatusState {
  const PaymentStatusState();

  const factory PaymentStatusState.initial() = PaymentStatusInitial;
  const factory PaymentStatusState.loading() = PaymentStatusLoading;
  const factory PaymentStatusState.success(
    PaymentStatusResponse paymentStatus,
  ) = PaymentStatusSuccess;
  const factory PaymentStatusState.error(String message) = PaymentStatusError;
}

class PaymentStatusInitial extends PaymentStatusState {
  const PaymentStatusInitial();
}

class PaymentStatusLoading extends PaymentStatusState {
  const PaymentStatusLoading();
}

class PaymentStatusSuccess extends PaymentStatusState {
  final PaymentStatusResponse paymentStatus;
  const PaymentStatusSuccess(this.paymentStatus);
}

class PaymentStatusError extends PaymentStatusState {
  final String message;
  const PaymentStatusError(this.message);
}

/// StateNotifier for managing payment status polling for a specific order
class PaymentStatusNotifier extends StateNotifier<PaymentStatusState> {
  final int orderId;
  final SelectedItemsNotifier selectedItemsNotifier;
  StreamSubscription<PaymentStatusResponse>? _subscription;

  PaymentStatusNotifier({
    required this.orderId,
    required this.selectedItemsNotifier,
  }) : super(const PaymentStatusState.initial());

  /// Start polling for payment status updates
  Future<void> startPolling({
    Duration pollInterval = const Duration(seconds: 5),
    Duration timeout = const Duration(minutes: 5),
  }) async {
    // Cancel any existing subscription
    await _subscription?.cancel();

    state = const PaymentStatusState.loading();

    try {
      _subscription = selectedItemsNotifier
          .pollPaymentStatus(
            orderId,
            pollInterval: pollInterval,
            timeout: timeout,
          )
          .listen(
            (paymentStatus) {
              state = PaymentStatusState.success(paymentStatus);
            },
            onError: (error) {
              state = PaymentStatusState.error(error.toString());
            },
            onDone: () {
              // Polling completed normally (payment confirmed or timeout)
              if (state is PaymentStatusSuccess) {
                final currentStatus =
                    (state as PaymentStatusSuccess).paymentStatus;
                if (currentStatus.isPaid != true) {
                  state = PaymentStatusState.error(
                    'Payment polling completed without confirmation',
                  );
                }
              }
            },
          );
    } catch (e) {
      state = PaymentStatusState.error(e.toString());
    }
  }

  /// Stop polling for payment status
  void stopPolling() {
    _subscription?.cancel();
    _subscription = null;
  }

  /// Check payment status once without polling
  Future<void> checkOnce() async {
    state = const PaymentStatusState.loading();

    try {
      final paymentStatus = await selectedItemsNotifier.checkPaymentStatus(
        orderId,
      );

      if (paymentStatus != null) {
        state = PaymentStatusState.success(paymentStatus);
      } else {
        state = const PaymentStatusState.error(
          'Failed to check payment status',
        );
      }
    } catch (e) {
      state = PaymentStatusState.error(e.toString());
    }
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}

/// StateNotifierProvider for payment status
final paymentStatusProvider = StateNotifierProvider.family<
  PaymentStatusNotifier,
  PaymentStatusState,
  int
>((ref, orderId) {
  final selectedItemsNotifier = ref.read(
    selectedItemsNotifierProvider.notifier,
  );
  return PaymentStatusNotifier(
    orderId: orderId,
    selectedItemsNotifier: selectedItemsNotifier,
  );
});

/// Provider for managing multiple payment statuses
class PaymentStatusListNotifier
    extends StateNotifier<Map<int, PaymentStatusResponse>> {
  PaymentStatusListNotifier() : super({});

  void updatePaymentStatus(int orderId, PaymentStatusResponse status) {
    state = {...state, orderId: status};
  }

  void removeOrder(int orderId) {
    final newState = Map<int, PaymentStatusResponse>.from(state);
    newState.remove(orderId);
    state = newState;
  }

  PaymentStatusResponse? getPaymentStatus(int orderId) {
    return state[orderId];
  }
}

/// Provider for the payment status list
final paymentStatusListProvider = StateNotifierProvider<
  PaymentStatusListNotifier,
  Map<int, PaymentStatusResponse>
>((ref) => PaymentStatusListNotifier());
