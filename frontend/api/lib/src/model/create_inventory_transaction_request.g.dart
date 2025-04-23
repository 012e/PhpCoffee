// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_inventory_transaction_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateInventoryTransactionRequest
    extends CreateInventoryTransactionRequest {
  @override
  final String? transactionType;
  @override
  final String? createdBy;
  @override
  final String? notes;
  @override
  final BuiltList<CreateInventoryTransactionDetailRequest>?
      inventoryTransactionDetails;

  factory _$CreateInventoryTransactionRequest(
          [void Function(CreateInventoryTransactionRequestBuilder)? updates]) =>
      (new CreateInventoryTransactionRequestBuilder()..update(updates))
          ._build();

  _$CreateInventoryTransactionRequest._(
      {this.transactionType,
      this.createdBy,
      this.notes,
      this.inventoryTransactionDetails})
      : super._();

  @override
  CreateInventoryTransactionRequest rebuild(
          void Function(CreateInventoryTransactionRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateInventoryTransactionRequestBuilder toBuilder() =>
      new CreateInventoryTransactionRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateInventoryTransactionRequest &&
        transactionType == other.transactionType &&
        createdBy == other.createdBy &&
        notes == other.notes &&
        inventoryTransactionDetails == other.inventoryTransactionDetails;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, transactionType.hashCode);
    _$hash = $jc(_$hash, createdBy.hashCode);
    _$hash = $jc(_$hash, notes.hashCode);
    _$hash = $jc(_$hash, inventoryTransactionDetails.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateInventoryTransactionRequest')
          ..add('transactionType', transactionType)
          ..add('createdBy', createdBy)
          ..add('notes', notes)
          ..add('inventoryTransactionDetails', inventoryTransactionDetails))
        .toString();
  }
}

class CreateInventoryTransactionRequestBuilder
    implements
        Builder<CreateInventoryTransactionRequest,
            CreateInventoryTransactionRequestBuilder> {
  _$CreateInventoryTransactionRequest? _$v;

  String? _transactionType;
  String? get transactionType => _$this._transactionType;
  set transactionType(String? transactionType) =>
      _$this._transactionType = transactionType;

  String? _createdBy;
  String? get createdBy => _$this._createdBy;
  set createdBy(String? createdBy) => _$this._createdBy = createdBy;

  String? _notes;
  String? get notes => _$this._notes;
  set notes(String? notes) => _$this._notes = notes;

  ListBuilder<CreateInventoryTransactionDetailRequest>?
      _inventoryTransactionDetails;
  ListBuilder<CreateInventoryTransactionDetailRequest>
      get inventoryTransactionDetails => _$this._inventoryTransactionDetails ??=
          new ListBuilder<CreateInventoryTransactionDetailRequest>();
  set inventoryTransactionDetails(
          ListBuilder<CreateInventoryTransactionDetailRequest>?
              inventoryTransactionDetails) =>
      _$this._inventoryTransactionDetails = inventoryTransactionDetails;

  CreateInventoryTransactionRequestBuilder() {
    CreateInventoryTransactionRequest._defaults(this);
  }

  CreateInventoryTransactionRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _transactionType = $v.transactionType;
      _createdBy = $v.createdBy;
      _notes = $v.notes;
      _inventoryTransactionDetails =
          $v.inventoryTransactionDetails?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateInventoryTransactionRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateInventoryTransactionRequest;
  }

  @override
  void update(
      void Function(CreateInventoryTransactionRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateInventoryTransactionRequest build() => _build();

  _$CreateInventoryTransactionRequest _build() {
    _$CreateInventoryTransactionRequest _$result;
    try {
      _$result = _$v ??
          new _$CreateInventoryTransactionRequest._(
            transactionType: transactionType,
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
        throw new BuiltValueNestedFieldError(
            r'CreateInventoryTransactionRequest', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
