//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_inventory_transaction_detail_request.g.dart';

/// CreateInventoryTransactionDetailRequest
///
/// Properties:
/// * [ingredientId] 
/// * [quantity] 
/// * [unitPrice] 
@BuiltValue()
abstract class CreateInventoryTransactionDetailRequest implements Built<CreateInventoryTransactionDetailRequest, CreateInventoryTransactionDetailRequestBuilder> {
  @BuiltValueField(wireName: r'ingredientId')
  int? get ingredientId;

  @BuiltValueField(wireName: r'quantity')
  double? get quantity;

  @BuiltValueField(wireName: r'unitPrice')
  double? get unitPrice;

  CreateInventoryTransactionDetailRequest._();

  factory CreateInventoryTransactionDetailRequest([void updates(CreateInventoryTransactionDetailRequestBuilder b)]) = _$CreateInventoryTransactionDetailRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateInventoryTransactionDetailRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateInventoryTransactionDetailRequest> get serializer => _$CreateInventoryTransactionDetailRequestSerializer();
}

class _$CreateInventoryTransactionDetailRequestSerializer implements PrimitiveSerializer<CreateInventoryTransactionDetailRequest> {
  @override
  final Iterable<Type> types = const [CreateInventoryTransactionDetailRequest, _$CreateInventoryTransactionDetailRequest];

  @override
  final String wireName = r'CreateInventoryTransactionDetailRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateInventoryTransactionDetailRequest object, {
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
        specifiedType: const FullType.nullable(double),
      );
    }
    if (object.unitPrice != null) {
      yield r'unitPrice';
      yield serializers.serialize(
        object.unitPrice,
        specifiedType: const FullType.nullable(double),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateInventoryTransactionDetailRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreateInventoryTransactionDetailRequestBuilder result,
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
            specifiedType: const FullType.nullable(double),
          ) as double?;
          if (valueDes == null) continue;
          result.quantity = valueDes;
          break;
        case r'unitPrice':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(double),
          ) as double?;
          if (valueDes == null) continue;
          result.unitPrice = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CreateInventoryTransactionDetailRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateInventoryTransactionDetailRequestBuilder();
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

