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

    // Calculate the total amount
    final total = selectedItems.entries.fold(
      0.0,
      (sum, entry) => sum + ((entry.key.basePrice ?? 0) * entry.value),
    );

    // Convert total to integer (multiplied by 1000 as specified)
    final totalAmount = (total * 1000).toInt();

    // Generate QR code URL
    final qrUrl =
        'https://qr.sepay.vn/img?acc=96247R3YHR&bank=BIDV&amount=$totalAmount&des=CK';

    return Scaffold(
      appBar: AppBar(
        title: const Text("Order"),
        leading: AutoLeadingButton(showIfParentCanPop: false),
      ),
      body: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
            flex: 1,
            child: Image.network(
              qrUrl,
              fit: BoxFit.contain,
              errorBuilder:
                  (context, error, stackTrace) =>
                      const Center(child: Icon(Icons.qr_code, size: 100)),
            ),
          ),
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
