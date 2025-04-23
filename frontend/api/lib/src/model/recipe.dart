//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api_client/src/model/menu_item.dart';
import 'package:built_collection/built_collection.dart';
import 'package:api_client/src/model/recipe_ingredient.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'recipe.g.dart';

/// Recipe
///
/// Properties:
/// * [id] 
/// * [name] 
/// * [description] 
/// * [instructions] 
/// * [createdAt] 
/// * [menuItems] 
/// * [recipeIngredients] 
@BuiltValue()
abstract class Recipe implements Built<Recipe, RecipeBuilder> {
  @BuiltValueField(wireName: r'id')
  int? get id;

  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'description')
  String? get description;

  @BuiltValueField(wireName: r'instructions')
  String? get instructions;

  @BuiltValueField(wireName: r'createdAt')
  DateTime? get createdAt;

  @BuiltValueField(wireName: r'menuItems')
  BuiltList<MenuItem>? get menuItems;

  @BuiltValueField(wireName: r'recipeIngredients')
  BuiltList<RecipeIngredient>? get recipeIngredients;

  Recipe._();

  factory Recipe([void updates(RecipeBuilder b)]) = _$Recipe;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RecipeBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Recipe> get serializer => _$RecipeSerializer();
}

class _$RecipeSerializer implements PrimitiveSerializer<Recipe> {
  @override
  final Iterable<Type> types = const [Recipe, _$Recipe];

  @override
  final String wireName = r'Recipe';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Recipe object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(int),
      );
    }
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
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
    if (object.instructions != null) {
      yield r'instructions';
      yield serializers.serialize(
        object.instructions,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.createdAt != null) {
      yield r'createdAt';
      yield serializers.serialize(
        object.createdAt,
        specifiedType: const FullType.nullable(DateTime),
      );
    }
    if (object.menuItems != null) {
      yield r'menuItems';
      yield serializers.serialize(
        object.menuItems,
        specifiedType: const FullType.nullable(BuiltList, [FullType(MenuItem)]),
      );
    }
    if (object.recipeIngredients != null) {
      yield r'recipeIngredients';
      yield serializers.serialize(
        object.recipeIngredients,
        specifiedType: const FullType.nullable(BuiltList, [FullType(RecipeIngredient)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    Recipe object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required RecipeBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.id = valueDes;
          break;
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.name = valueDes;
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.description = valueDes;
          break;
        case r'instructions':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.instructions = valueDes;
          break;
        case r'createdAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.createdAt = valueDes;
          break;
        case r'menuItems':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(MenuItem)]),
          ) as BuiltList<MenuItem>?;
          if (valueDes == null) continue;
          result.menuItems.replace(valueDes);
          break;
        case r'recipeIngredients':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(RecipeIngredient)]),
          ) as BuiltList<RecipeIngredient>?;
          if (valueDes == null) continue;
          result.recipeIngredients.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Recipe deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RecipeBuilder();
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

