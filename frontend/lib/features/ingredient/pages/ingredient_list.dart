import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/features/ingredient/widgets/ingredient_card.dart';
import 'package:frontend/shared/riverpods/ingredient_provider.dart';

@RoutePage()
class IngredientListPage extends ConsumerWidget {
  const IngredientListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ingredientList = ref.watch(ingredientListProvider);
    return ingredientList.when(
      data: (ingredients) {
        return GridView.builder(
          itemCount: ingredients.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            childAspectRatio: 0.75,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            final ingredient = ingredients[index];
            return IngredientCard(
              ingredient: ingredient,
              key: ValueKey(ingredient.ingredientId),
              // onTap: () => _handleItemTap(ingredient),
              // onSecondaryTap: () => _handleItemSecondaryTap(ingredient),
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('Error: $error')),
    );
  }
}
