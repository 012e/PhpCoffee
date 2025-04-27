import 'package:api_client/api_client.dart';
import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:frontend/shared/riverpods/ingredient_provider.dart';
import 'package:toastification/toastification.dart';

class CreateIngredientDialog extends ConsumerStatefulWidget {
  const CreateIngredientDialog({super.key});

  @override
  ConsumerState<CreateIngredientDialog> createState() =>
      _CreateIngredientDialogState();
}

class _CreateIngredientDialogState
    extends ConsumerState<CreateIngredientDialog> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isLoading = false;
  late final StackRouter _router;

  @override
  void initState() {
    super.initState();
    _formKey.currentState?.reset();
    _router = AutoRouter.of(context);
  }

  void _submitForm() async {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      final formData = _formKey.currentState!.value;

      setState(() {
        _isLoading = true;
      });

      debugPrint('Form data: $formData');
      final CreateIngredientRequest createIngredientRequest =
          CreateIngredientRequest(
            (b) =>
                b
                  ..name = formData['name'] as String
                  ..ingredientName = formData['ingredientName'] as String
                  ..unit = formData['unit'] as String
                  ..currentQuantity = double.parse(formData['currentQuantity'])
                  ..quantity = double.parse(formData['quantity'])
                  ..supplierId = int.parse(formData['supplierId']),
          );

      try {
        final createdResponse = await ref
            .read(ingredientListProvider.notifier)
            .createIngredient(createIngredientRequest);

        final image = await FilePicker.platform.pickFiles(
          type: FileType.image,
          allowMultiple: false,
        );
        await _addImage(image, createdResponse);
      } catch (e) {
        debugPrint('Error creating ingredient: $e');
        toastification.show(
          title: Text('Failed to create ingredient $e'),
          type: ToastificationType.error,
          autoCloseDuration: const Duration(seconds: 5),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
        _router.pop(formData);
      }
      toastification.show(
        title: const Text('Ingredient created successfully'),
        type: ToastificationType.success,
        autoCloseDuration: const Duration(seconds: 5),
      );
    }
  }

  Future<void> _addImage(
    FilePickerResult? image,
    IngredientResponse createdResponse,
  ) async {
    if (image == null) {
      toastification.show(
        title: const Text('No image selected'),
        type: ToastificationType.error,
        autoCloseDuration: const Duration(seconds: 5),
      );
      throw Exception('No image selected');
    }
    await ref
        .read(ingredientListProvider.notifier)
        .uploadImage(
          ingredientId: createdResponse.ingredientId!,
          imagePath: image.files.single.path!,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: SizedBox(
        width: 400, // Limit the width of the dialog
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Ingredient Form',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                FormBuilder(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Column(
                    children: [
                      FormBuilderTextField(
                        name: 'name',
                        decoration: const InputDecoration(
                          labelText: 'Name',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.label),
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.minLength(2),
                        ]),
                      ),
                      const SizedBox(height: 16),
                      FormBuilderTextField(
                        name: 'ingredientName',
                        decoration: const InputDecoration(
                          labelText: 'Ingredient Name',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.restaurant),
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ]),
                      ),
                      const SizedBox(height: 16),
                      FormBuilderTextField(
                        name: 'unit',
                        decoration: const InputDecoration(
                          labelText: 'Unit',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.straighten),
                          hintText: 'e.g., kg, liter, piece',
                        ),
                        validator: FormBuilderValidators.required(),
                      ),
                      const SizedBox(height: 16),
                      FormBuilderTextField(
                        name: 'currentQuantity',
                        decoration: const InputDecoration(
                          labelText: 'Current Quantity',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.inventory),
                        ),
                        keyboardType: TextInputType.number,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.numeric(),
                        ]),
                      ),
                      const SizedBox(height: 16),
                      FormBuilderTextField(
                        name: 'quantity',
                        decoration: const InputDecoration(
                          labelText: 'Quantity',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.add_shopping_cart),
                        ),
                        keyboardType: TextInputType.number,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.numeric(),
                        ]),
                      ),
                      const SizedBox(height: 16),
                      FormBuilderTextField(
                        name: 'supplierId',
                        decoration: const InputDecoration(
                          labelText: 'Supplier ID',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.business),
                        ),
                        keyboardType: TextInputType.number,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.numeric(),
                        ]),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed:
                          _isLoading ? null : () => Navigator.of(context).pop(),
                      child: const Text('CANCEL'),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: _isLoading ? null : _submitForm,
                      child:
                          _isLoading
                              ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                              : const Text('SUBMIT'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> showIngredientFormDialog(BuildContext context) async {
  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => const CreateIngredientDialog(),
  );
}
