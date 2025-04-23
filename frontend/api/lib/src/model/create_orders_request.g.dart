// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_orders_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateOrdersRequest extends CreateOrdersRequest {
  @override
  final String? paymentStatus;
  @override
  final BuiltList<CreateOrderItemRequest>? createOrderItemRequests;
  @override
  final CreatePaymentRequest? createPaymentRequest;

  factory _$CreateOrdersRequest(
          [void Function(CreateOrdersRequestBuilder)? updates]) =>
      (new CreateOrdersRequestBuilder()..update(updates))._build();

  _$CreateOrdersRequest._(
      {this.paymentStatus,
      this.createOrderItemRequests,
      this.createPaymentRequest})
      : super._();

  @override
  CreateOrdersRequest rebuild(
          void Function(CreateOrdersRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateOrdersRequestBuilder toBuilder() =>
      new CreateOrdersRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateOrdersRequest &&
        paymentStatus == other.paymentStatus &&
        createOrderItemRequests == other.createOrderItemRequests &&
        createPaymentRequest == other.createPaymentRequest;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, paymentStatus.hashCode);
    _$hash = $jc(_$hash, createOrderItemRequests.hashCode);
    _$hash = $jc(_$hash, createPaymentRequest.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateOrdersRequest')
          ..add('paymentStatus', paymentStatus)
          ..add('createOrderItemRequests', createOrderItemRequests)
          ..add('createPaymentRequest', createPaymentRequest))
        .toString();
  }
}

class CreateOrdersRequestBuilder
    implements Builder<CreateOrdersRequest, CreateOrdersRequestBuilder> {
  _$CreateOrdersRequest? _$v;

  String? _paymentStatus;
  String? get paymentStatus => _$this._paymentStatus;
  set paymentStatus(String? paymentStatus) =>
      _$this._paymentStatus = paymentStatus;

  ListBuilder<CreateOrderItemRequest>? _createOrderItemRequests;
  ListBuilder<CreateOrderItemRequest> get createOrderItemRequests =>
      _$this._createOrderItemRequests ??=
          new ListBuilder<CreateOrderItemRequest>();
  set createOrderItemRequests(
          ListBuilder<CreateOrderItemRequest>? createOrderItemRequests) =>
      _$this._createOrderItemRequests = createOrderItemRequests;

  CreatePaymentRequestBuilder? _createPaymentRequest;
  CreatePaymentRequestBuilder get createPaymentRequest =>
      _$this._createPaymentRequest ??= new CreatePaymentRequestBuilder();
  set createPaymentRequest(CreatePaymentRequestBuilder? createPaymentRequest) =>
      _$this._createPaymentRequest = createPaymentRequest;

  CreateOrdersRequestBuilder() {
    CreateOrdersRequest._defaults(this);
  }

  CreateOrdersRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _paymentStatus = $v.paymentStatus;
      _createOrderItemRequests = $v.createOrderItemRequests?.toBuilder();
      _createPaymentRequest = $v.createPaymentRequest?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateOrdersRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateOrdersRequest;
  }

  @override
  void update(void Function(CreateOrdersRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateOrdersRequest build() => _build();

  _$CreateOrdersRequest _build() {
    _$CreateOrdersRequest _$result;
    try {
      _$result = _$v ??
          new _$CreateOrdersRequest._(
            paymentStatus: paymentStatus,
            createOrderItemRequests: _createOrderItemRequests?.build(),
            createPaymentRequest: _createPaymentRequest?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'createOrderItemRequests';
        _createOrderItemRequests?.build();
        _$failedField = 'createPaymentRequest';
        _createPaymentRequest?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CreateOrdersRequest', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
