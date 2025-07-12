// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_transaction_detail_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$InventoryTransactionDetailResponse
    extends InventoryTransactionDetailResponse {
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

  factory _$InventoryTransactionDetailResponse(
          [void Function(InventoryTransactionDetailResponseBuilder)?
              updates]) =>
      (InventoryTransactionDetailResponseBuilder()..update(updates))._build();

  _$InventoryTransactionDetailResponse._(
      {this.transactionId,
      this.ingredientId,
      this.quantity,
      this.unitPrice,
      this.totalCost})
      : super._();
  @override
  InventoryTransactionDetailResponse rebuild(
          void Function(InventoryTransactionDetailResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InventoryTransactionDetailResponseBuilder toBuilder() =>
      InventoryTransactionDetailResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InventoryTransactionDetailResponse &&
        transactionId == other.transactionId &&
        ingredientId == other.ingredientId &&
        quantity == other.quantity &&
        unitPrice == other.unitPrice &&
        totalCost == other.totalCost;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, transactionId.hashCode);
    _$hash = $jc(_$hash, ingredientId.hashCode);
    _$hash = $jc(_$hash, quantity.hashCode);
    _$hash = $jc(_$hash, unitPrice.hashCode);
    _$hash = $jc(_$hash, totalCost.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'InventoryTransactionDetailResponse')
          ..add('transactionId', transactionId)
          ..add('ingredientId', ingredientId)
          ..add('quantity', quantity)
          ..add('unitPrice', unitPrice)
          ..add('totalCost', totalCost))
        .toString();
  }
}

class InventoryTransactionDetailResponseBuilder
    implements
        Builder<InventoryTransactionDetailResponse,
            InventoryTransactionDetailResponseBuilder> {
  _$InventoryTransactionDetailResponse? _$v;

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

  InventoryTransactionDetailResponseBuilder() {
    InventoryTransactionDetailResponse._defaults(this);
  }

  InventoryTransactionDetailResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _transactionId = $v.transactionId;
      _ingredientId = $v.ingredientId;
      _quantity = $v.quantity;
      _unitPrice = $v.unitPrice;
      _totalCost = $v.totalCost;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InventoryTransactionDetailResponse other) {
    _$v = other as _$InventoryTransactionDetailResponse;
  }

  @override
  void update(
      void Function(InventoryTransactionDetailResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  InventoryTransactionDetailResponse build() => _build();

  _$InventoryTransactionDetailResponse _build() {
    final _$result = _$v ??
        _$InventoryTransactionDetailResponse._(
          transactionId: transactionId,
          ingredientId: ingredientId,
          quantity: quantity,
          unitPrice: unitPrice,
          totalCost: totalCost,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
