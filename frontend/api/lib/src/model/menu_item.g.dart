// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_item.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MenuItem extends MenuItem {
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
  @override
  final int? recipeId;
  @override
  final BuiltList<OrderItem>? orderItems;
  @override
  final Recipe? recipe;

  factory _$MenuItem([void Function(MenuItemBuilder)? updates]) =>
      (MenuItemBuilder()..update(updates))._build();

  _$MenuItem._(
      {this.itemId,
      this.itemName,
      this.description,
      this.basePrice,
      this.isActive,
      this.createdAt,
      this.recipeId,
      this.orderItems,
      this.recipe})
      : super._();
  @override
  MenuItem rebuild(void Function(MenuItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MenuItemBuilder toBuilder() => MenuItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MenuItem &&
        itemId == other.itemId &&
        itemName == other.itemName &&
        description == other.description &&
        basePrice == other.basePrice &&
        isActive == other.isActive &&
        createdAt == other.createdAt &&
        recipeId == other.recipeId &&
        orderItems == other.orderItems &&
        recipe == other.recipe;
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
    _$hash = $jc(_$hash, recipeId.hashCode);
    _$hash = $jc(_$hash, orderItems.hashCode);
    _$hash = $jc(_$hash, recipe.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MenuItem')
          ..add('itemId', itemId)
          ..add('itemName', itemName)
          ..add('description', description)
          ..add('basePrice', basePrice)
          ..add('isActive', isActive)
          ..add('createdAt', createdAt)
          ..add('recipeId', recipeId)
          ..add('orderItems', orderItems)
          ..add('recipe', recipe))
        .toString();
  }
}

class MenuItemBuilder implements Builder<MenuItem, MenuItemBuilder> {
  _$MenuItem? _$v;

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

  int? _recipeId;
  int? get recipeId => _$this._recipeId;
  set recipeId(int? recipeId) => _$this._recipeId = recipeId;

  ListBuilder<OrderItem>? _orderItems;
  ListBuilder<OrderItem> get orderItems =>
      _$this._orderItems ??= ListBuilder<OrderItem>();
  set orderItems(ListBuilder<OrderItem>? orderItems) =>
      _$this._orderItems = orderItems;

  RecipeBuilder? _recipe;
  RecipeBuilder get recipe => _$this._recipe ??= RecipeBuilder();
  set recipe(RecipeBuilder? recipe) => _$this._recipe = recipe;

  MenuItemBuilder() {
    MenuItem._defaults(this);
  }

  MenuItemBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _itemId = $v.itemId;
      _itemName = $v.itemName;
      _description = $v.description;
      _basePrice = $v.basePrice;
      _isActive = $v.isActive;
      _createdAt = $v.createdAt;
      _recipeId = $v.recipeId;
      _orderItems = $v.orderItems?.toBuilder();
      _recipe = $v.recipe?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MenuItem other) {
    _$v = other as _$MenuItem;
  }

  @override
  void update(void Function(MenuItemBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MenuItem build() => _build();

  _$MenuItem _build() {
    _$MenuItem _$result;
    try {
      _$result = _$v ??
          _$MenuItem._(
            itemId: itemId,
            itemName: itemName,
            description: description,
            basePrice: basePrice,
            isActive: isActive,
            createdAt: createdAt,
            recipeId: recipeId,
            orderItems: _orderItems?.build(),
            recipe: _recipe?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'orderItems';
        _orderItems?.build();
        _$failedField = 'recipe';
        _recipe?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'MenuItem', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
