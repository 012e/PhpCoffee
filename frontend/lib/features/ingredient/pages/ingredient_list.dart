import 'package:api_client/api_client.dart';
import 'package:auto_route/auto_route.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/features/ingredient/widgets/ingredient_card.dart';
import 'package:frontend/shared/riverpods/ingredient_provider.dart';

@RoutePage()
class IngredientListPage extends ConsumerStatefulWidget {
  // Convert to stateful widget
  const IngredientListPage({super.key});

  @override
  ConsumerState<IngredientListPage> createState() => _IngredientListPageState();
}

class _IngredientListPageState extends ConsumerState<IngredientListPage> {
  // Controller for the search text field
  late TextEditingController _searchController;
  // State variable to hold the current search query
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    // Dispose the controller when the widget is removed
    _searchController.dispose();
    super.dispose();
  }

  // Method to filter ingredients based on the search query
  BuiltList<IngredientResponse> _filterIngredients(
    BuiltList<IngredientResponse> ingredients,
  ) {
    if (_searchQuery.isEmpty) {
      return ingredients; // If query is empty, show all ingredients
    }
    // Filter ingredients where the name contains the search query (case-insensitive)
    return ingredients.where((ingredient) {
      final ingredientName = ingredient.ingredientName?.toLowerCase() ?? '';
      return ingredientName.contains(_searchQuery.toLowerCase());
    }).toBuiltList();
  }

  @override
  Widget build(BuildContext context) {
    // Watch the ingredient list provider
    final ingredientListAsyncValue = ref.watch(ingredientListProvider);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ingredientListAsyncValue.when(
        data: (ingredients) {
          // Filter the ingredients based on the current search query
          final filteredIngredients = _filterIngredients(ingredients);

          return Column(
            children: [
              // Search Bar
              TextField(
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
                  // Update the search query and trigger a rebuild
                  setState(() {
                    _searchQuery = query;
                  });
                },
              ),
              const SizedBox(height: 16.0),
              // GridView showing filtered ingredients
              Expanded(
                child: GridView.builder(
                  itemCount:
                      filteredIngredients
                          .length, // Use the count of filtered ingredients
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    final ingredient =
                        filteredIngredients[index]; // Use the filtered list
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
