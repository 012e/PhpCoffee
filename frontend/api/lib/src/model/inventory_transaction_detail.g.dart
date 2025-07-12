// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_transaction_detail.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$InventoryTransactionDetail extends InventoryTransactionDetail {
  @override
  final int? transactionId;
  @override
  final int? ingredientId;
  @override
  final double? quantity;
  @override
  final double? unitPrice;
  @override
  final double? totalCost;
  @override
  final Ingredient? ingredient;
  @override
  final InventoryTransaction? transaction;

  factory _$InventoryTransactionDetail(
          [void Function(InventoryTransactionDetailBuilder)? updates]) =>
      (InventoryTransactionDetailBuilder()..update(updates))._build();

  _$InventoryTransactionDetail._(
      {this.transactionId,
      this.ingredientId,
      this.quantity,
      this.unitPrice,
      this.totalCost,
      this.ingredient,
      this.transaction})
      : super._();
  @override
  InventoryTransactionDetail rebuild(
          void Function(InventoryTransactionDetailBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InventoryTransactionDetailBuilder toBuilder() =>
      InventoryTransactionDetailBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InventoryTransactionDetail &&
        transactionId == other.transactionId &&
        ingredientId == other.ingredientId &&
        quantity == other.quantity &&
        unitPrice == other.unitPrice &&
        totalCost == other.totalCost &&
        ingredient == other.ingredient &&
        transaction == other.transaction;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, transactionId.hashCode);
    _$hash = $jc(_$hash, ingredientId.hashCode);
    _$hash = $jc(_$hash, quantity.hashCode);
    _$hash = $jc(_$hash, unitPrice.hashCode);
    _$hash = $jc(_$hash, totalCost.hashCode);
    _$hash = $jc(_$hash, ingredient.hashCode);
    _$hash = $jc(_$hash, transaction.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'InventoryTransactionDetail')
          ..add('transactionId', transactionId)
          ..add('ingredientId', ingredientId)
          ..add('quantity', quantity)
          ..add('unitPrice', unitPrice)
          ..add('totalCost', totalCost)
          ..add('ingredient', ingredient)
          ..add('transaction', transaction))
        .toString();
  }
}

class InventoryTransactionDetailBuilder
    implements
        Builder<InventoryTransactionDetail, InventoryTransactionDetailBuilder> {
  _$InventoryTransactionDetail? _$v;

  int? _transactionId;
  int? get transactionId => _$this._transactionId;
  set transactionId(int? transactionId) =>
      _$this._transactionId = transactionId;

  int? _ingredientId;
  int? get ingredientId => _$this._ingredientId;
  set ingredientId(int? ingredientId) => _$this._ingredientId = ingredientId;

  double? _quantity;
  double? get quantity => _$this._quantity;
  set quantity(double? quantity) => _$this._quantity = quantity;

  double? _unitPrice;
  double? get unitPrice => _$this._unitPrice;
  set unitPrice(double? unitPrice) => _$this._unitPrice = unitPrice;

  double? _totalCost;
  double? get totalCost => _$this._totalCost;
  set totalCost(double? totalCost) => _$this._totalCost = totalCost;

  IngredientBuilder? _ingredient;
  IngredientBuilder get ingredient =>
      _$this._ingredient ??= IngredientBuilder();
  set ingredient(IngredientBuilder? ingredient) =>
      _$this._ingredient = ingredient;

  InventoryTransactionBuilder? _transaction;
  InventoryTransactionBuilder get transaction =>
      _$this._transaction ??= InventoryTransactionBuilder();
  set transaction(InventoryTransactionBuilder? transaction) =>
      _$this._transaction = transaction;

  InventoryTransactionDetailBuilder() {
    InventoryTransactionDetail._defaults(this);
  }

  InventoryTransactionDetailBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _transactionId = $v.transactionId;
      _ingredientId = $v.ingredientId;
      _quantity = $v.quantity;
      _unitPrice = $v.unitPrice;
      _totalCost = $v.totalCost;
      _ingredient = $v.ingredient?.toBuilder();
      _transaction = $v.transaction?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InventoryTransactionDetail other) {
    _$v = other as _$InventoryTransactionDetail;
  }

  @override
  void update(void Function(InventoryTransactionDetailBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  InventoryTransactionDetail build() => _build();

  _$InventoryTransactionDetail _build() {
    _$InventoryTransactionDetail _$result;
    try {
      _$result = _$v ??
          _$InventoryTransactionDetail._(
            transactionId: transactionId,
            ingredientId: ingredientId,
            quantity: quantity,
            unitPrice: unitPrice,
            totalCost: totalCost,
            ingredient: _ingredient?.build(),
            transaction: _transaction?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ingredient';
        _ingredient?.build();
        _$failedField = 'transaction';
        _transaction?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'InventoryTransactionDetail', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
