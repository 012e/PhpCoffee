// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supplier_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SupplierResponse extends SupplierResponse {
  @override
  final int? supplierId;
  @override
  final String? supplierName;
  @override
  final String? contactPhone;
  @override
  final String? address;
  @override
  final bool? isActive;
  @override
  final DateTime? createdAt;

  factory _$SupplierResponse(
          [void Function(SupplierResponseBuilder)? updates]) =>
      (new SupplierResponseBuilder()..update(updates))._build();

  _$SupplierResponse._(
      {this.supplierId,
      this.supplierName,
      this.contactPhone,
      this.address,
      this.isActive,
      this.createdAt})
      : super._();

  @override
  SupplierResponse rebuild(void Function(SupplierResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SupplierResponseBuilder toBuilder() =>
      new SupplierResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SupplierResponse &&
        supplierId == other.supplierId &&
        supplierName == other.supplierName &&
        contactPhone == other.contactPhone &&
        address == other.address &&
        isActive == other.isActive &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, supplierId.hashCode);
    _$hash = $jc(_$hash, supplierName.hashCode);
    _$hash = $jc(_$hash, contactPhone.hashCode);
    _$hash = $jc(_$hash, address.hashCode);
    _$hash = $jc(_$hash, isActive.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SupplierResponse')
          ..add('supplierId', supplierId)
          ..add('supplierName', supplierName)
          ..add('contactPhone', contactPhone)
          ..add('address', address)
          ..add('isActive', isActive)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class SupplierResponseBuilder
    implements Builder<SupplierResponse, SupplierResponseBuilder> {
  _$SupplierResponse? _$v;

  int? _supplierId;
  int? get supplierId => _$this._supplierId;
  set supplierId(int? supplierId) => _$this._supplierId = supplierId;

  String? _supplierName;
  String? get supplierName => _$this._supplierName;
  set supplierName(String? supplierName) => _$this._supplierName = supplierName;

  String? _contactPhone;
  String? get contactPhone => _$this._contactPhone;
  set contactPhone(String? contactPhone) => _$this._contactPhone = contactPhone;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  bool? _isActive;
  bool? get isActive => _$this._isActive;
  set isActive(bool? isActive) => _$this._isActive = isActive;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  SupplierResponseBuilder() {
    SupplierResponse._defaults(this);
  }

  SupplierResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _supplierId = $v.supplierId;
      _supplierName = $v.supplierName;
      _contactPhone = $v.contactPhone;
      _address = $v.address;
      _isActive = $v.isActive;
      _createdAt = $v.createdAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SupplierResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SupplierResponse;
  }

  @override
  void update(void Function(SupplierResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SupplierResponse build() => _build();

  _$SupplierResponse _build() {
    final _$result = _$v ??
        new _$SupplierResponse._(
          supplierId: supplierId,
          supplierName: supplierName,
          contactPhone: contactPhone,
          address: address,
          isActive: isActive,
          createdAt: createdAt,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
