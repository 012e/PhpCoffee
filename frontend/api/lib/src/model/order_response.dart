//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api_client/src/model/payment_response.dart';
import 'package:built_collection/built_collection.dart';
import 'package:api_client/src/model/order_item_response.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'order_response.g.dart';

/// OrderResponse
///
/// Properties:
/// * [orderId] 
/// * [orderDate] 
/// * [totalAmount] 
/// * [paymentStatus] 
/// * [remaining] 
/// * [orderItems] 
/// * [payments] 
@BuiltValue()
abstract class OrderResponse implements Built<OrderResponse, OrderResponseBuilder> {
  @BuiltValueField(wireName: r'orderId')
  int? get orderId;

  @BuiltValueField(wireName: r'orderDate')
  DateTime? get orderDate;

  @BuiltValueField(wireName: r'totalAmount')
  double? get totalAmount;

  @BuiltValueField(wireName: r'paymentStatus')
  String? get paymentStatus;

  @BuiltValueField(wireName: r'remaining')
  double? get remaining;

  @BuiltValueField(wireName: r'orderItems')
  BuiltList<OrderItemResponse>? get orderItems;

  @BuiltValueField(wireName: r'payments')
  BuiltList<PaymentResponse>? get payments;

  OrderResponse._();

  factory OrderResponse([void updates(OrderResponseBuilder b)]) = _$OrderResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(OrderResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<OrderResponse> get serializer => _$OrderResponseSerializer();
}

class _$OrderResponseSerializer implements PrimitiveSerializer<OrderResponse> {
  @override
  final Iterable<Type> types = const [OrderResponse, _$OrderResponse];

  @override
  final String wireName = r'OrderResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    OrderResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.orderId != null) {
      yield r'orderId';
      yield serializers.serialize(
        object.orderId,
        specifiedType: const FullType(int),
      );
    }
    if (object.orderDate != null) {
      yield r'orderDate';
      yield serializers.serialize(
        object.orderDate,
        specifiedType: const FullType.nullable(DateTime),
      );
    }
    if (object.totalAmount != null) {
      yield r'totalAmount';
      yield serializers.serialize(
        object.totalAmount,
        specifiedType: const FullType(double),
      );
    }
    if (object.paymentStatus != null) {
      yield r'paymentStatus';
      yield serializers.serialize(
        object.paymentStatus,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.remaining != null) {
      yield r'remaining';
      yield serializers.serialize(
        object.remaining,
        specifiedType: const FullType(double),
      );
    }
    if (object.orderItems != null) {
      yield r'orderItems';
      yield serializers.serialize(
        object.orderItems,
        specifiedType: const FullType.nullable(BuiltList, [FullType(OrderItemResponse)]),
      );
    }
    if (object.payments != null) {
      yield r'payments';
      yield serializers.serialize(
        object.payments,
        specifiedType: const FullType.nullable(BuiltList, [FullType(PaymentResponse)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    OrderResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required OrderResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'orderId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.orderId = valueDes;
          break;
        case r'orderDate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.orderDate = valueDes;
          break;
        case r'totalAmount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.totalAmount = valueDes;
          break;
        case r'paymentStatus':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.paymentStatus = valueDes;
          break;
        case r'remaining':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.remaining = valueDes;
          break;
        case r'orderItems':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(OrderItemResponse)]),
          ) as BuiltList<OrderItemResponse>?;
          if (valueDes == null) continue;
          result.orderItems.replace(valueDes);
          break;
        case r'payments':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(PaymentResponse)]),
          ) as BuiltList<PaymentResponse>?;
          if (valueDes == null) continue;
          result.payments.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  OrderResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = OrderResponseBuilder();
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

