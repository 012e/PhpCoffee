// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_status_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PaymentStatusResponse extends PaymentStatusResponse {
  @override
  final String? paymentStatus;
  @override
  final int? orderId;
  @override
  final bool? isPaid;
  @override
  final String? message;

  factory _$PaymentStatusResponse(
          [void Function(PaymentStatusResponseBuilder)? updates]) =>
      (PaymentStatusResponseBuilder()..update(updates))._build();

  _$PaymentStatusResponse._(
      {this.paymentStatus, this.orderId, this.isPaid, this.message})
      : super._();
  @override
  PaymentStatusResponse rebuild(
          void Function(PaymentStatusResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PaymentStatusResponseBuilder toBuilder() =>
      PaymentStatusResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaymentStatusResponse &&
        paymentStatus == other.paymentStatus &&
        orderId == other.orderId &&
        isPaid == other.isPaid &&
        message == other.message;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, paymentStatus.hashCode);
    _$hash = $jc(_$hash, orderId.hashCode);
    _$hash = $jc(_$hash, isPaid.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PaymentStatusResponse')
          ..add('paymentStatus', paymentStatus)
          ..add('orderId', orderId)
          ..add('isPaid', isPaid)
          ..add('message', message))
        .toString();
  }
}

class PaymentStatusResponseBuilder
    implements Builder<PaymentStatusResponse, PaymentStatusResponseBuilder> {
  _$PaymentStatusResponse? _$v;

  String? _paymentStatus;
  String? get paymentStatus => _$this._paymentStatus;
  set paymentStatus(String? paymentStatus) =>
      _$this._paymentStatus = paymentStatus;

  int? _orderId;
  int? get orderId => _$this._orderId;
  set orderId(int? orderId) => _$this._orderId = orderId;

  bool? _isPaid;
  bool? get isPaid => _$this._isPaid;
  set isPaid(bool? isPaid) => _$this._isPaid = isPaid;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  PaymentStatusResponseBuilder() {
    PaymentStatusResponse._defaults(this);
  }

  PaymentStatusResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _paymentStatus = $v.paymentStatus;
      _orderId = $v.orderId;
      _isPaid = $v.isPaid;
      _message = $v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PaymentStatusResponse other) {
    _$v = other as _$PaymentStatusResponse;
  }

  @override
  void update(void Function(PaymentStatusResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PaymentStatusResponse build() => _build();

  _$PaymentStatusResponse _build() {
    final _$result = _$v ??
        _$PaymentStatusResponse._(
          paymentStatus: paymentStatus,
          orderId: orderId,
          isPaid: isPaid,
          message: message,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
