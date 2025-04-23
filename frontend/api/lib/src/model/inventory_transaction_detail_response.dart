//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'inventory_transaction_detail_response.g.dart';

/// InventoryTransactionDetailResponse
///
/// Properties:
/// * [transactionId] 
/// * [ingredientId] 
/// * [quantity] 
/// * [unitPrice] 
/// * [totalCost] 
@BuiltValue()
abstract class InventoryTransactionDetailResponse implements Built<InventoryTransactionDetailResponse, InventoryTransactionDetailResponseBuilder> {
  @BuiltValueField(wireName: r'transactionId')
  int? get transactionId;

  @BuiltValueField(wireName: r'ingredientId')
  int? get ingredientId;

  @BuiltValueField(wireName: r'quantity')
  double? get quantity;

  @BuiltValueField(wireName: r'unitPrice')
  double? get unitPrice;

  @BuiltValueField(wireName: r'totalCost')
  double? get totalCost;

  InventoryTransactionDetailResponse._();

  factory InventoryTransactionDetailResponse([void updates(InventoryTransactionDetailResponseBuilder b)]) = _$InventoryTransactionDetailResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(InventoryTransactionDetailResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<InventoryTransactionDetailResponse> get serializer => _$InventoryTransactionDetailResponseSerializer();
}

class _$InventoryTransactionDetailResponseSerializer implements PrimitiveSerializer<InventoryTransactionDetailResponse> {
  @override
  final Iterable<Type> types = const [InventoryTransactionDetailResponse, _$InventoryTransactionDetailResponse];

  @override
  final String wireName = r'InventoryTransactionDetailResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    InventoryTransactionDetailResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.transactionId != null) {
      yield r'transactionId';
      yield serializers.serialize(
        object.transactionId,
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
    if (object.totalCost != null) {
      yield r'totalCost';
      yield serializers.serialize(
        object.totalCost,
        specifiedType: const FullType.nullable(double),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    InventoryTransactionDetailResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required InventoryTransactionDetailResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'transactionId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.transactionId = valueDes;
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
        case r'totalCost':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(double),
          ) as double?;
          if (valueDes == null) continue;
          result.totalCost = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  InventoryTransactionDetailResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = InventoryTransactionDetailResponseBuilder();
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

