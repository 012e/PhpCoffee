import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class IngredientPage extends ConsumerWidget {
  const IngredientPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AutoRouter();
  }
}
