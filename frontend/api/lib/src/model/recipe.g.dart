// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Recipe extends Recipe {
  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final String? instructions;
  @override
  final DateTime? createdAt;
  @override
  final BuiltList<MenuItem>? menuItems;
  @override
  final BuiltList<RecipeIngredient>? recipeIngredients;

  factory _$Recipe([void Function(RecipeBuilder)? updates]) =>
      (new RecipeBuilder()..update(updates))._build();

  _$Recipe._(
      {this.id,
      this.name,
      this.description,
      this.instructions,
      this.createdAt,
      this.menuItems,
      this.recipeIngredients})
      : super._();

  @override
  Recipe rebuild(void Function(RecipeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RecipeBuilder toBuilder() => new RecipeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Recipe &&
        id == other.id &&
        name == other.name &&
        description == other.description &&
        instructions == other.instructions &&
        createdAt == other.createdAt &&
        menuItems == other.menuItems &&
        recipeIngredients == other.recipeIngredients;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, instructions.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, menuItems.hashCode);
    _$hash = $jc(_$hash, recipeIngredients.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Recipe')
          ..add('id', id)
          ..add('name', name)
          ..add('description', description)
          ..add('instructions', instructions)
          ..add('createdAt', createdAt)
          ..add('menuItems', menuItems)
          ..add('recipeIngredients', recipeIngredients))
        .toString();
  }
}

class RecipeBuilder implements Builder<Recipe, RecipeBuilder> {
  _$Recipe? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _instructions;
  String? get instructions => _$this._instructions;
  set instructions(String? instructions) => _$this._instructions = instructions;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  ListBuilder<MenuItem>? _menuItems;
  ListBuilder<MenuItem> get menuItems =>
      _$this._menuItems ??= new ListBuilder<MenuItem>();
  set menuItems(ListBuilder<MenuItem>? menuItems) =>
      _$this._menuItems = menuItems;

  ListBuilder<RecipeIngredient>? _recipeIngredients;
  ListBuilder<RecipeIngredient> get recipeIngredients =>
      _$this._recipeIngredients ??= new ListBuilder<RecipeIngredient>();
  set recipeIngredients(ListBuilder<RecipeIngredient>? recipeIngredients) =>
      _$this._recipeIngredients = recipeIngredients;

  RecipeBuilder() {
    Recipe._defaults(this);
  }

  RecipeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _description = $v.description;
      _instructions = $v.instructions;
      _createdAt = $v.createdAt;
      _menuItems = $v.menuItems?.toBuilder();
      _recipeIngredients = $v.recipeIngredients?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Recipe other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Recipe;
  }

  @override
  void update(void Function(RecipeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Recipe build() => _build();

  _$Recipe _build() {
    _$Recipe _$result;
    try {
      _$result = _$v ??
          new _$Recipe._(
            id: id,
            name: name,
            description: description,
            instructions: instructions,
            createdAt: createdAt,
            menuItems: _menuItems?.build(),
            recipeIngredients: _recipeIngredients?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'menuItems';
        _menuItems?.build();
        _$failedField = 'recipeIngredients';
        _recipeIngredients?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Recipe', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
