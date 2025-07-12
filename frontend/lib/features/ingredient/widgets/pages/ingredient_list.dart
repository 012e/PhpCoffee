import 'package:api_client/api_client.dart';
import 'package:auto_route/auto_route.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/features/ingredient/widgets/ingredient_form.dart';
import 'package:frontend/features/ingredient/widgets/ingredient_card.dart';
import 'package:frontend/shared/riverpods/ingredient_provider.dart';
import 'package:toastification/toastification.dart';
import 'package:intl/intl.dart';

@RoutePage()
class IngredientListPage extends ConsumerStatefulWidget {
  const IngredientListPage({super.key});

  @override
  ConsumerState<IngredientListPage> createState() => _IngredientListPageState();
}

class _IngredientListPageState extends ConsumerState<IngredientListPage> {
  late TextEditingController _searchController;
  String _searchQuery = '';
  bool _isExporting = false;

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

  /// Downloads the ingredients collection as an Excel file
  Future<void> _downloadIngredientsExcel() async {
    if (_isExporting) return; // Prevent multiple concurrent exports

    setState(() {
      _isExporting = true;
    });

    try {
      // Generate a unique filename with current timestamp
      final timestamp = DateFormat('yyyyMMdd_HHmmss').format(DateTime.now());
      final fileName = 'ingredients_export_$timestamp.xlsx';

      // Call the export method from the provider
      final filePath = await ref
          .read(ingredientListProvider.notifier)
          .exportExcel(fileName: fileName);

      // Show success notification
      toastification.show(
        type: ToastificationType.success,
        title: const Text('Export Successful'),
        description: Text('Ingredients exported to: $filePath'),
        autoCloseDuration: const Duration(seconds: 5),
        primaryColor: Colors.green,
        icon: const Icon(Icons.download_done),
      );
    } catch (error) {
      // Show error notification
      toastification.show(
        type: ToastificationType.error,
        title: const Text('Export Failed'),
        description: Text('Failed to export ingredients: $error'),
        autoCloseDuration: const Duration(seconds: 5),
        primaryColor: Colors.red,
        icon: const Icon(Icons.error),
      );
    } finally {
      setState(() {
        _isExporting = false;
      });
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
                  SizedBox(
                    width: 140.0,
                    height: 50.0,
                    child: FilledButton.icon(
                      onPressed:
                          _isExporting ? null : _downloadIngredientsExcel,
                      style: FilledButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        backgroundColor:
                            _isExporting ? Colors.grey : Colors.blue.shade600,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      ),
                      icon:
                          _isExporting
                              ? const SizedBox(
                                width: 16,
                                height: 16,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              )
                              : const Icon(Icons.download, size: 18),
                      label: Text(
                        _isExporting ? 'Exporting...' : 'Download',
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  // Add Button
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
