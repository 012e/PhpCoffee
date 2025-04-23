// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_inventory_transaction_detail_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateInventoryTransactionDetailRequest
    extends CreateInventoryTransactionDetailRequest {
  @override
  final int? ingredientId;
  @override
  final double? quantity;
  @override
  final double? unitPrice;

  factory _$CreateInventoryTransactionDetailRequest(
          [void Function(CreateInventoryTransactionDetailRequestBuilder)?
              updates]) =>
      (new CreateInventoryTransactionDetailRequestBuilder()..update(updates))
          ._build();

  _$CreateInventoryTransactionDetailRequest._(
      {this.ingredientId, this.quantity, this.unitPrice})
      : super._();

  @override
  CreateInventoryTransactionDetailRequest rebuild(
          void Function(CreateInventoryTransactionDetailRequestBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateInventoryTransactionDetailRequestBuilder toBuilder() =>
      new CreateInventoryTransactionDetailRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateInventoryTransactionDetailRequest &&
        ingredientId == other.ingredientId &&
        quantity == other.quantity &&
        unitPrice == other.unitPrice;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, ingredientId.hashCode);
    _$hash = $jc(_$hash, quantity.hashCode);
    _$hash = $jc(_$hash, unitPrice.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'CreateInventoryTransactionDetailRequest')
          ..add('ingredientId', ingredientId)
          ..add('quantity', quantity)
          ..add('unitPrice', unitPrice))
        .toString();
  }
}

class CreateInventoryTransactionDetailRequestBuilder
    implements
        Builder<CreateInventoryTransactionDetailRequest,
            CreateInventoryTransactionDetailRequestBuilder> {
  _$CreateInventoryTransactionDetailRequest? _$v;

  int? _ingredientId;
  int? get ingredientId => _$this._ingredientId;
  set ingredientId(int? ingredientId) => _$this._ingredientId = ingredientId;

  double? _quantity;
  double? get quantity => _$this._quantity;
  set quantity(double? quantity) => _$this._quantity = quantity;

  double? _unitPrice;
  double? get unitPrice => _$this._unitPrice;
  set unitPrice(double? unitPrice) => _$this._unitPrice = unitPrice;

  CreateInventoryTransactionDetailRequestBuilder() {
    CreateInventoryTransactionDetailRequest._defaults(this);
  }

  CreateInventoryTransactionDetailRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ingredientId = $v.ingredientId;
      _quantity = $v.quantity;
      _unitPrice = $v.unitPrice;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateInventoryTransactionDetailRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateInventoryTransactionDetailRequest;
  }

  @override
  void update(
      void Function(CreateInventoryTransactionDetailRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateInventoryTransactionDetailRequest build() => _build();

  _$CreateInventoryTransactionDetailRequest _build() {
    final _$result = _$v ??
        new _$CreateInventoryTransactionDetailRequest._(
          ingredientId: ingredientId,
          quantity: quantity,
          unitPrice: unitPrice,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
