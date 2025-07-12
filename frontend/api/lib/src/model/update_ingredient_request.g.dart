// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_ingredient_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateIngredientRequest extends UpdateIngredientRequest {
  @override
  final String? ingredientName;
  @override
  final String? unit;
  @override
  final double? currentQuantity;
  @override
  final String? ingredientDescription;
  @override
  final int? supplierId;

  factory _$UpdateIngredientRequest(
          [void Function(UpdateIngredientRequestBuilder)? updates]) =>
      (UpdateIngredientRequestBuilder()..update(updates))._build();

  _$UpdateIngredientRequest._(
      {this.ingredientName,
      this.unit,
      this.currentQuantity,
      this.ingredientDescription,
      this.supplierId})
      : super._();
  @override
  UpdateIngredientRequest rebuild(
          void Function(UpdateIngredientRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateIngredientRequestBuilder toBuilder() =>
      UpdateIngredientRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateIngredientRequest &&
        ingredientName == other.ingredientName &&
        unit == other.unit &&
        currentQuantity == other.currentQuantity &&
        ingredientDescription == other.ingredientDescription &&
        supplierId == other.supplierId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, ingredientName.hashCode);
    _$hash = $jc(_$hash, unit.hashCode);
    _$hash = $jc(_$hash, currentQuantity.hashCode);
    _$hash = $jc(_$hash, ingredientDescription.hashCode);
    _$hash = $jc(_$hash, supplierId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpdateIngredientRequest')
          ..add('ingredientName', ingredientName)
          ..add('unit', unit)
          ..add('currentQuantity', currentQuantity)
          ..add('ingredientDescription', ingredientDescription)
          ..add('supplierId', supplierId))
        .toString();
  }
}

class UpdateIngredientRequestBuilder
    implements
        Builder<UpdateIngredientRequest, UpdateIngredientRequestBuilder> {
  _$UpdateIngredientRequest? _$v;

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

  String? _ingredientDescription;
  String? get ingredientDescription => _$this._ingredientDescription;
  set ingredientDescription(String? ingredientDescription) =>
      _$this._ingredientDescription = ingredientDescription;

  int? _supplierId;
  int? get supplierId => _$this._supplierId;
  set supplierId(int? supplierId) => _$this._supplierId = supplierId;

  UpdateIngredientRequestBuilder() {
    UpdateIngredientRequest._defaults(this);
  }

  UpdateIngredientRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ingredientName = $v.ingredientName;
      _unit = $v.unit;
      _currentQuantity = $v.currentQuantity;
      _ingredientDescription = $v.ingredientDescription;
      _supplierId = $v.supplierId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateIngredientRequest other) {
    _$v = other as _$UpdateIngredientRequest;
  }

  @override
  void update(void Function(UpdateIngredientRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateIngredientRequest build() => _build();

  _$UpdateIngredientRequest _build() {
    final _$result = _$v ??
        _$UpdateIngredientRequest._(
          ingredientName: ingredientName,
          unit: unit,
          currentQuantity: currentQuantity,
          ingredientDescription: ingredientDescription,
          supplierId: supplierId,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
