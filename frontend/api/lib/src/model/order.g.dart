// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Order extends Order {
  @override
  final int? orderId;
  @override
  final DateTime? orderDate;
  @override
  final double? totalAmount;
  @override
  final String? paymentStatus;
  @override
  final double? remaining;
  @override
  final BuiltList<OrderItem>? orderItems;
  @override
  final BuiltList<Payment>? payments;

  factory _$Order([void Function(OrderBuilder)? updates]) =>
      (OrderBuilder()..update(updates))._build();

  _$Order._(
      {this.orderId,
      this.orderDate,
      this.totalAmount,
      this.paymentStatus,
      this.remaining,
      this.orderItems,
      this.payments})
      : super._();
  @override
  Order rebuild(void Function(OrderBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrderBuilder toBuilder() => OrderBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Order &&
        orderId == other.orderId &&
        orderDate == other.orderDate &&
        totalAmount == other.totalAmount &&
        paymentStatus == other.paymentStatus &&
        remaining == other.remaining &&
        orderItems == other.orderItems &&
        payments == other.payments;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, orderId.hashCode);
    _$hash = $jc(_$hash, orderDate.hashCode);
    _$hash = $jc(_$hash, totalAmount.hashCode);
    _$hash = $jc(_$hash, paymentStatus.hashCode);
    _$hash = $jc(_$hash, remaining.hashCode);
    _$hash = $jc(_$hash, orderItems.hashCode);
    _$hash = $jc(_$hash, payments.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Order')
          ..add('orderId', orderId)
          ..add('orderDate', orderDate)
          ..add('totalAmount', totalAmount)
          ..add('paymentStatus', paymentStatus)
          ..add('remaining', remaining)
          ..add('orderItems', orderItems)
          ..add('payments', payments))
        .toString();
  }
}

class OrderBuilder implements Builder<Order, OrderBuilder> {
  _$Order? _$v;

  int? _orderId;
  int? get orderId => _$this._orderId;
  set orderId(int? orderId) => _$this._orderId = orderId;

  DateTime? _orderDate;
  DateTime? get orderDate => _$this._orderDate;
  set orderDate(DateTime? orderDate) => _$this._orderDate = orderDate;

  double? _totalAmount;
  double? get totalAmount => _$this._totalAmount;
  set totalAmount(double? totalAmount) => _$this._totalAmount = totalAmount;

  String? _paymentStatus;
  String? get paymentStatus => _$this._paymentStatus;
  set paymentStatus(String? paymentStatus) =>
      _$this._paymentStatus = paymentStatus;

  double? _remaining;
  double? get remaining => _$this._remaining;
  set remaining(double? remaining) => _$this._remaining = remaining;

  ListBuilder<OrderItem>? _orderItems;
  ListBuilder<OrderItem> get orderItems =>
      _$this._orderItems ??= ListBuilder<OrderItem>();
  set orderItems(ListBuilder<OrderItem>? orderItems) =>
      _$this._orderItems = orderItems;

  ListBuilder<Payment>? _payments;
  ListBuilder<Payment> get payments =>
      _$this._payments ??= ListBuilder<Payment>();
  set payments(ListBuilder<Payment>? payments) => _$this._payments = payments;

  OrderBuilder() {
    Order._defaults(this);
  }

  OrderBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _orderId = $v.orderId;
      _orderDate = $v.orderDate;
      _totalAmount = $v.totalAmount;
      _paymentStatus = $v.paymentStatus;
      _remaining = $v.remaining;
      _orderItems = $v.orderItems?.toBuilder();
      _payments = $v.payments?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Order other) {
    _$v = other as _$Order;
  }

  @override
  void update(void Function(OrderBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Order build() => _build();

  _$Order _build() {
    _$Order _$result;
    try {
      _$result = _$v ??
          _$Order._(
            orderId: orderId,
            orderDate: orderDate,
            totalAmount: totalAmount,
            paymentStatus: paymentStatus,
            remaining: remaining,
            orderItems: _orderItems?.build(),
            payments: _payments?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'orderItems';
        _orderItems?.build();
        _$failedField = 'payments';
        _payments?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'Order', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
