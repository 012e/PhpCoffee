//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api_client/src/model/inventory_transaction_detail.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'inventory_transaction.g.dart';

/// InventoryTransaction
///
/// Properties:
/// * [transactionId] 
/// * [transactionType] 
/// * [transactionDate] 
/// * [createdBy] 
/// * [notes] 
/// * [inventoryTransactionDetails] 
@BuiltValue()
abstract class InventoryTransaction implements Built<InventoryTransaction, InventoryTransactionBuilder> {
  @BuiltValueField(wireName: r'transactionId')
  int? get transactionId;

  @BuiltValueField(wireName: r'transactionType')
  String? get transactionType;

  @BuiltValueField(wireName: r'transactionDate')
  DateTime? get transactionDate;

  @BuiltValueField(wireName: r'createdBy')
  String? get createdBy;

  @BuiltValueField(wireName: r'notes')
  String? get notes;

  @BuiltValueField(wireName: r'inventoryTransactionDetails')
  BuiltList<InventoryTransactionDetail>? get inventoryTransactionDetails;

  InventoryTransaction._();

  factory InventoryTransaction([void updates(InventoryTransactionBuilder b)]) = _$InventoryTransaction;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(InventoryTransactionBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<InventoryTransaction> get serializer => _$InventoryTransactionSerializer();
}

class _$InventoryTransactionSerializer implements PrimitiveSerializer<InventoryTransaction> {
  @override
  final Iterable<Type> types = const [InventoryTransaction, _$InventoryTransaction];

  @override
  final String wireName = r'InventoryTransaction';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    InventoryTransaction object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.transactionId != null) {
      yield r'transactionId';
      yield serializers.serialize(
        object.transactionId,
        specifiedType: const FullType(int),
      );
    }
    if (object.transactionType != null) {
      yield r'transactionType';
      yield serializers.serialize(
        object.transactionType,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.transactionDate != null) {
      yield r'transactionDate';
      yield serializers.serialize(
        object.transactionDate,
        specifiedType: const FullType.nullable(DateTime),
      );
    }
    if (object.createdBy != null) {
      yield r'createdBy';
      yield serializers.serialize(
        object.createdBy,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.notes != null) {
      yield r'notes';
      yield serializers.serialize(
        object.notes,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.inventoryTransactionDetails != null) {
      yield r'inventoryTransactionDetails';
      yield serializers.serialize(
        object.inventoryTransactionDetails,
        specifiedType: const FullType.nullable(BuiltList, [FullType(InventoryTransactionDetail)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    InventoryTransaction object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required InventoryTransactionBuilder result,
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
        case r'transactionType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.transactionType = valueDes;
          break;
        case r'transactionDate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.transactionDate = valueDes;
          break;
        case r'createdBy':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.createdBy = valueDes;
          break;
        case r'notes':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.notes = valueDes;
          break;
        case r'inventoryTransactionDetails':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(InventoryTransactionDetail)]),
          ) as BuiltList<InventoryTransactionDetail>?;
          if (valueDes == null) continue;
          result.inventoryTransactionDetails.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  InventoryTransaction deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = InventoryTransactionBuilder();
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

