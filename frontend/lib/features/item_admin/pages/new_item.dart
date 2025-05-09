import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

@RoutePage()
class NewItemPage extends ConsumerStatefulWidget {
  const NewItemPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewItemPageState();
}

class _NewItemPageState extends ConsumerState<NewItemPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  Future<void> _submitForm(BuildContext context, WidgetRef ref) async {
    var router = AutoRouter.of(context);
    await router.navigatePath("admin/item/new/step2");
    // if (_formKey.currentState?.saveAndValidate() ?? false) {
    //   final formData = _formKey.currentState!.value;

    //   // Manually construct the complex RecipeIngredient list
    //   // We iterate through the keys managed by the recipeIngredientsProvider
    //   // and retrieve the values from the FormBuilder state using the dynamic field names.
    //   final recipeIngredientsRows = ref.read(recipeIngredientsProvider);
    //   final List<RecipeIngredient> recipeIngredients = [];

    //   for (var row in recipeIngredientsRows) {
    //     final ingredientFieldName =
    //         'recipeIngredients_${row.key}_ingredientId';
    //     final quantityFieldName = 'recipeIngredients_${row.key}_quantity';

    //     final ingredientId = formData[ingredientFieldName] as int?;
    //     final quantity =
    //         formData[quantityFieldName]
    //             as double?; // ValueTransformer already made it double

    //     if (ingredientId != null && quantity != null) {
    //       recipeIngredients.add(
    //         RecipeIngredient(ingredientId: ingredientId, quantity: quantity),
    //       );
    //     }
    //     // Note: If validation passed, ingredientId and quantity should not be null.
    //     // The null check is just a safety measure based on the type hints.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create/Edit Item')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 300.0, vertical: 8.0),
        child: FormBuilder(
          key: _formKey,
          child: Flex(
            direction: Axis.vertical,
            spacing: 16,
            children: [
              // Item Details
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Flex(
                  direction: Axis.vertical,
                  spacing: 16,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Item Details',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    FormBuilderTextField(
                      name: 'itemName',
                      decoration: const InputDecoration(labelText: 'Item Name'),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.maxLength(255),
                      ]),
                    ),
                    FormBuilderTextField(
                      name: 'description',
                      decoration: const InputDecoration(
                        labelText: 'Description',
                      ),
                      maxLines: 3,
                    ),
                    FormBuilderTextField(
                      name: 'basePrice',
                      decoration: const InputDecoration(
                        labelText: 'Base Price',
                      ),
                      keyboardType: TextInputType.number,
                      valueTransformer: (value) {
                        // Transform string input to double
                        if (value == null || value.isEmpty) return null;
                        return double.tryParse(value);
                      },
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.numeric(),
                        FormBuilderValidators.min(0),
                      ]),
                    ),
                    SizedBox(
                      width: 200,
                      child: FormBuilderSwitch(
                        name: 'isActive',
                        title: const Text('Is Active'),
                        initialValue: true, // Default to active
                      ),
                    ),
                  ],
                ),
              ),

              // const SizedBox(height: 24),

              // Container(
              //   padding: EdgeInsets.all(12),
              //   decoration: BoxDecoration(
              //     border: Border.all(color: Colors.grey),
              //     borderRadius: BorderRadius.circular(8),
              //   ),
              //   child: Flex(
              //     direction: Axis.vertical,
              //     spacing: 16,
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       // Recipe Details
              //       const Text(
              //         'Recipe Details',
              //         style: TextStyle(
              //           fontSize: 18,
              //           fontWeight: FontWeight.bold,
              //         ),
              //       ),
              //       FormBuilderTextField(
              //         name:
              //             'recipeName', // Use a different name than the object field
              //         decoration: const InputDecoration(
              //           labelText: 'Recipe Name',
              //         ),
              //         validator: FormBuilderValidators.required(),
              //       ),
              //       FormBuilderTextField(
              //         name: 'recipeDescription', // Use a different name
              //         decoration: const InputDecoration(
              //           labelText: 'Recipe Description',
              //         ),
              //         maxLines: 2,
              //       ),
              //       FormBuilderTextField(
              //         name: 'recipeInstructions', // Use a different name
              //         decoration: const InputDecoration(
              //           labelText: 'Instructions',
              //         ),
              //         maxLines: 5,
              //         validator: FormBuilderValidators.required(),
              //       ),
              //     ],
              //   ),
              // ),

              // const SizedBox(height: 24),

              // // Recipe Ingredients (Dynamic List)
              // const Text(
              //   'Recipe Ingredients',
              //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              // ),
              // const SizedBox(height: 8),

              // // Build a row for each item in the provider's state
              // // ...recipeIngredientRows.asMap().entries.map((entry) {
              // //   final index = entry.key;
              // //   final rowData = entry.value;
              // //   return RecipeIngredientRow(
              // //     key: ValueKey(
              // //       rowData.key,
              // //     ), // Important for Flutter to manage widget state efficiently
              // //     rowKey: rowData.key,
              // //     rowIndex: index,
              // //     initialIngredientId: rowData.initialIngredientId,
              // //     initialQuantity: rowData.initialQuantity,
              // //   );
              // // }).toList(),
              // Align(
              //   alignment: Alignment.centerRight,
              //   child: TextButton.icon(
              //     onPressed: () {
              //       // Add a new row using the provider
              //       // recipeIngredientRowsNotifier.addIngredientRow();
              //     },
              //     icon: const Icon(Icons.add),
              //     label: const Text('Add Ingredient'),
              //   ),
              // ),

              // const SizedBox(height: 24),

              // Submit Button
              ElevatedButton(
                onPressed: () async => await _submitForm(context, ref),
                child: const Text('Save Item'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
