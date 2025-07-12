// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_transaction_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$InventoryTransactionResponse extends InventoryTransactionResponse {
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
  final BuiltList<InventoryTransactionDetailResponse>?
      inventoryTransactionDetailResponses;

  factory _$InventoryTransactionResponse(
          [void Function(InventoryTransactionResponseBuilder)? updates]) =>
      (InventoryTransactionResponseBuilder()..update(updates))._build();

  _$InventoryTransactionResponse._(
      {this.transactionId,
      this.transactionType,
      this.transactionDate,
      this.createdBy,
      this.notes,
      this.inventoryTransactionDetailResponses})
      : super._();
  @override
  InventoryTransactionResponse rebuild(
          void Function(InventoryTransactionResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InventoryTransactionResponseBuilder toBuilder() =>
      InventoryTransactionResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InventoryTransactionResponse &&
        transactionId == other.transactionId &&
        transactionType == other.transactionType &&
        transactionDate == other.transactionDate &&
        createdBy == other.createdBy &&
        notes == other.notes &&
        inventoryTransactionDetailResponses ==
            other.inventoryTransactionDetailResponses;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, transactionId.hashCode);
    _$hash = $jc(_$hash, transactionType.hashCode);
    _$hash = $jc(_$hash, transactionDate.hashCode);
    _$hash = $jc(_$hash, createdBy.hashCode);
    _$hash = $jc(_$hash, notes.hashCode);
    _$hash = $jc(_$hash, inventoryTransactionDetailResponses.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'InventoryTransactionResponse')
          ..add('transactionId', transactionId)
          ..add('transactionType', transactionType)
          ..add('transactionDate', transactionDate)
          ..add('createdBy', createdBy)
          ..add('notes', notes)
          ..add('inventoryTransactionDetailResponses',
              inventoryTransactionDetailResponses))
        .toString();
  }
}

class InventoryTransactionResponseBuilder
    implements
        Builder<InventoryTransactionResponse,
            InventoryTransactionResponseBuilder> {
  _$InventoryTransactionResponse? _$v;

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

  ListBuilder<InventoryTransactionDetailResponse>?
      _inventoryTransactionDetailResponses;
  ListBuilder<InventoryTransactionDetailResponse>
      get inventoryTransactionDetailResponses =>
          _$this._inventoryTransactionDetailResponses ??=
              ListBuilder<InventoryTransactionDetailResponse>();
  set inventoryTransactionDetailResponses(
          ListBuilder<InventoryTransactionDetailResponse>?
              inventoryTransactionDetailResponses) =>
      _$this._inventoryTransactionDetailResponses =
          inventoryTransactionDetailResponses;

  InventoryTransactionResponseBuilder() {
    InventoryTransactionResponse._defaults(this);
  }

  InventoryTransactionResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _transactionId = $v.transactionId;
      _transactionType = $v.transactionType;
      _transactionDate = $v.transactionDate;
      _createdBy = $v.createdBy;
      _notes = $v.notes;
      _inventoryTransactionDetailResponses =
          $v.inventoryTransactionDetailResponses?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InventoryTransactionResponse other) {
    _$v = other as _$InventoryTransactionResponse;
  }

  @override
  void update(void Function(InventoryTransactionResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  InventoryTransactionResponse build() => _build();

  _$InventoryTransactionResponse _build() {
    _$InventoryTransactionResponse _$result;
    try {
      _$result = _$v ??
          _$InventoryTransactionResponse._(
            transactionId: transactionId,
            transactionType: transactionType,
            transactionDate: transactionDate,
            createdBy: createdBy,
            notes: notes,
            inventoryTransactionDetailResponses:
                _inventoryTransactionDetailResponses?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'inventoryTransactionDetailResponses';
        _inventoryTransactionDetailResponses?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'InventoryTransactionResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
