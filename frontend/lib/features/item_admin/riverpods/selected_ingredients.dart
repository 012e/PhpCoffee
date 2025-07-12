import 'dart:math';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_ingredients.g.dart';

@riverpod
class SelectedIngredients extends _$SelectedIngredients {
  @override
  Map<int, int> build() {
    return {};
  }

  void addIngredient(int ingredientId) {
    state.update(ingredientId, (value) => value + 1, ifAbsent: () => 1);
    state = Map.from(state);
  }

  void removeIngredient(int ingredientId) {
    state.update(ingredientId, (value) => max(0, value - 1), ifAbsent: () => 1);
    state = Map.from(state);
  }

  void setIngredientQuantity(int ingredientId, int quantity) {
    if (quantity <= 0) {
      state.remove(ingredientId);
    } else {
      state[ingredientId] = quantity;
    }
    state = Map.from(state);
  }

  void clear() {
    state = {};
  }
}
