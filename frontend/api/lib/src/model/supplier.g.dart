// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supplier.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Supplier extends Supplier {
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
  @override
  final BuiltList<Ingredient>? ingredients;

  factory _$Supplier([void Function(SupplierBuilder)? updates]) =>
      (SupplierBuilder()..update(updates))._build();

  _$Supplier._(
      {this.supplierId,
      this.supplierName,
      this.contactPhone,
      this.address,
      this.isActive,
      this.createdAt,
      this.ingredients})
      : super._();
  @override
  Supplier rebuild(void Function(SupplierBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SupplierBuilder toBuilder() => SupplierBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Supplier &&
        supplierId == other.supplierId &&
        supplierName == other.supplierName &&
        contactPhone == other.contactPhone &&
        address == other.address &&
        isActive == other.isActive &&
        createdAt == other.createdAt &&
        ingredients == other.ingredients;
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
    _$hash = $jc(_$hash, ingredients.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Supplier')
          ..add('supplierId', supplierId)
          ..add('supplierName', supplierName)
          ..add('contactPhone', contactPhone)
          ..add('address', address)
          ..add('isActive', isActive)
          ..add('createdAt', createdAt)
          ..add('ingredients', ingredients))
        .toString();
  }
}

class SupplierBuilder implements Builder<Supplier, SupplierBuilder> {
  _$Supplier? _$v;

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

  ListBuilder<Ingredient>? _ingredients;
  ListBuilder<Ingredient> get ingredients =>
      _$this._ingredients ??= ListBuilder<Ingredient>();
  set ingredients(ListBuilder<Ingredient>? ingredients) =>
      _$this._ingredients = ingredients;

  SupplierBuilder() {
    Supplier._defaults(this);
  }

  SupplierBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _supplierId = $v.supplierId;
      _supplierName = $v.supplierName;
      _contactPhone = $v.contactPhone;
      _address = $v.address;
      _isActive = $v.isActive;
      _createdAt = $v.createdAt;
      _ingredients = $v.ingredients?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Supplier other) {
    _$v = other as _$Supplier;
  }

  @override
  void update(void Function(SupplierBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Supplier build() => _build();

  _$Supplier _build() {
    _$Supplier _$result;
    try {
      _$result = _$v ??
          _$Supplier._(
            supplierId: supplierId,
            supplierName: supplierName,
            contactPhone: contactPhone,
            address: address,
            isActive: isActive,
            createdAt: createdAt,
            ingredients: _ingredients?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ingredients';
        _ingredients?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'Supplier', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
