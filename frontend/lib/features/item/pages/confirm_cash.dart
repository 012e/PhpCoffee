import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter/material.dart';
import 'package:frontend/shared/riverpods/items_provider.dart';
import 'package:frontend/shared/riverpods/order_items_provider.dart';

@RoutePage()
class ConfirmCashPaymentPage extends ConsumerWidget {
  const ConfirmCashPaymentPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedItems = ref.watch(selectedItemsNotifierProvider);
    final router = AutoRouter.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Confirm Cash Payment"),
        leading: AutoLeadingButton(showIfParentCanPop: false),
      ),
      body: Center(
        child: FilledButton.icon(
          style: FilledButton.styleFrom(
            iconSize: 200,
            padding: const EdgeInsets.all(20),
            backgroundColor: Colors.green,
          ),
          onPressed: () async {
            await ref
                .read(itemListProvider.notifier)
                .placeCashOrder(selectedItems);
            ref.read(selectedItemsNotifierProvider.notifier).clearItems();
            router.navigatePath("/items");
          },
          label: Text("Paid", style: TextStyle(fontSize: 130)),
          icon: Icon(Icons.add_circle_outline_rounded),
        ),
      ),
    );
  }
}
