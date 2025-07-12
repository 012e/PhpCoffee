import 'package:api_client/api_client.dart';
import 'package:auto_route/auto_route.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/features/ingredient/widgets/ingredient_form.dart';
import 'package:frontend/features/item_admin/riverpods/selected_ingredients.dart';
import 'package:frontend/features/item_admin/widgets/item_card.dart';
import 'package:frontend/features/item_admin/riverpods/menu_item_form_data.dart';
import 'package:frontend/shared/riverpods/ingredient_provider.dart';
import 'package:frontend/shared/riverpods/items_provider.dart';
import 'package:toastification/toastification.dart';

@RoutePage()
class SelectIngredientsPage extends ConsumerStatefulWidget {
  const SelectIngredientsPage({super.key});
  @override
  ConsumerState<SelectIngredientsPage> createState() =>
      _SelectIngredientsListPageState();
}

class _SelectIngredientsListPageState
    extends ConsumerState<SelectIngredientsPage> {
  late TextEditingController _searchController;
  String _searchQuery = '';
  bool _isCreating = false;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _createMenuItem() async {
    setState(() {
      _isCreating = true;
    });

    try {
      final formData = ref.read(menuItemFormDataNotifierProvider);
      final selectedIngredients = ref.read(selectedIngredientsProvider);

      // Validate that we have selected ingredients
      if (selectedIngredients.isEmpty) {
        toastification.show(
          title: const Text('No ingredients selected'),
          description: const Text('Please select at least one ingredient'),
          type: ToastificationType.warning,
          autoCloseDuration: const Duration(seconds: 3),
        );
        return;
      }

      // Create recipe ingredients list
      final recipeIngredients =
          selectedIngredients.entries
              .where((entry) => entry.value > 0)
              .map(
                (entry) => CreateRecipeIngredientRequest(
                  (b) =>
                      b
                        ..ingredientId = entry.key
                        ..quantity = entry.value.toDouble(),
                ),
              )
              .toList();

      // Create the recipe request
      final recipeRequest = CreateRecipeRequest(
        (b) =>
            b
              ..name = '${formData.itemName} Recipe'
              ..description =
                  formData.description.isEmpty
                      ? 'Recipe for ${formData.itemName}'
                      : 'Recipe for ${formData.itemName}: ${formData.description}'
              ..instructions =
                  'Standard preparation procedure for ${formData.itemName}. '
                  'Use the selected ingredients in the specified quantities.'
              ..recipeIngredients.replace(recipeIngredients),
      );

      // Create the menu item request
      final createRequest = CreateMenuItemRequest(
        (b) =>
            b
              ..itemName = formData.itemName
              ..description = formData.description
              ..basePrice = formData.basePrice
              ..isActive = formData.isActive
              ..recipe.replace(recipeRequest),
      );

      // Submit to API
      await ref.read(itemListProvider.notifier).createMenuItem(createRequest);

      // Clear form data and selected ingredients
      ref.read(menuItemFormDataNotifierProvider.notifier).reset();
      ref.read(selectedIngredientsProvider.notifier).clear();

      // Show success message
      toastification.show(
        title: const Text('Success'),
        description: Text('${formData.itemName} has been created successfully'),
        type: ToastificationType.success,
        autoCloseDuration: const Duration(seconds: 3),
      );

      // Navigate back to item list
      if (mounted) {
        context.router.navigatePath('/admin/item');
      }
    } catch (e) {
      toastification.show(
        title: const Text('Error'),
        description: Text('Failed to create menu item: $e'),
        type: ToastificationType.error,
        autoCloseDuration: const Duration(seconds: 5),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isCreating = false;
        });
      }
    }
  }

  BuiltList<IngredientResponse> _filterIngredients(
    BuiltList<IngredientResponse> ingredients,
  ) {
    if (_searchQuery.isEmpty) {
      return ingredients;
    }
    return ingredients.where((ingredient) {
      final ingredientName = ingredient.ingredientName?.toLowerCase() ?? '';
      return ingredientName.contains(_searchQuery.toLowerCase());
    }).toBuiltList();
  }

  @override
  Widget build(BuildContext context) {
    final ingredientListAsyncValue = ref.watch(ingredientListProvider);
    final ingredientCounts = ref.watch(selectedIngredientsProvider);
    final formData = ref.watch(menuItemFormDataNotifierProvider);

    final Color addButtonBackgroundColor =
        Theme.of(context).colorScheme.secondaryContainer;
    final Color addButtonForegroundColor =
        Theme.of(context).colorScheme.onSecondaryContainer;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Build Recipe'),
        actions: [
          TextButton.icon(
            onPressed: _isCreating ? null : _createMenuItem,
            icon:
                _isCreating
                    ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                    : const Icon(Icons.check),
            label: Text(_isCreating ? 'Creating...' : 'Create Item'),
            style: TextButton.styleFrom(foregroundColor: Colors.green),
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => context.router.pop(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ingredientListAsyncValue.when(
          data: (ingredients) {
            final filteredIngredients = _filterIngredients(ingredients);

            return Column(
              children: [
                // Menu Item Summary Card
                Card(
                  margin: const EdgeInsets.only(bottom: 16.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Creating: ${formData.itemName}',
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        if (formData.description.isNotEmpty) ...[
                          const SizedBox(height: 4),
                          Text(
                            formData.description,
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium?.copyWith(
                              color:
                                  Theme.of(context).textTheme.bodySmall?.color,
                            ),
                          ),
                        ],
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Price: \$${formData.basePrice.toStringAsFixed(2)}',
                              style: Theme.of(
                                context,
                              ).textTheme.titleMedium?.copyWith(
                                color: Colors.green,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color:
                                    formData.isActive
                                        ? Colors.green
                                        : Colors.red,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                formData.isActive ? 'Active' : 'Inactive',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        if (ingredientCounts.isNotEmpty) ...[
                          const SizedBox(height: 8),
                          Text(
                            'Selected Ingredients: ${ingredientCounts.values.where((count) => count > 0).length}',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: 'Search Ingredients...',
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 15.0,
                            horizontal: 10.0,
                          ),
                        ),
                        onChanged: (query) {
                          setState(() {
                            _searchQuery = query;
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    SizedBox(
                      width: 120.0,
                      height: 50.0,
                      child: FilledButton(
                        onPressed: () async {
                          await showIngredientFormDialog(context);
                        },
                        style: FilledButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          backgroundColor: addButtonBackgroundColor,
                          foregroundColor: addButtonForegroundColor,
                          padding: EdgeInsets.zero,
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add),
                            SizedBox(width: 4.0),
                            Text('Add'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                // Help text
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Tap to add • Right-click to remove • Long-press to set quantity',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(
                        context,
                      ).textTheme.bodySmall?.color?.withValues(alpha: 0.7),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    itemCount: filteredIngredients.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5,
                          childAspectRatio: 0.75,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                    itemBuilder: (context, index) {
                      final ingredient = filteredIngredients[index];
                      return IngredientCard(
                        ingredient: ingredient,
                        amount: ingredientCounts[ingredient.ingredientId] ?? 0,
                        onTap:
                            () => ref
                                .read(selectedIngredientsProvider.notifier)
                                .addIngredient(ingredient.ingredientId!),
                        onSecondaryTap:
                            () => ref
                                .read(selectedIngredientsProvider.notifier)
                                .removeIngredient(ingredient.ingredientId!),
                        onQuantityChanged:
                            (newQuantity) => ref
                                .read(selectedIngredientsProvider.notifier)
                                .setIngredientQuantity(
                                  ingredient.ingredientId!,
                                  newQuantity,
                                ),
                        key: ValueKey(ingredient.ingredientId),
                      );
                    },
                  ),
                ),
              ],
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(child: Text('Error: $error')),
        ),
      ),
    );
  }
}
