//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:api_client/src/model/create_recipe_ingredient_request.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_recipe_request.g.dart';

/// CreateRecipeRequest
///
/// Properties:
/// * [name] 
/// * [description] 
/// * [instructions] 
/// * [recipeIngredients] 
@BuiltValue()
abstract class CreateRecipeRequest implements Built<CreateRecipeRequest, CreateRecipeRequestBuilder> {
  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'description')
  String? get description;

  @BuiltValueField(wireName: r'instructions')
  String? get instructions;

  @BuiltValueField(wireName: r'recipeIngredients')
  BuiltList<CreateRecipeIngredientRequest>? get recipeIngredients;

  CreateRecipeRequest._();

  factory CreateRecipeRequest([void updates(CreateRecipeRequestBuilder b)]) = _$CreateRecipeRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateRecipeRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateRecipeRequest> get serializer => _$CreateRecipeRequestSerializer();
}

class _$CreateRecipeRequestSerializer implements PrimitiveSerializer<CreateRecipeRequest> {
  @override
  final Iterable<Type> types = const [CreateRecipeRequest, _$CreateRecipeRequest];

  @override
  final String wireName = r'CreateRecipeRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateRecipeRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
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
    if (object.recipeIngredients != null) {
      yield r'recipeIngredients';
      yield serializers.serialize(
        object.recipeIngredients,
        specifiedType: const FullType.nullable(BuiltList, [FullType(CreateRecipeIngredientRequest)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateRecipeRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreateRecipeRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
        case r'recipeIngredients':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(CreateRecipeIngredientRequest)]),
          ) as BuiltList<CreateRecipeIngredientRequest>?;
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
  CreateRecipeRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateRecipeRequestBuilder();
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

