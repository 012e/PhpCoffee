//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api_client/src/model/supplier_response.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ingredient_response.g.dart';

/// IngredientResponse
///
/// Properties:
/// * [ingredientId] 
/// * [ingredientName] 
/// * [unit] 
/// * [currentQuantity] 
/// * [imageUrl] 
/// * [createdAt] 
/// * [supplier] 
@BuiltValue()
abstract class IngredientResponse implements Built<IngredientResponse, IngredientResponseBuilder> {
  @BuiltValueField(wireName: r'ingredientId')
  int? get ingredientId;

  @BuiltValueField(wireName: r'ingredientName')
  String? get ingredientName;

  @BuiltValueField(wireName: r'unit')
  String? get unit;

  @BuiltValueField(wireName: r'currentQuantity')
  double? get currentQuantity;

  @BuiltValueField(wireName: r'imageUrl')
  String? get imageUrl;

  @BuiltValueField(wireName: r'createdAt')
  DateTime? get createdAt;

  @BuiltValueField(wireName: r'supplier')
  SupplierResponse? get supplier;

  IngredientResponse._();

  factory IngredientResponse([void updates(IngredientResponseBuilder b)]) = _$IngredientResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(IngredientResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<IngredientResponse> get serializer => _$IngredientResponseSerializer();
}

class _$IngredientResponseSerializer implements PrimitiveSerializer<IngredientResponse> {
  @override
  final Iterable<Type> types = const [IngredientResponse, _$IngredientResponse];

  @override
  final String wireName = r'IngredientResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    IngredientResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.ingredientId != null) {
      yield r'ingredientId';
      yield serializers.serialize(
        object.ingredientId,
        specifiedType: const FullType(int),
      );
    }
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
    if (object.imageUrl != null) {
      yield r'imageUrl';
      yield serializers.serialize(
        object.imageUrl,
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
    if (object.supplier != null) {
      yield r'supplier';
      yield serializers.serialize(
        object.supplier,
        specifiedType: const FullType(SupplierResponse),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    IngredientResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required IngredientResponseBuilder result,
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
        case r'imageUrl':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.imageUrl = valueDes;
          break;
        case r'createdAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.createdAt = valueDes;
          break;
        case r'supplier':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(SupplierResponse),
          ) as SupplierResponse;
          result.supplier.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  IngredientResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = IngredientResponseBuilder();
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

