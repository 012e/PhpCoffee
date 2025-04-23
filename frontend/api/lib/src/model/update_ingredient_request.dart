//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_ingredient_request.g.dart';

/// UpdateIngredientRequest
///
/// Properties:
/// * [ingredientName] 
/// * [unit] 
/// * [currentQuantity] 
/// * [ingredientDescription] 
/// * [supplierId] 
@BuiltValue()
abstract class UpdateIngredientRequest implements Built<UpdateIngredientRequest, UpdateIngredientRequestBuilder> {
  @BuiltValueField(wireName: r'ingredientName')
  String? get ingredientName;

  @BuiltValueField(wireName: r'unit')
  String? get unit;

  @BuiltValueField(wireName: r'currentQuantity')
  double? get currentQuantity;

  @BuiltValueField(wireName: r'ingredientDescription')
  String? get ingredientDescription;

  @BuiltValueField(wireName: r'supplierId')
  int? get supplierId;

  UpdateIngredientRequest._();

  factory UpdateIngredientRequest([void updates(UpdateIngredientRequestBuilder b)]) = _$UpdateIngredientRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateIngredientRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateIngredientRequest> get serializer => _$UpdateIngredientRequestSerializer();
}

class _$UpdateIngredientRequestSerializer implements PrimitiveSerializer<UpdateIngredientRequest> {
  @override
  final Iterable<Type> types = const [UpdateIngredientRequest, _$UpdateIngredientRequest];

  @override
  final String wireName = r'UpdateIngredientRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateIngredientRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.ingredientName != null) {
      yield r'ingredientName';
      yield serializers.serialize(
        object.ingredientName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.unit != null) {
      yield r'unit';
      yield serializers.serialize(
        object.unit,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.currentQuantity != null) {
      yield r'currentQuantity';
      yield serializers.serialize(
        object.currentQuantity,
        specifiedType: const FullType.nullable(double),
      );
    }
    if (object.ingredientDescription != null) {
      yield r'ingredientDescription';
      yield serializers.serialize(
        object.ingredientDescription,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.supplierId != null) {
      yield r'supplierId';
      yield serializers.serialize(
        object.supplierId,
        specifiedType: const FullType.nullable(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UpdateIngredientRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UpdateIngredientRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'ingredientName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.ingredientName = valueDes;
          break;
        case r'unit':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.unit = valueDes;
          break;
        case r'currentQuantity':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(double),
          ) as double?;
          if (valueDes == null) continue;
          result.currentQuantity = valueDes;
          break;
        case r'ingredientDescription':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.ingredientDescription = valueDes;
          break;
        case r'supplierId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.supplierId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UpdateIngredientRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateIngredientRequestBuilder();
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

