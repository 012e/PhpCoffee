// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_payment_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreatePaymentRequest extends CreatePaymentRequest {
  @override
  final String? paymentMethod;

  factory _$CreatePaymentRequest(
          [void Function(CreatePaymentRequestBuilder)? updates]) =>
      (CreatePaymentRequestBuilder()..update(updates))._build();

  _$CreatePaymentRequest._({this.paymentMethod}) : super._();
  @override
  CreatePaymentRequest rebuild(
          void Function(CreatePaymentRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreatePaymentRequestBuilder toBuilder() =>
      CreatePaymentRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreatePaymentRequest &&
        paymentMethod == other.paymentMethod;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, paymentMethod.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreatePaymentRequest')
          ..add('paymentMethod', paymentMethod))
        .toString();
  }
}

class CreatePaymentRequestBuilder
    implements Builder<CreatePaymentRequest, CreatePaymentRequestBuilder> {
  _$CreatePaymentRequest? _$v;

  String? _paymentMethod;
  String? get paymentMethod => _$this._paymentMethod;
  set paymentMethod(String? paymentMethod) =>
      _$this._paymentMethod = paymentMethod;

  CreatePaymentRequestBuilder() {
    CreatePaymentRequest._defaults(this);
  }

  CreatePaymentRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _paymentMethod = $v.paymentMethod;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreatePaymentRequest other) {
    _$v = other as _$CreatePaymentRequest;
  }

  @override
  void update(void Function(CreatePaymentRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreatePaymentRequest build() => _build();

  _$CreatePaymentRequest _build() {
    final _$result = _$v ??
        _$CreatePaymentRequest._(
          paymentMethod: paymentMethod,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
