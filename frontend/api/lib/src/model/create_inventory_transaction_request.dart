//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api_client/src/model/create_inventory_transaction_detail_request.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_inventory_transaction_request.g.dart';

/// CreateInventoryTransactionRequest
///
/// Properties:
/// * [transactionType] 
/// * [createdBy] 
/// * [notes] 
/// * [inventoryTransactionDetails] 
@BuiltValue()
abstract class CreateInventoryTransactionRequest implements Built<CreateInventoryTransactionRequest, CreateInventoryTransactionRequestBuilder> {
  @BuiltValueField(wireName: r'transactionType')
  String? get transactionType;

  @BuiltValueField(wireName: r'createdBy')
  String? get createdBy;

  @BuiltValueField(wireName: r'notes')
  String? get notes;

  @BuiltValueField(wireName: r'inventoryTransactionDetails')
  BuiltList<CreateInventoryTransactionDetailRequest>? get inventoryTransactionDetails;

  CreateInventoryTransactionRequest._();

  factory CreateInventoryTransactionRequest([void updates(CreateInventoryTransactionRequestBuilder b)]) = _$CreateInventoryTransactionRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateInventoryTransactionRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateInventoryTransactionRequest> get serializer => _$CreateInventoryTransactionRequestSerializer();
}

class _$CreateInventoryTransactionRequestSerializer implements PrimitiveSerializer<CreateInventoryTransactionRequest> {
  @override
  final Iterable<Type> types = const [CreateInventoryTransactionRequest, _$CreateInventoryTransactionRequest];

  @override
  final String wireName = r'CreateInventoryTransactionRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateInventoryTransactionRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.transactionType != null) {
      yield r'transactionType';
      yield serializers.serialize(
        object.transactionType,
        specifiedType: const FullType.nullable(String),
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
        specifiedType: const FullType.nullable(BuiltList, [FullType(CreateInventoryTransactionDetailRequest)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateInventoryTransactionRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreateInventoryTransactionRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'transactionType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.transactionType = valueDes;
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
            specifiedType: const FullType.nullable(BuiltList, [FullType(CreateInventoryTransactionDetailRequest)]),
          ) as BuiltList<CreateInventoryTransactionDetailRequest>?;
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
  CreateInventoryTransactionRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateInventoryTransactionRequestBuilder();
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

