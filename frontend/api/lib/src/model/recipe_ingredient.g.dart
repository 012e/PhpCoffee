// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_ingredient.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RecipeIngredient extends RecipeIngredient {
  @override
  final int? recipeId;
  @override
  final int? ingredientId;
  @override
  final double? quantity;
  @override
  final Ingredient? ingredient;
  @override
  final Recipe? recipe;

  factory _$RecipeIngredient(
          [void Function(RecipeIngredientBuilder)? updates]) =>
      (new RecipeIngredientBuilder()..update(updates))._build();

  _$RecipeIngredient._(
      {this.recipeId,
      this.ingredientId,
      this.quantity,
      this.ingredient,
      this.recipe})
      : super._();

  @override
  RecipeIngredient rebuild(void Function(RecipeIngredientBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RecipeIngredientBuilder toBuilder() =>
      new RecipeIngredientBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RecipeIngredient &&
        recipeId == other.recipeId &&
        ingredientId == other.ingredientId &&
        quantity == other.quantity &&
        ingredient == other.ingredient &&
        recipe == other.recipe;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, recipeId.hashCode);
    _$hash = $jc(_$hash, ingredientId.hashCode);
    _$hash = $jc(_$hash, quantity.hashCode);
    _$hash = $jc(_$hash, ingredient.hashCode);
    _$hash = $jc(_$hash, recipe.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RecipeIngredient')
          ..add('recipeId', recipeId)
          ..add('ingredientId', ingredientId)
          ..add('quantity', quantity)
          ..add('ingredient', ingredient)
          ..add('recipe', recipe))
        .toString();
  }
}

class RecipeIngredientBuilder
    implements Builder<RecipeIngredient, RecipeIngredientBuilder> {
  _$RecipeIngredient? _$v;

  int? _recipeId;
  int? get recipeId => _$this._recipeId;
  set recipeId(int? recipeId) => _$this._recipeId = recipeId;

  int? _ingredientId;
  int? get ingredientId => _$this._ingredientId;
  set ingredientId(int? ingredientId) => _$this._ingredientId = ingredientId;

  double? _quantity;
  double? get quantity => _$this._quantity;
  set quantity(double? quantity) => _$this._quantity = quantity;

  IngredientBuilder? _ingredient;
  IngredientBuilder get ingredient =>
      _$this._ingredient ??= new IngredientBuilder();
  set ingredient(IngredientBuilder? ingredient) =>
      _$this._ingredient = ingredient;

  RecipeBuilder? _recipe;
  RecipeBuilder get recipe => _$this._recipe ??= new RecipeBuilder();
  set recipe(RecipeBuilder? recipe) => _$this._recipe = recipe;

  RecipeIngredientBuilder() {
    RecipeIngredient._defaults(this);
  }

  RecipeIngredientBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _recipeId = $v.recipeId;
      _ingredientId = $v.ingredientId;
      _quantity = $v.quantity;
      _ingredient = $v.ingredient?.toBuilder();
      _recipe = $v.recipe?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RecipeIngredient other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RecipeIngredient;
  }

  @override
  void update(void Function(RecipeIngredientBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RecipeIngredient build() => _build();

  _$RecipeIngredient _build() {
    _$RecipeIngredient _$result;
    try {
      _$result = _$v ??
          new _$RecipeIngredient._(
            recipeId: recipeId,
            ingredientId: ingredientId,
            quantity: quantity,
            ingredient: _ingredient?.build(),
            recipe: _recipe?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ingredient';
        _ingredient?.build();
        _$failedField = 'recipe';
        _recipe?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'RecipeIngredient', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
