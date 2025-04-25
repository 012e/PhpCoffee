import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/features/item/widgets/readonly_selected_items.dart';
import 'package:frontend/shared/riverpods/order_items_provider.dart';

@RoutePage()
class OrderPage extends ConsumerWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedItems = ref.watch(selectedItemsWithDetailsProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order"),
        leading: AutoLeadingButton(showIfParentCanPop: false),
      ),
      body: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(flex: 1, child: Image.asset('assets/placeholder/qr.png')),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(12),
              ),
              margin: EdgeInsets.all(90),
              child: ReadonlySelectedItems(selectedItemsMap: selectedItems),
            ),
          ),
        ],
      ),
    );
  }
}
