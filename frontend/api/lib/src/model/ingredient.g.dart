// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Ingredient extends Ingredient {
  @override
  final int? ingredientId;
  @override
  final String? ingredientName;
  @override
  final String? unit;
  @override
  final double? currentQuantity;
  @override
  final int? supplierId;
  @override
  final DateTime? createdAt;
  @override
  final String? imageUrl;
  @override
  final BuiltList<InventoryTransactionDetail>? inventoryTransactionDetails;
  @override
  final BuiltList<RecipeIngredient>? recipeIngredients;
  @override
  final Supplier? supplier;

  factory _$Ingredient([void Function(IngredientBuilder)? updates]) =>
      (new IngredientBuilder()..update(updates))._build();

  _$Ingredient._(
      {this.ingredientId,
      this.ingredientName,
      this.unit,
      this.currentQuantity,
      this.supplierId,
      this.createdAt,
      this.imageUrl,
      this.inventoryTransactionDetails,
      this.recipeIngredients,
      this.supplier})
      : super._();

  @override
  Ingredient rebuild(void Function(IngredientBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  IngredientBuilder toBuilder() => new IngredientBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Ingredient &&
        ingredientId == other.ingredientId &&
        ingredientName == other.ingredientName &&
        unit == other.unit &&
        currentQuantity == other.currentQuantity &&
        supplierId == other.supplierId &&
        createdAt == other.createdAt &&
        imageUrl == other.imageUrl &&
        inventoryTransactionDetails == other.inventoryTransactionDetails &&
        recipeIngredients == other.recipeIngredients &&
        supplier == other.supplier;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, ingredientId.hashCode);
    _$hash = $jc(_$hash, ingredientName.hashCode);
    _$hash = $jc(_$hash, unit.hashCode);
    _$hash = $jc(_$hash, currentQuantity.hashCode);
    _$hash = $jc(_$hash, supplierId.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, imageUrl.hashCode);
    _$hash = $jc(_$hash, inventoryTransactionDetails.hashCode);
    _$hash = $jc(_$hash, recipeIngredients.hashCode);
    _$hash = $jc(_$hash, supplier.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Ingredient')
          ..add('ingredientId', ingredientId)
          ..add('ingredientName', ingredientName)
          ..add('unit', unit)
          ..add('currentQuantity', currentQuantity)
          ..add('supplierId', supplierId)
          ..add('createdAt', createdAt)
          ..add('imageUrl', imageUrl)
          ..add('inventoryTransactionDetails', inventoryTransactionDetails)
          ..add('recipeIngredients', recipeIngredients)
          ..add('supplier', supplier))
        .toString();
  }
}

class IngredientBuilder implements Builder<Ingredient, IngredientBuilder> {
  _$Ingredient? _$v;

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

  int? _supplierId;
  int? get supplierId => _$this._supplierId;
  set supplierId(int? supplierId) => _$this._supplierId = supplierId;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  String? _imageUrl;
  String? get imageUrl => _$this._imageUrl;
  set imageUrl(String? imageUrl) => _$this._imageUrl = imageUrl;

  ListBuilder<InventoryTransactionDetail>? _inventoryTransactionDetails;
  ListBuilder<InventoryTransactionDetail> get inventoryTransactionDetails =>
      _$this._inventoryTransactionDetails ??=
          new ListBuilder<InventoryTransactionDetail>();
  set inventoryTransactionDetails(
          ListBuilder<InventoryTransactionDetail>?
              inventoryTransactionDetails) =>
      _$this._inventoryTransactionDetails = inventoryTransactionDetails;

  ListBuilder<RecipeIngredient>? _recipeIngredients;
  ListBuilder<RecipeIngredient> get recipeIngredients =>
      _$this._recipeIngredients ??= new ListBuilder<RecipeIngredient>();
  set recipeIngredients(ListBuilder<RecipeIngredient>? recipeIngredients) =>
      _$this._recipeIngredients = recipeIngredients;

  SupplierBuilder? _supplier;
  SupplierBuilder get supplier => _$this._supplier ??= new SupplierBuilder();
  set supplier(SupplierBuilder? supplier) => _$this._supplier = supplier;

  IngredientBuilder() {
    Ingredient._defaults(this);
  }

  IngredientBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ingredientId = $v.ingredientId;
      _ingredientName = $v.ingredientName;
      _unit = $v.unit;
      _currentQuantity = $v.currentQuantity;
      _supplierId = $v.supplierId;
      _createdAt = $v.createdAt;
      _imageUrl = $v.imageUrl;
      _inventoryTransactionDetails =
          $v.inventoryTransactionDetails?.toBuilder();
      _recipeIngredients = $v.recipeIngredients?.toBuilder();
      _supplier = $v.supplier?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Ingredient other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Ingredient;
  }

  @override
  void update(void Function(IngredientBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Ingredient build() => _build();

  _$Ingredient _build() {
    _$Ingredient _$result;
    try {
      _$result = _$v ??
          new _$Ingredient._(
            ingredientId: ingredientId,
            ingredientName: ingredientName,
            unit: unit,
            currentQuantity: currentQuantity,
            supplierId: supplierId,
            createdAt: createdAt,
            imageUrl: imageUrl,
            inventoryTransactionDetails: _inventoryTransactionDetails?.build(),
            recipeIngredients: _recipeIngredients?.build(),
            supplier: _supplier?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'inventoryTransactionDetails';
        _inventoryTransactionDetails?.build();
        _$failedField = 'recipeIngredients';
        _recipeIngredients?.build();
        _$failedField = 'supplier';
        _supplier?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Ingredient', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
