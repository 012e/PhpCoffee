// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_transaction.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$InventoryTransaction extends InventoryTransaction {
  @override
  final int? transactionId;
  @override
  final String? transactionType;
  @override
  final DateTime? transactionDate;
  @override
  final String? createdBy;
  @override
  final String? notes;
  @override
  final BuiltList<InventoryTransactionDetail>? inventoryTransactionDetails;

  factory _$InventoryTransaction(
          [void Function(InventoryTransactionBuilder)? updates]) =>
      (InventoryTransactionBuilder()..update(updates))._build();

  _$InventoryTransaction._(
      {this.transactionId,
      this.transactionType,
      this.transactionDate,
      this.createdBy,
      this.notes,
      this.inventoryTransactionDetails})
      : super._();
  @override
  InventoryTransaction rebuild(
          void Function(InventoryTransactionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InventoryTransactionBuilder toBuilder() =>
      InventoryTransactionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InventoryTransaction &&
        transactionId == other.transactionId &&
        transactionType == other.transactionType &&
        transactionDate == other.transactionDate &&
        createdBy == other.createdBy &&
        notes == other.notes &&
        inventoryTransactionDetails == other.inventoryTransactionDetails;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, transactionId.hashCode);
    _$hash = $jc(_$hash, transactionType.hashCode);
    _$hash = $jc(_$hash, transactionDate.hashCode);
    _$hash = $jc(_$hash, createdBy.hashCode);
    _$hash = $jc(_$hash, notes.hashCode);
    _$hash = $jc(_$hash, inventoryTransactionDetails.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'InventoryTransaction')
          ..add('transactionId', transactionId)
          ..add('transactionType', transactionType)
          ..add('transactionDate', transactionDate)
          ..add('createdBy', createdBy)
          ..add('notes', notes)
          ..add('inventoryTransactionDetails', inventoryTransactionDetails))
        .toString();
  }
}

class InventoryTransactionBuilder
    implements Builder<InventoryTransaction, InventoryTransactionBuilder> {
  _$InventoryTransaction? _$v;

  int? _transactionId;
  int? get transactionId => _$this._transactionId;
  set transactionId(int? transactionId) =>
      _$this._transactionId = transactionId;

  String? _transactionType;
  String? get transactionType => _$this._transactionType;
  set transactionType(String? transactionType) =>
      _$this._transactionType = transactionType;

  DateTime? _transactionDate;
  DateTime? get transactionDate => _$this._transactionDate;
  set transactionDate(DateTime? transactionDate) =>
      _$this._transactionDate = transactionDate;

  String? _createdBy;
  String? get createdBy => _$this._createdBy;
  set createdBy(String? createdBy) => _$this._createdBy = createdBy;

  String? _notes;
  String? get notes => _$this._notes;
  set notes(String? notes) => _$this._notes = notes;

  ListBuilder<InventoryTransactionDetail>? _inventoryTransactionDetails;
  ListBuilder<InventoryTransactionDetail> get inventoryTransactionDetails =>
      _$this._inventoryTransactionDetails ??=
          ListBuilder<InventoryTransactionDetail>();
  set inventoryTransactionDetails(
          ListBuilder<InventoryTransactionDetail>?
              inventoryTransactionDetails) =>
      _$this._inventoryTransactionDetails = inventoryTransactionDetails;

  InventoryTransactionBuilder() {
    InventoryTransaction._defaults(this);
  }

  InventoryTransactionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _transactionId = $v.transactionId;
      _transactionType = $v.transactionType;
      _transactionDate = $v.transactionDate;
      _createdBy = $v.createdBy;
      _notes = $v.notes;
      _inventoryTransactionDetails =
          $v.inventoryTransactionDetails?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InventoryTransaction other) {
    _$v = other as _$InventoryTransaction;
  }

  @override
  void update(void Function(InventoryTransactionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  InventoryTransaction build() => _build();

  _$InventoryTransaction _build() {
    _$InventoryTransaction _$result;
    try {
      _$result = _$v ??
          _$InventoryTransaction._(
            transactionId: transactionId,
            transactionType: transactionType,
            transactionDate: transactionDate,
            createdBy: createdBy,
            notes: notes,
            inventoryTransactionDetails: _inventoryTransactionDetails?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'inventoryTransactionDetails';
        _inventoryTransactionDetails?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'InventoryTransaction', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
