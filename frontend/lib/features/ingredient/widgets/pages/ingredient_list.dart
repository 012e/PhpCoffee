import 'package:api_client/api_client.dart';
import 'package:auto_route/auto_route.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/features/ingredient/widgets/ingredient_form.dart';
import 'package:frontend/features/ingredient/widgets/ingredient_card.dart';
import 'package:frontend/shared/riverpods/ingredient_provider.dart';

@RoutePage()
class IngredientListPage extends ConsumerStatefulWidget {
  const IngredientListPage({super.key});

  @override
  ConsumerState<IngredientListPage> createState() => _IngredientListPageState();
}

class _IngredientListPageState extends ConsumerState<IngredientListPage> {
  late TextEditingController _searchController;
  String _searchQuery = '';

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

    final Color addButtonBackgroundColor =
        Theme.of(context).colorScheme.secondaryContainer;
    final Color addButtonForegroundColor =
        Theme.of(context).colorScheme.onSecondaryContainer;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ingredientListAsyncValue.when(
        data: (ingredients) {
          final filteredIngredients = _filterIngredients(ingredients);

          return Column(
            children: [
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
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  itemCount: filteredIngredients.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    final ingredient = filteredIngredients[index];
                    return IngredientCard(
                      ingredient: ingredient,
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
    );
  }
}
