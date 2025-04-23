// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_recipe_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateRecipeRequest extends CreateRecipeRequest {
  @override
  final String? name;
  @override
  final String? description;
  @override
  final String? instructions;
  @override
  final BuiltList<CreateRecipeIngredientRequest>? recipeIngredients;

  factory _$CreateRecipeRequest(
          [void Function(CreateRecipeRequestBuilder)? updates]) =>
      (new CreateRecipeRequestBuilder()..update(updates))._build();

  _$CreateRecipeRequest._(
      {this.name, this.description, this.instructions, this.recipeIngredients})
      : super._();

  @override
  CreateRecipeRequest rebuild(
          void Function(CreateRecipeRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateRecipeRequestBuilder toBuilder() =>
      new CreateRecipeRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateRecipeRequest &&
        name == other.name &&
        description == other.description &&
        instructions == other.instructions &&
        recipeIngredients == other.recipeIngredients;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, instructions.hashCode);
    _$hash = $jc(_$hash, recipeIngredients.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateRecipeRequest')
          ..add('name', name)
          ..add('description', description)
          ..add('instructions', instructions)
          ..add('recipeIngredients', recipeIngredients))
        .toString();
  }
}

class CreateRecipeRequestBuilder
    implements Builder<CreateRecipeRequest, CreateRecipeRequestBuilder> {
  _$CreateRecipeRequest? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _instructions;
  String? get instructions => _$this._instructions;
  set instructions(String? instructions) => _$this._instructions = instructions;

  ListBuilder<CreateRecipeIngredientRequest>? _recipeIngredients;
  ListBuilder<CreateRecipeIngredientRequest> get recipeIngredients =>
      _$this._recipeIngredients ??=
          new ListBuilder<CreateRecipeIngredientRequest>();
  set recipeIngredients(
          ListBuilder<CreateRecipeIngredientRequest>? recipeIngredients) =>
      _$this._recipeIngredients = recipeIngredients;

  CreateRecipeRequestBuilder() {
    CreateRecipeRequest._defaults(this);
  }

  CreateRecipeRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _description = $v.description;
      _instructions = $v.instructions;
      _recipeIngredients = $v.recipeIngredients?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateRecipeRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateRecipeRequest;
  }

  @override
  void update(void Function(CreateRecipeRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateRecipeRequest build() => _build();

  _$CreateRecipeRequest _build() {
    _$CreateRecipeRequest _$result;
    try {
      _$result = _$v ??
          new _$CreateRecipeRequest._(
            name: name,
            description: description,
            instructions: instructions,
            recipeIngredients: _recipeIngredients?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'recipeIngredients';
        _recipeIngredients?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CreateRecipeRequest', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
