// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_item_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$OrderItemResponse extends OrderItemResponse {
  @override
  final int? itemId;
  @override
  final int? quantity;
  @override
  final double? unitPrice;
  @override
  final double? totalPrice;
  @override
  final MenuItemResponse? menuItem;

  factory _$OrderItemResponse(
          [void Function(OrderItemResponseBuilder)? updates]) =>
      (OrderItemResponseBuilder()..update(updates))._build();

  _$OrderItemResponse._(
      {this.itemId,
      this.quantity,
      this.unitPrice,
      this.totalPrice,
      this.menuItem})
      : super._();
  @override
  OrderItemResponse rebuild(void Function(OrderItemResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrderItemResponseBuilder toBuilder() =>
      OrderItemResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrderItemResponse &&
        itemId == other.itemId &&
        quantity == other.quantity &&
        unitPrice == other.unitPrice &&
        totalPrice == other.totalPrice &&
        menuItem == other.menuItem;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, itemId.hashCode);
    _$hash = $jc(_$hash, quantity.hashCode);
    _$hash = $jc(_$hash, unitPrice.hashCode);
    _$hash = $jc(_$hash, totalPrice.hashCode);
    _$hash = $jc(_$hash, menuItem.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OrderItemResponse')
          ..add('itemId', itemId)
          ..add('quantity', quantity)
          ..add('unitPrice', unitPrice)
          ..add('totalPrice', totalPrice)
          ..add('menuItem', menuItem))
        .toString();
  }
}

class OrderItemResponseBuilder
    implements Builder<OrderItemResponse, OrderItemResponseBuilder> {
  _$OrderItemResponse? _$v;

  int? _itemId;
  int? get itemId => _$this._itemId;
  set itemId(int? itemId) => _$this._itemId = itemId;

  int? _quantity;
  int? get quantity => _$this._quantity;
  set quantity(int? quantity) => _$this._quantity = quantity;

  double? _unitPrice;
  double? get unitPrice => _$this._unitPrice;
  set unitPrice(double? unitPrice) => _$this._unitPrice = unitPrice;

  double? _totalPrice;
  double? get totalPrice => _$this._totalPrice;
  set totalPrice(double? totalPrice) => _$this._totalPrice = totalPrice;

  MenuItemResponseBuilder? _menuItem;
  MenuItemResponseBuilder get menuItem =>
      _$this._menuItem ??= MenuItemResponseBuilder();
  set menuItem(MenuItemResponseBuilder? menuItem) =>
      _$this._menuItem = menuItem;

  OrderItemResponseBuilder() {
    OrderItemResponse._defaults(this);
  }

  OrderItemResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _itemId = $v.itemId;
      _quantity = $v.quantity;
      _unitPrice = $v.unitPrice;
      _totalPrice = $v.totalPrice;
      _menuItem = $v.menuItem?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OrderItemResponse other) {
    _$v = other as _$OrderItemResponse;
  }

  @override
  void update(void Function(OrderItemResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OrderItemResponse build() => _build();

  _$OrderItemResponse _build() {
    _$OrderItemResponse _$result;
    try {
      _$result = _$v ??
          _$OrderItemResponse._(
            itemId: itemId,
            quantity: quantity,
            unitPrice: unitPrice,
            totalPrice: totalPrice,
            menuItem: _menuItem?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'menuItem';
        _menuItem?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'OrderItemResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
