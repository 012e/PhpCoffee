// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$IngredientResponse extends IngredientResponse {
  @override
  final int? ingredientId;
  @override
  final String? ingredientName;
  @override
  final String? unit;
  @override
  final double? currentQuantity;
  @override
  final String? imageUrl;
  @override
  final DateTime? createdAt;
  @override
  final SupplierResponse? supplier;

  factory _$IngredientResponse(
          [void Function(IngredientResponseBuilder)? updates]) =>
      (new IngredientResponseBuilder()..update(updates))._build();

  _$IngredientResponse._(
      {this.ingredientId,
      this.ingredientName,
      this.unit,
      this.currentQuantity,
      this.imageUrl,
      this.createdAt,
      this.supplier})
      : super._();

  @override
  IngredientResponse rebuild(
          void Function(IngredientResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  IngredientResponseBuilder toBuilder() =>
      new IngredientResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is IngredientResponse &&
        ingredientId == other.ingredientId &&
        ingredientName == other.ingredientName &&
        unit == other.unit &&
        currentQuantity == other.currentQuantity &&
        imageUrl == other.imageUrl &&
        createdAt == other.createdAt &&
        supplier == other.supplier;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, ingredientId.hashCode);
    _$hash = $jc(_$hash, ingredientName.hashCode);
    _$hash = $jc(_$hash, unit.hashCode);
    _$hash = $jc(_$hash, currentQuantity.hashCode);
    _$hash = $jc(_$hash, imageUrl.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, supplier.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'IngredientResponse')
          ..add('ingredientId', ingredientId)
          ..add('ingredientName', ingredientName)
          ..add('unit', unit)
          ..add('currentQuantity', currentQuantity)
          ..add('imageUrl', imageUrl)
          ..add('createdAt', createdAt)
          ..add('supplier', supplier))
        .toString();
  }
}

class IngredientResponseBuilder
    implements Builder<IngredientResponse, IngredientResponseBuilder> {
  _$IngredientResponse? _$v;

  int? _ingredientId;
  int? get ingredientId => _$this._ingredientId;
  set ingredientId(int? ingredientId) => _$this._ingredientId = ingredientId;

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

  String? _imageUrl;
  String? get imageUrl => _$this._imageUrl;
  set imageUrl(String? imageUrl) => _$this._imageUrl = imageUrl;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  SupplierResponseBuilder? _supplier;
  SupplierResponseBuilder get supplier =>
      _$this._supplier ??= new SupplierResponseBuilder();
  set supplier(SupplierResponseBuilder? supplier) =>
      _$this._supplier = supplier;

  IngredientResponseBuilder() {
    IngredientResponse._defaults(this);
  }

  IngredientResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ingredientId = $v.ingredientId;
      _ingredientName = $v.ingredientName;
      _unit = $v.unit;
      _currentQuantity = $v.currentQuantity;
      _imageUrl = $v.imageUrl;
      _createdAt = $v.createdAt;
      _supplier = $v.supplier?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(IngredientResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$IngredientResponse;
  }

  @override
  void update(void Function(IngredientResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  IngredientResponse build() => _build();

  _$IngredientResponse _build() {
    _$IngredientResponse _$result;
    try {
      _$result = _$v ??
          new _$IngredientResponse._(
            ingredientId: ingredientId,
            ingredientName: ingredientName,
            unit: unit,
            currentQuantity: currentQuantity,
            imageUrl: imageUrl,
            createdAt: createdAt,
            supplier: _supplier?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'supplier';
        _supplier?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'IngredientResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
