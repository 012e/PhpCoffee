//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:api_client/src/model/recipe.dart';
import 'package:api_client/src/model/order_item.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'menu_item.g.dart';

/// MenuItem
///
/// Properties:
/// * [itemId] 
/// * [itemName] 
/// * [description] 
/// * [basePrice] 
/// * [isActive] 
/// * [createdAt] 
/// * [recipeId] 
/// * [orderItems] 
/// * [recipe] 
@BuiltValue()
abstract class MenuItem implements Built<MenuItem, MenuItemBuilder> {
  @BuiltValueField(wireName: r'itemId')
  int? get itemId;

  @BuiltValueField(wireName: r'itemName')
  String? get itemName;

  @BuiltValueField(wireName: r'description')
  String? get description;

  @BuiltValueField(wireName: r'basePrice')
  double? get basePrice;

  @BuiltValueField(wireName: r'isActive')
  bool? get isActive;

  @BuiltValueField(wireName: r'createdAt')
  DateTime? get createdAt;

  @BuiltValueField(wireName: r'recipeId')
  int? get recipeId;

  @BuiltValueField(wireName: r'orderItems')
  BuiltList<OrderItem>? get orderItems;

  @BuiltValueField(wireName: r'recipe')
  Recipe? get recipe;

  MenuItem._();

  factory MenuItem([void updates(MenuItemBuilder b)]) = _$MenuItem;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MenuItemBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MenuItem> get serializer => _$MenuItemSerializer();
}

class _$MenuItemSerializer implements PrimitiveSerializer<MenuItem> {
  @override
  final Iterable<Type> types = const [MenuItem, _$MenuItem];

  @override
  final String wireName = r'MenuItem';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MenuItem object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.itemId != null) {
      yield r'itemId';
      yield serializers.serialize(
        object.itemId,
        specifiedType: const FullType(int),
      );
    }
    if (object.itemName != null) {
      yield r'itemName';
      yield serializers.serialize(
        object.itemName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.description != null) {
      yield r'description';
      yield serializers.serialize(
        object.description,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.basePrice != null) {
      yield r'basePrice';
      yield serializers.serialize(
        object.basePrice,
        specifiedType: const FullType(double),
      );
    }
    if (object.isActive != null) {
      yield r'isActive';
      yield serializers.serialize(
        object.isActive,
        specifiedType: const FullType.nullable(bool),
      );
    }
    if (object.createdAt != null) {
      yield r'createdAt';
      yield serializers.serialize(
        object.createdAt,
        specifiedType: const FullType.nullable(DateTime),
      );
    }
    if (object.recipeId != null) {
      yield r'recipeId';
      yield serializers.serialize(
        object.recipeId,
        specifiedType: const FullType(int),
      );
    }
    if (object.orderItems != null) {
      yield r'orderItems';
      yield serializers.serialize(
        object.orderItems,
        specifiedType: const FullType.nullable(BuiltList, [FullType(OrderItem)]),
      );
    }
    if (object.recipe != null) {
      yield r'recipe';
      yield serializers.serialize(
        object.recipe,
        specifiedType: const FullType(Recipe),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    MenuItem object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required MenuItemBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'itemId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.itemId = valueDes;
          break;
        case r'itemName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.itemName = valueDes;
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.description = valueDes;
          break;
        case r'basePrice':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.basePrice = valueDes;
          break;
        case r'isActive':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.isActive = valueDes;
          break;
        case r'createdAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.createdAt = valueDes;
          break;
        case r'recipeId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.recipeId = valueDes;
          break;
        case r'orderItems':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(OrderItem)]),
          ) as BuiltList<OrderItem>?;
          if (valueDes == null) continue;
          result.orderItems.replace(valueDes);
          break;
        case r'recipe':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Recipe),
          ) as Recipe;
          result.recipe.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  MenuItem deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MenuItemBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}

