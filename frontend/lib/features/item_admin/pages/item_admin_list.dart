import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class ItemAdminListPage extends ConsumerStatefulWidget {
  const ItemAdminListPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ItemAdminListState();
}

class _ItemAdminListState extends ConsumerState<ItemAdminListPage> {
  @override
  Widget build(BuildContext context) {
    var router = AutoRouter.of(context);
    return Center(
      child: MaterialButton(
        child: Text("Create New Item"),
        onPressed: () async {
          await router.navigatePath("/admin/item/new");
        },
      ),
    );
  }
}
