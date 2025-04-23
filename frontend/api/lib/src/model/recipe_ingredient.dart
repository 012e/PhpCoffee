//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api_client/src/model/ingredient.dart';
import 'package:api_client/src/model/recipe.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'recipe_ingredient.g.dart';

/// RecipeIngredient
///
/// Properties:
/// * [recipeId] 
/// * [ingredientId] 
/// * [quantity] 
/// * [ingredient] 
/// * [recipe] 
@BuiltValue()
abstract class RecipeIngredient implements Built<RecipeIngredient, RecipeIngredientBuilder> {
  @BuiltValueField(wireName: r'recipeId')
  int? get recipeId;

  @BuiltValueField(wireName: r'ingredientId')
  int? get ingredientId;

  @BuiltValueField(wireName: r'quantity')
  double? get quantity;

  @BuiltValueField(wireName: r'ingredient')
  Ingredient? get ingredient;

  @BuiltValueField(wireName: r'recipe')
  Recipe? get recipe;

  RecipeIngredient._();

  factory RecipeIngredient([void updates(RecipeIngredientBuilder b)]) = _$RecipeIngredient;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RecipeIngredientBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RecipeIngredient> get serializer => _$RecipeIngredientSerializer();
}

class _$RecipeIngredientSerializer implements PrimitiveSerializer<RecipeIngredient> {
  @override
  final Iterable<Type> types = const [RecipeIngredient, _$RecipeIngredient];

  @override
  final String wireName = r'RecipeIngredient';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RecipeIngredient object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.recipeId != null) {
      yield r'recipeId';
      yield serializers.serialize(
        object.recipeId,
        specifiedType: const FullType(int),
      );
    }
    if (object.ingredientId != null) {
      yield r'ingredientId';
      yield serializers.serialize(
        object.ingredientId,
        specifiedType: const FullType(int),
      );
    }
    if (object.quantity != null) {
      yield r'quantity';
      yield serializers.serialize(
        object.quantity,
        specifiedType: const FullType(double),
      );
    }
    if (object.ingredient != null) {
      yield r'ingredient';
      yield serializers.serialize(
        object.ingredient,
        specifiedType: const FullType(Ingredient),
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
    RecipeIngredient object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required RecipeIngredientBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'recipeId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.recipeId = valueDes;
          break;
        case r'ingredientId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.ingredientId = valueDes;
          break;
        case r'quantity':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.quantity = valueDes;
          break;
        case r'ingredient':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Ingredient),
          ) as Ingredient;
          result.ingredient.replace(valueDes);
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
  RecipeIngredient deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RecipeIngredientBuilder();
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

