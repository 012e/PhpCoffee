import 'dart:io';
import 'package:api_client/api_client.dart';
import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:frontend/shared/riverpods/ingredient_provider.dart';
import 'package:toastification/toastification.dart';

class IngredientFormDialog extends ConsumerStatefulWidget {
  final IngredientResponse? ingredient; // Optional ingredient for edit mode
  const IngredientFormDialog({super.key, this.ingredient});

  @override
  ConsumerState<IngredientFormDialog> createState() =>
      _IngredientFormDialogState();
}

class _IngredientFormDialogState extends ConsumerState<IngredientFormDialog> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isLoading = false;
  late final StackRouter _router;
  FilePickerResult? _selectedImage;
  String? _imagePath;
  String? _existingImageUrl;
  bool get _isEditMode => widget.ingredient != null;

  @override
  void initState() {
    super.initState();
    _router = AutoRouter.of(context);

    // If in edit mode, initialize with existing image if available
    if (_isEditMode && widget.ingredient?.imageUrl != null) {
      _existingImageUrl = widget.ingredient!.imageUrl;
    }
  }

  Future<void> _pickImage() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );

    if (result != null) {
      setState(() {
        _selectedImage = result;
        _imagePath = result.files.single.path;
        _existingImageUrl =
            null; // Clear existing image when new one is selected
      });
    }
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      final formData = _formKey.currentState!.value;

      setState(() {
        _isLoading = true;
      });

      debugPrint('Form data: $formData');

      try {
        if (_isEditMode) {
          // Handle update
          final UpdateIngredientRequest
          updateIngredientRequest = UpdateIngredientRequest(
            (b) =>
                b
                  ..ingredientName = formData['ingredientName'] as String
                  ..unit = formData['unit'] as String
                  ..currentQuantity = double.parse(formData['currentQuantity'])
                  ..currentQuantity = double.parse(formData['currentQuantity'])
                  ..supplierId = int.parse(formData['supplierId']),
          );

          await ref
              .read(ingredientListProvider.notifier)
              .updateIngredient(
                widget.ingredient!.ingredientId!,
                updateIngredientRequest,
              );

          // Upload the new image if selected in edit mode
          if (_selectedImage != null && _imagePath != null) {
            await ref
                .read(ingredientListProvider.notifier)
                .uploadImage(
                  ingredientId: widget.ingredient!.ingredientId!,
                  imagePath: _imagePath!,
                );
          }

          toastification.show(
            title: const Text('Ingredient updated successfully'),
            type: ToastificationType.success,
            autoCloseDuration: const Duration(seconds: 5),
          );
        } else {
          // Handle create
          final CreateIngredientRequest createIngredientRequest =
              CreateIngredientRequest(
                (b) =>
                    b
                      ..name = formData['ingredientName'] as String
                      ..ingredientName = formData['ingredientName'] as String
                      ..unit = formData['unit'] as String
                      ..currentQuantity = double.parse(
                        formData['currentQuantity'],
                      )
                      ..quantity = double.parse(formData['currentQuantity'])
                      ..supplierId = int.parse(formData['supplierId']),
              );

          final createdResponse = await ref
              .read(ingredientListProvider.notifier)
              .createIngredient(createIngredientRequest);

          // Upload the image if available for new ingredient
          if (_selectedImage != null && _imagePath != null) {
            await ref
                .read(ingredientListProvider.notifier)
                .uploadImage(
                  ingredientId: createdResponse.ingredientId!,
                  imagePath: _imagePath!,
                );
          } else {
            toastification.show(
              title: const Text('No image selected'),
              type: ToastificationType.warning,
              autoCloseDuration: const Duration(seconds: 5),
            );
          }

          toastification.show(
            title: const Text('Ingredient created successfully'),
            type: ToastificationType.success,
            autoCloseDuration: const Duration(seconds: 5),
          );
        }

        _router.pop(formData);
      } catch (e) {
        debugPrint(
          'Error ${_isEditMode ? "updating" : "creating"} ingredient: $e',
        );
        toastification.show(
          title: Text(
            'Failed to ${_isEditMode ? "update" : "create"} ingredient: $e',
          ),
          type: ToastificationType.error,
          autoCloseDuration: const Duration(seconds: 5),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Widget _buildImagePreview() {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
      ),
      child:
          _imagePath != null
              ? _buildLocalImagePreview()
              : _existingImageUrl != null
              ? _buildNetworkImagePreview()
              : _buildImageSelector(),
    );
  }

  Widget _buildLocalImagePreview() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.file(File(_imagePath!), fit: BoxFit.cover),
          _buildImageRemoveButton(),
        ],
      ),
    );
  }

  Widget _buildNetworkImagePreview() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(_existingImageUrl!, fit: BoxFit.cover),
          _buildImageRemoveButton(),
        ],
      ),
    );
  }

  Widget _buildImageRemoveButton() {
    return Positioned(
      top: 8,
      right: 8,
      child: InkWell(
        onTap: () {
          setState(() {
            _selectedImage = null;
            _imagePath = null;
            _existingImageUrl = null;
          });
        },
        child: Container(
          padding: const EdgeInsets.all(4),
          decoration: const BoxDecoration(
            color: Colors.black45,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.close, color: Colors.white, size: 20),
        ),
      ),
    );
  }

  Widget _buildImageSelector() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.image, size: 48, color: Colors.grey),
        const SizedBox(height: 8),
        ElevatedButton.icon(
          onPressed: _pickImage,
          icon: const Icon(Icons.upload),
          label: const Text('Select Image'),
        ),
      ],
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
                Text(
                  _isEditMode ? 'Edit Ingredient' : 'Create Ingredient',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                FormBuilder(
                  key: _formKey,
                  initialValue:
                      _isEditMode
                          ? {
                            'name': widget.ingredient!.ingredientName,
                            'ingredientName': widget.ingredient!.ingredientName,
                            'unit': widget.ingredient!.unit,
                            'currentQuantity':
                                widget.ingredient!.currentQuantity.toString(),
                            'quantity':
                                widget.ingredient!.currentQuantity.toString(),
                            'supplierId':
                                widget.ingredient!.supplier!.supplierId
                                    .toString(),
                          }
                          : {},
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Column(
                    children: [
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
                      const SizedBox(height: 16),
                      FormBuilderField(
                        name: 'image',
                        builder: (FormFieldState field) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Ingredient Image',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 8),
                              _buildImagePreview(),
                              if (field.hasError)
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    field.errorText!,
                                    style: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.error,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                            ],
                          );
                        },
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
                              : Text(_isEditMode ? 'UPDATE' : 'SUBMIT'),
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

Future<void> showIngredientFormDialog(
  BuildContext context, {
  IngredientResponse? ingredient,
}) async {
  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => IngredientFormDialog(ingredient: ingredient),
  );
}
