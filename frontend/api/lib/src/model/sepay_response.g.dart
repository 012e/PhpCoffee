// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sepay_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SepayResponse extends SepayResponse {
  @override
  final int? id;
  @override
  final String? gateway;
  @override
  final DateTime? transactionDate;
  @override
  final String? accountNumber;
  @override
  final String? code;
  @override
  final String? content;
  @override
  final String? transferType;
  @override
  final double? transferAmount;
  @override
  final double? accumulated;
  @override
  final String? subAccount;
  @override
  final String? referenceCode;
  @override
  final String? description;

  factory _$SepayResponse([void Function(SepayResponseBuilder)? updates]) =>
      (new SepayResponseBuilder()..update(updates))._build();

  _$SepayResponse._(
      {this.id,
      this.gateway,
      this.transactionDate,
      this.accountNumber,
      this.code,
      this.content,
      this.transferType,
      this.transferAmount,
      this.accumulated,
      this.subAccount,
      this.referenceCode,
      this.description})
      : super._();

  @override
  SepayResponse rebuild(void Function(SepayResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SepayResponseBuilder toBuilder() => new SepayResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SepayResponse &&
        id == other.id &&
        gateway == other.gateway &&
        transactionDate == other.transactionDate &&
        accountNumber == other.accountNumber &&
        code == other.code &&
        content == other.content &&
        transferType == other.transferType &&
        transferAmount == other.transferAmount &&
        accumulated == other.accumulated &&
        subAccount == other.subAccount &&
        referenceCode == other.referenceCode &&
        description == other.description;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, gateway.hashCode);
    _$hash = $jc(_$hash, transactionDate.hashCode);
    _$hash = $jc(_$hash, accountNumber.hashCode);
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, content.hashCode);
    _$hash = $jc(_$hash, transferType.hashCode);
    _$hash = $jc(_$hash, transferAmount.hashCode);
    _$hash = $jc(_$hash, accumulated.hashCode);
    _$hash = $jc(_$hash, subAccount.hashCode);
    _$hash = $jc(_$hash, referenceCode.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SepayResponse')
          ..add('id', id)
          ..add('gateway', gateway)
          ..add('transactionDate', transactionDate)
          ..add('accountNumber', accountNumber)
          ..add('code', code)
          ..add('content', content)
          ..add('transferType', transferType)
          ..add('transferAmount', transferAmount)
          ..add('accumulated', accumulated)
          ..add('subAccount', subAccount)
          ..add('referenceCode', referenceCode)
          ..add('description', description))
        .toString();
  }
}

class SepayResponseBuilder
    implements Builder<SepayResponse, SepayResponseBuilder> {
  _$SepayResponse? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _gateway;
  String? get gateway => _$this._gateway;
  set gateway(String? gateway) => _$this._gateway = gateway;

  DateTime? _transactionDate;
  DateTime? get transactionDate => _$this._transactionDate;
  set transactionDate(DateTime? transactionDate) =>
      _$this._transactionDate = transactionDate;

  String? _accountNumber;
  String? get accountNumber => _$this._accountNumber;
  set accountNumber(String? accountNumber) =>
      _$this._accountNumber = accountNumber;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  String? _content;
  String? get content => _$this._content;
  set content(String? content) => _$this._content = content;

  String? _transferType;
  String? get transferType => _$this._transferType;
  set transferType(String? transferType) => _$this._transferType = transferType;

  double? _transferAmount;
  double? get transferAmount => _$this._transferAmount;
  set transferAmount(double? transferAmount) =>
      _$this._transferAmount = transferAmount;

  double? _accumulated;
  double? get accumulated => _$this._accumulated;
  set accumulated(double? accumulated) => _$this._accumulated = accumulated;

  String? _subAccount;
  String? get subAccount => _$this._subAccount;
  set subAccount(String? subAccount) => _$this._subAccount = subAccount;

  String? _referenceCode;
  String? get referenceCode => _$this._referenceCode;
  set referenceCode(String? referenceCode) =>
      _$this._referenceCode = referenceCode;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  SepayResponseBuilder() {
    SepayResponse._defaults(this);
  }

  SepayResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _gateway = $v.gateway;
      _transactionDate = $v.transactionDate;
      _accountNumber = $v.accountNumber;
      _code = $v.code;
      _content = $v.content;
      _transferType = $v.transferType;
      _transferAmount = $v.transferAmount;
      _accumulated = $v.accumulated;
      _subAccount = $v.subAccount;
      _referenceCode = $v.referenceCode;
      _description = $v.description;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SepayResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SepayResponse;
  }

  @override
  void update(void Function(SepayResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SepayResponse build() => _build();

  _$SepayResponse _build() {
    final _$result = _$v ??
        new _$SepayResponse._(
          id: id,
          gateway: gateway,
          transactionDate: transactionDate,
          accountNumber: accountNumber,
          code: code,
          content: content,
          transferType: transferType,
          transferAmount: transferAmount,
          accumulated: accumulated,
          subAccount: subAccount,
          referenceCode: referenceCode,
          description: description,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
