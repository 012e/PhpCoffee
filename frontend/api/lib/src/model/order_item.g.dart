// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_item.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$OrderItem extends OrderItem {
  @override
  final int? orderId;
  @override
  final int? itemId;
  @override
  final int? quantity;
  @override
  final double? unitPrice;
  @override
  final double? totalPrice;
  @override
  final MenuItem? item;
  @override
  final Order? order;

  factory _$OrderItem([void Function(OrderItemBuilder)? updates]) =>
      (new OrderItemBuilder()..update(updates))._build();

  _$OrderItem._(
      {this.orderId,
      this.itemId,
      this.quantity,
      this.unitPrice,
      this.totalPrice,
      this.item,
      this.order})
      : super._();

  @override
  OrderItem rebuild(void Function(OrderItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrderItemBuilder toBuilder() => new OrderItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrderItem &&
        orderId == other.orderId &&
        itemId == other.itemId &&
        quantity == other.quantity &&
        unitPrice == other.unitPrice &&
        totalPrice == other.totalPrice &&
        item == other.item &&
        order == other.order;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, orderId.hashCode);
    _$hash = $jc(_$hash, itemId.hashCode);
    _$hash = $jc(_$hash, quantity.hashCode);
    _$hash = $jc(_$hash, unitPrice.hashCode);
    _$hash = $jc(_$hash, totalPrice.hashCode);
    _$hash = $jc(_$hash, item.hashCode);
    _$hash = $jc(_$hash, order.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OrderItem')
          ..add('orderId', orderId)
          ..add('itemId', itemId)
          ..add('quantity', quantity)
          ..add('unitPrice', unitPrice)
          ..add('totalPrice', totalPrice)
          ..add('item', item)
          ..add('order', order))
        .toString();
  }
}

class OrderItemBuilder implements Builder<OrderItem, OrderItemBuilder> {
  _$OrderItem? _$v;

  int? _orderId;
  int? get orderId => _$this._orderId;
  set orderId(int? orderId) => _$this._orderId = orderId;

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

  MenuItemBuilder? _item;
  MenuItemBuilder get item => _$this._item ??= new MenuItemBuilder();
  set item(MenuItemBuilder? item) => _$this._item = item;

  OrderBuilder? _order;
  OrderBuilder get order => _$this._order ??= new OrderBuilder();
  set order(OrderBuilder? order) => _$this._order = order;

  OrderItemBuilder() {
    OrderItem._defaults(this);
  }

  OrderItemBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _orderId = $v.orderId;
      _itemId = $v.itemId;
      _quantity = $v.quantity;
      _unitPrice = $v.unitPrice;
      _totalPrice = $v.totalPrice;
      _item = $v.item?.toBuilder();
      _order = $v.order?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OrderItem other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OrderItem;
  }

  @override
  void update(void Function(OrderItemBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OrderItem build() => _build();

  _$OrderItem _build() {
    _$OrderItem _$result;
    try {
      _$result = _$v ??
          new _$OrderItem._(
            orderId: orderId,
            itemId: itemId,
            quantity: quantity,
            unitPrice: unitPrice,
            totalPrice: totalPrice,
            item: _item?.build(),
            order: _order?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'item';
        _item?.build();
        _$failedField = 'order';
        _order?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OrderItem', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
