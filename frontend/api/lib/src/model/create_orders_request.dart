//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api_client/src/model/create_order_item_request.dart';
import 'package:built_collection/built_collection.dart';
import 'package:api_client/src/model/create_payment_request.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_orders_request.g.dart';

/// CreateOrdersRequest
///
/// Properties:
/// * [paymentStatus] 
/// * [createOrderItemRequests] 
/// * [createPaymentRequest] 
@BuiltValue()
abstract class CreateOrdersRequest implements Built<CreateOrdersRequest, CreateOrdersRequestBuilder> {
  @BuiltValueField(wireName: r'paymentStatus')
  String? get paymentStatus;

  @BuiltValueField(wireName: r'createOrderItemRequests')
  BuiltList<CreateOrderItemRequest>? get createOrderItemRequests;

  @BuiltValueField(wireName: r'createPaymentRequest')
  CreatePaymentRequest? get createPaymentRequest;

  CreateOrdersRequest._();

  factory CreateOrdersRequest([void updates(CreateOrdersRequestBuilder b)]) = _$CreateOrdersRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateOrdersRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateOrdersRequest> get serializer => _$CreateOrdersRequestSerializer();
}

class _$CreateOrdersRequestSerializer implements PrimitiveSerializer<CreateOrdersRequest> {
  @override
  final Iterable<Type> types = const [CreateOrdersRequest, _$CreateOrdersRequest];

  @override
  final String wireName = r'CreateOrdersRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateOrdersRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.paymentStatus != null) {
      yield r'paymentStatus';
      yield serializers.serialize(
        object.paymentStatus,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.createOrderItemRequests != null) {
      yield r'createOrderItemRequests';
      yield serializers.serialize(
        object.createOrderItemRequests,
        specifiedType: const FullType.nullable(BuiltList, [FullType(CreateOrderItemRequest)]),
      );
    }
    if (object.createPaymentRequest != null) {
      yield r'createPaymentRequest';
      yield serializers.serialize(
        object.createPaymentRequest,
        specifiedType: const FullType(CreatePaymentRequest),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateOrdersRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreateOrdersRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'paymentStatus':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.paymentStatus = valueDes;
          break;
        case r'createOrderItemRequests':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(CreateOrderItemRequest)]),
          ) as BuiltList<CreateOrderItemRequest>?;
          if (valueDes == null) continue;
          result.createOrderItemRequests.replace(valueDes);
          break;
        case r'createPaymentRequest':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(CreatePaymentRequest),
          ) as CreatePaymentRequest;
          result.createPaymentRequest.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CreateOrdersRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateOrdersRequestBuilder();
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

