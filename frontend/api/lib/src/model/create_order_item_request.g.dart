// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_order_item_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateOrderItemRequest extends CreateOrderItemRequest {
  @override
  final int? itemId;
  @override
  final int? quantity;
  @override
  final double? unitPrice;

  factory _$CreateOrderItemRequest(
          [void Function(CreateOrderItemRequestBuilder)? updates]) =>
      (CreateOrderItemRequestBuilder()..update(updates))._build();

  _$CreateOrderItemRequest._({this.itemId, this.quantity, this.unitPrice})
      : super._();
  @override
  CreateOrderItemRequest rebuild(
          void Function(CreateOrderItemRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateOrderItemRequestBuilder toBuilder() =>
      CreateOrderItemRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateOrderItemRequest &&
        itemId == other.itemId &&
        quantity == other.quantity &&
        unitPrice == other.unitPrice;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, itemId.hashCode);
    _$hash = $jc(_$hash, quantity.hashCode);
    _$hash = $jc(_$hash, unitPrice.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateOrderItemRequest')
          ..add('itemId', itemId)
          ..add('quantity', quantity)
          ..add('unitPrice', unitPrice))
        .toString();
  }
}

class CreateOrderItemRequestBuilder
    implements Builder<CreateOrderItemRequest, CreateOrderItemRequestBuilder> {
  _$CreateOrderItemRequest? _$v;

  int? _itemId;
  int? get itemId => _$this._itemId;
  set itemId(int? itemId) => _$this._itemId = itemId;

  int? _quantity;
  int? get quantity => _$this._quantity;
  set quantity(int? quantity) => _$this._quantity = quantity;

  double? _unitPrice;
  double? get unitPrice => _$this._unitPrice;
  set unitPrice(double? unitPrice) => _$this._unitPrice = unitPrice;

  CreateOrderItemRequestBuilder() {
    CreateOrderItemRequest._defaults(this);
  }

  CreateOrderItemRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _itemId = $v.itemId;
      _quantity = $v.quantity;
      _unitPrice = $v.unitPrice;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateOrderItemRequest other) {
    _$v = other as _$CreateOrderItemRequest;
  }

  @override
  void update(void Function(CreateOrderItemRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateOrderItemRequest build() => _build();

  _$CreateOrderItemRequest _build() {
    final _$result = _$v ??
        _$CreateOrderItemRequest._(
          itemId: itemId,
          quantity: quantity,
          unitPrice: unitPrice,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
