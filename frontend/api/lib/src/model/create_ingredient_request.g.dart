// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_ingredient_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateIngredientRequest extends CreateIngredientRequest {
  @override
  final String? ingredientName;
  @override
  final String? unit;
  @override
  final double? currentQuantity;
  @override
  final String? name;
  @override
  final double? quantity;
  @override
  final int? supplierId;

  factory _$CreateIngredientRequest(
          [void Function(CreateIngredientRequestBuilder)? updates]) =>
      (new CreateIngredientRequestBuilder()..update(updates))._build();

  _$CreateIngredientRequest._(
      {this.ingredientName,
      this.unit,
      this.currentQuantity,
      this.name,
      this.quantity,
      this.supplierId})
      : super._();

  @override
  CreateIngredientRequest rebuild(
          void Function(CreateIngredientRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateIngredientRequestBuilder toBuilder() =>
      new CreateIngredientRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateIngredientRequest &&
        ingredientName == other.ingredientName &&
        unit == other.unit &&
        currentQuantity == other.currentQuantity &&
        name == other.name &&
        quantity == other.quantity &&
        supplierId == other.supplierId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, ingredientName.hashCode);
    _$hash = $jc(_$hash, unit.hashCode);
    _$hash = $jc(_$hash, currentQuantity.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, quantity.hashCode);
    _$hash = $jc(_$hash, supplierId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateIngredientRequest')
          ..add('ingredientName', ingredientName)
          ..add('unit', unit)
          ..add('currentQuantity', currentQuantity)
          ..add('name', name)
          ..add('quantity', quantity)
          ..add('supplierId', supplierId))
        .toString();
  }
}

class CreateIngredientRequestBuilder
    implements
        Builder<CreateIngredientRequest, CreateIngredientRequestBuilder> {
  _$CreateIngredientRequest? _$v;

  String? _ingredientName;
  String? get ingredientName => _$this._ingredientName;
  set ingredientName(String? ingredientName) =>
      _$this._ingredientName = ingredientName;

  String? _unit;
  String? get unit => _$this._unit;
  set unit(String? unit) => _$this._unit = unit;

  double? _currentQuantity;
  double? get currentQuantity => _$this._currentQuantity;
  set currentQuantity(double? currentQuantity) =>
      _$this._currentQuantity = currentQuantity;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  double? _quantity;
  double? get quantity => _$this._quantity;
  set quantity(double? quantity) => _$this._quantity = quantity;

  int? _supplierId;
  int? get supplierId => _$this._supplierId;
  set supplierId(int? supplierId) => _$this._supplierId = supplierId;

  CreateIngredientRequestBuilder() {
    CreateIngredientRequest._defaults(this);
  }

  CreateIngredientRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ingredientName = $v.ingredientName;
      _unit = $v.unit;
      _currentQuantity = $v.currentQuantity;
      _name = $v.name;
      _quantity = $v.quantity;
      _supplierId = $v.supplierId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateIngredientRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateIngredientRequest;
  }

  @override
  void update(void Function(CreateIngredientRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateIngredientRequest build() => _build();

  _$CreateIngredientRequest _build() {
    final _$result = _$v ??
        new _$CreateIngredientRequest._(
          ingredientName: ingredientName,
          unit: unit,
          currentQuantity: currentQuantity,
          name: name,
          quantity: quantity,
          supplierId: supplierId,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
