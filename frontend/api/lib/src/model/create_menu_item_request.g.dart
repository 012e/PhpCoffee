// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_menu_item_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateMenuItemRequest extends CreateMenuItemRequest {
  @override
  final String? itemName;
  @override
  final String? description;
  @override
  final double? basePrice;
  @override
  final bool? isActive;
  @override
  final CreateRecipeRequest? recipe;

  factory _$CreateMenuItemRequest(
          [void Function(CreateMenuItemRequestBuilder)? updates]) =>
      (new CreateMenuItemRequestBuilder()..update(updates))._build();

  _$CreateMenuItemRequest._(
      {this.itemName,
      this.description,
      this.basePrice,
      this.isActive,
      this.recipe})
      : super._();

  @override
  CreateMenuItemRequest rebuild(
          void Function(CreateMenuItemRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateMenuItemRequestBuilder toBuilder() =>
      new CreateMenuItemRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateMenuItemRequest &&
        itemName == other.itemName &&
        description == other.description &&
        basePrice == other.basePrice &&
        isActive == other.isActive &&
        recipe == other.recipe;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, itemName.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, basePrice.hashCode);
    _$hash = $jc(_$hash, isActive.hashCode);
    _$hash = $jc(_$hash, recipe.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateMenuItemRequest')
          ..add('itemName', itemName)
          ..add('description', description)
          ..add('basePrice', basePrice)
          ..add('isActive', isActive)
          ..add('recipe', recipe))
        .toString();
  }
}

class CreateMenuItemRequestBuilder
    implements Builder<CreateMenuItemRequest, CreateMenuItemRequestBuilder> {
  _$CreateMenuItemRequest? _$v;

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

  CreateRecipeRequestBuilder? _recipe;
  CreateRecipeRequestBuilder get recipe =>
      _$this._recipe ??= new CreateRecipeRequestBuilder();
  set recipe(CreateRecipeRequestBuilder? recipe) => _$this._recipe = recipe;

  CreateMenuItemRequestBuilder() {
    CreateMenuItemRequest._defaults(this);
  }

  CreateMenuItemRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _itemName = $v.itemName;
      _description = $v.description;
      _basePrice = $v.basePrice;
      _isActive = $v.isActive;
      _recipe = $v.recipe?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateMenuItemRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateMenuItemRequest;
  }

  @override
  void update(void Function(CreateMenuItemRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateMenuItemRequest build() => _build();

  _$CreateMenuItemRequest _build() {
    _$CreateMenuItemRequest _$result;
    try {
      _$result = _$v ??
          new _$CreateMenuItemRequest._(
            itemName: itemName,
            description: description,
            basePrice: basePrice,
            isActive: isActive,
            recipe: _recipe?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'recipe';
        _recipe?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CreateMenuItemRequest', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
