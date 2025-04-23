//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_ingredient_request.g.dart';

/// CreateIngredientRequest
///
/// Properties:
/// * [ingredientName] 
/// * [unit] 
/// * [currentQuantity] 
/// * [name] 
/// * [quantity] 
/// * [supplierId] 
@BuiltValue()
abstract class CreateIngredientRequest implements Built<CreateIngredientRequest, CreateIngredientRequestBuilder> {
  @BuiltValueField(wireName: r'ingredientName')
  String? get ingredientName;

  @BuiltValueField(wireName: r'unit')
  String? get unit;

  @BuiltValueField(wireName: r'currentQuantity')
  double? get currentQuantity;

  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'quantity')
  double? get quantity;

  @BuiltValueField(wireName: r'supplierId')
  int? get supplierId;

  CreateIngredientRequest._();

  factory CreateIngredientRequest([void updates(CreateIngredientRequestBuilder b)]) = _$CreateIngredientRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateIngredientRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateIngredientRequest> get serializer => _$CreateIngredientRequestSerializer();
}

class _$CreateIngredientRequestSerializer implements PrimitiveSerializer<CreateIngredientRequest> {
  @override
  final Iterable<Type> types = const [CreateIngredientRequest, _$CreateIngredientRequest];

  @override
  final String wireName = r'CreateIngredientRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateIngredientRequest object, {
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
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.quantity != null) {
      yield r'quantity';
      yield serializers.serialize(
        object.quantity,
        specifiedType: const FullType(double),
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
    CreateIngredientRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreateIngredientRequestBuilder result,
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
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.name = valueDes;
          break;
        case r'quantity':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.quantity = valueDes;
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
  CreateIngredientRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateIngredientRequestBuilder();
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

