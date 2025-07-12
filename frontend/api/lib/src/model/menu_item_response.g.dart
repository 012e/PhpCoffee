// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_item_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MenuItemResponse extends MenuItemResponse {
  @override
  final int? itemId;
  @override
  final String? itemName;
  @override
  final String? description;
  @override
  final double? basePrice;
  @override
  final bool? isActive;
  @override
  final DateTime? createdAt;

  factory _$MenuItemResponse(
          [void Function(MenuItemResponseBuilder)? updates]) =>
      (MenuItemResponseBuilder()..update(updates))._build();

  _$MenuItemResponse._(
      {this.itemId,
      this.itemName,
      this.description,
      this.basePrice,
      this.isActive,
      this.createdAt})
      : super._();
  @override
  MenuItemResponse rebuild(void Function(MenuItemResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MenuItemResponseBuilder toBuilder() =>
      MenuItemResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MenuItemResponse &&
        itemId == other.itemId &&
        itemName == other.itemName &&
        description == other.description &&
        basePrice == other.basePrice &&
        isActive == other.isActive &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, itemId.hashCode);
    _$hash = $jc(_$hash, itemName.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, basePrice.hashCode);
    _$hash = $jc(_$hash, isActive.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MenuItemResponse')
          ..add('itemId', itemId)
          ..add('itemName', itemName)
          ..add('description', description)
          ..add('basePrice', basePrice)
          ..add('isActive', isActive)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class MenuItemResponseBuilder
    implements Builder<MenuItemResponse, MenuItemResponseBuilder> {
  _$MenuItemResponse? _$v;

  int? _itemId;
  int? get itemId => _$this._itemId;
  set itemId(int? itemId) => _$this._itemId = itemId;

  String? _itemName;
  String? get itemName => _$this._itemName;
  set itemName(String? itemName) => _$this._itemName = itemName;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  double? _basePrice;
  double? get basePrice => _$this._basePrice;
  set basePrice(double? basePrice) => _$this._basePrice = basePrice;

  bool? _isActive;
  bool? get isActive => _$this._isActive;
  set isActive(bool? isActive) => _$this._isActive = isActive;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  MenuItemResponseBuilder() {
    MenuItemResponse._defaults(this);
  }

  MenuItemResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _itemId = $v.itemId;
      _itemName = $v.itemName;
      _description = $v.description;
      _basePrice = $v.basePrice;
      _isActive = $v.isActive;
      _createdAt = $v.createdAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MenuItemResponse other) {
    _$v = other as _$MenuItemResponse;
  }

  @override
  void update(void Function(MenuItemResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MenuItemResponse build() => _build();

  _$MenuItemResponse _build() {
    final _$result = _$v ??
        _$MenuItemResponse._(
          itemId: itemId,
          itemName: itemName,
          description: description,
          basePrice: basePrice,
          isActive: isActive,
          createdAt: createdAt,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
