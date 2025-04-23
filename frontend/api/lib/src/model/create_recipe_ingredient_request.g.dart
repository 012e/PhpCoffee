// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_recipe_ingredient_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateRecipeIngredientRequest extends CreateRecipeIngredientRequest {
  @override
  final int? ingredientId;
  @override
  final double? quantity;

  factory _$CreateRecipeIngredientRequest(
          [void Function(CreateRecipeIngredientRequestBuilder)? updates]) =>
      (new CreateRecipeIngredientRequestBuilder()..update(updates))._build();

  _$CreateRecipeIngredientRequest._({this.ingredientId, this.quantity})
      : super._();

  @override
  CreateRecipeIngredientRequest rebuild(
          void Function(CreateRecipeIngredientRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateRecipeIngredientRequestBuilder toBuilder() =>
      new CreateRecipeIngredientRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateRecipeIngredientRequest &&
        ingredientId == other.ingredientId &&
        quantity == other.quantity;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, ingredientId.hashCode);
    _$hash = $jc(_$hash, quantity.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateRecipeIngredientRequest')
          ..add('ingredientId', ingredientId)
          ..add('quantity', quantity))
        .toString();
  }
}

class CreateRecipeIngredientRequestBuilder
    implements
        Builder<CreateRecipeIngredientRequest,
            CreateRecipeIngredientRequestBuilder> {
  _$CreateRecipeIngredientRequest? _$v;

  int? _ingredientId;
  int? get ingredientId => _$this._ingredientId;
  set ingredientId(int? ingredientId) => _$this._ingredientId = ingredientId;

  double? _quantity;
  double? get quantity => _$this._quantity;
  set quantity(double? quantity) => _$this._quantity = quantity;

  CreateRecipeIngredientRequestBuilder() {
    CreateRecipeIngredientRequest._defaults(this);
  }

  CreateRecipeIngredientRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ingredientId = $v.ingredientId;
      _quantity = $v.quantity;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateRecipeIngredientRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateRecipeIngredientRequest;
  }

  @override
  void update(void Function(CreateRecipeIngredientRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateRecipeIngredientRequest build() => _build();

  _$CreateRecipeIngredientRequest _build() {
    final _$result = _$v ??
        new _$CreateRecipeIngredientRequest._(
          ingredientId: ingredientId,
          quantity: quantity,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
