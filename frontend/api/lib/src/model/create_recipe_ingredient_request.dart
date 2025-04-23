//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_recipe_ingredient_request.g.dart';

/// CreateRecipeIngredientRequest
///
/// Properties:
/// * [ingredientId] 
/// * [quantity] 
@BuiltValue()
abstract class CreateRecipeIngredientRequest implements Built<CreateRecipeIngredientRequest, CreateRecipeIngredientRequestBuilder> {
  @BuiltValueField(wireName: r'ingredientId')
  int? get ingredientId;

  @BuiltValueField(wireName: r'quantity')
  double? get quantity;

  CreateRecipeIngredientRequest._();

  factory CreateRecipeIngredientRequest([void updates(CreateRecipeIngredientRequestBuilder b)]) = _$CreateRecipeIngredientRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateRecipeIngredientRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateRecipeIngredientRequest> get serializer => _$CreateRecipeIngredientRequestSerializer();
}

class _$CreateRecipeIngredientRequestSerializer implements PrimitiveSerializer<CreateRecipeIngredientRequest> {
  @override
  final Iterable<Type> types = const [CreateRecipeIngredientRequest, _$CreateRecipeIngredientRequest];

  @override
  final String wireName = r'CreateRecipeIngredientRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateRecipeIngredientRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
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
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateRecipeIngredientRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreateRecipeIngredientRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CreateRecipeIngredientRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateRecipeIngredientRequestBuilder();
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

