import 'package:api_client/api_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'new_item_form.g.dart';

class NewItemFormState {
  final String name;
  final String description;
  final double price;

  const NewItemFormState({
    this.name = '',
    this.description = '',
    this.price = 0.0,
  });

  NewItemFormState copyWith({
    String? name,
    String? description,
    double? price,
  }) {
    return NewItemFormState(
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
    );
  }
}

class Step1Data {
  final String name;
  final String description;

  const Step1Data({this.name = '', this.description = ''});
}

@riverpod
class NewItemForm extends _$NewItemForm {
  Map<int, int> ingredients = {};

  @override
  CreateMenuItemRequest build() {
    return CreateMenuItemRequest();
  }

  void addIngredient(int ingredientId, int amount) {
    ingredients[ingredientId] = amount;
  }

  void removeIngredient(int ingredientId) {
    ingredients.remove(ingredientId);
  }

  void setName(String name) {}
}
