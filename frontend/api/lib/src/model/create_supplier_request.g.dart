// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_supplier_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateSupplierRequest extends CreateSupplierRequest {
  @override
  final String? supplierName;
  @override
  final String? contactPhone;
  @override
  final String? address;
  @override
  final bool? isActive;

  factory _$CreateSupplierRequest(
          [void Function(CreateSupplierRequestBuilder)? updates]) =>
      (CreateSupplierRequestBuilder()..update(updates))._build();

  _$CreateSupplierRequest._(
      {this.supplierName, this.contactPhone, this.address, this.isActive})
      : super._();
  @override
  CreateSupplierRequest rebuild(
          void Function(CreateSupplierRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateSupplierRequestBuilder toBuilder() =>
      CreateSupplierRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateSupplierRequest &&
        supplierName == other.supplierName &&
        contactPhone == other.contactPhone &&
        address == other.address &&
        isActive == other.isActive;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, supplierName.hashCode);
    _$hash = $jc(_$hash, contactPhone.hashCode);
    _$hash = $jc(_$hash, address.hashCode);
    _$hash = $jc(_$hash, isActive.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateSupplierRequest')
          ..add('supplierName', supplierName)
          ..add('contactPhone', contactPhone)
          ..add('address', address)
          ..add('isActive', isActive))
        .toString();
  }
}

class CreateSupplierRequestBuilder
    implements Builder<CreateSupplierRequest, CreateSupplierRequestBuilder> {
  _$CreateSupplierRequest? _$v;

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

  CreateSupplierRequestBuilder() {
    CreateSupplierRequest._defaults(this);
  }

  CreateSupplierRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _supplierName = $v.supplierName;
      _contactPhone = $v.contactPhone;
      _address = $v.address;
      _isActive = $v.isActive;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateSupplierRequest other) {
    _$v = other as _$CreateSupplierRequest;
  }

  @override
  void update(void Function(CreateSupplierRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateSupplierRequest build() => _build();

  _$CreateSupplierRequest _build() {
    final _$result = _$v ??
        _$CreateSupplierRequest._(
          supplierName: supplierName,
          contactPhone: contactPhone,
          address: address,
          isActive: isActive,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
