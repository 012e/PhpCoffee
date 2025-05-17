//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'payment_status_response.g.dart';

/// PaymentStatusResponse
///
/// Properties:
/// * [paymentStatus] 
/// * [orderId] 
/// * [isPaid] 
/// * [message] 
@BuiltValue()
abstract class PaymentStatusResponse implements Built<PaymentStatusResponse, PaymentStatusResponseBuilder> {
  @BuiltValueField(wireName: r'paymentStatus')
  String? get paymentStatus;

  @BuiltValueField(wireName: r'orderId')
  int? get orderId;

  @BuiltValueField(wireName: r'isPaid')
  bool? get isPaid;

  @BuiltValueField(wireName: r'message')
  String? get message;

  PaymentStatusResponse._();

  factory PaymentStatusResponse([void updates(PaymentStatusResponseBuilder b)]) = _$PaymentStatusResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PaymentStatusResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PaymentStatusResponse> get serializer => _$PaymentStatusResponseSerializer();
}

class _$PaymentStatusResponseSerializer implements PrimitiveSerializer<PaymentStatusResponse> {
  @override
  final Iterable<Type> types = const [PaymentStatusResponse, _$PaymentStatusResponse];

  @override
  final String wireName = r'PaymentStatusResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PaymentStatusResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.paymentStatus != null) {
      yield r'paymentStatus';
      yield serializers.serialize(
        object.paymentStatus,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.orderId != null) {
      yield r'orderId';
      yield serializers.serialize(
        object.orderId,
        specifiedType: const FullType(int),
      );
    }
    if (object.isPaid != null) {
      yield r'isPaid';
      yield serializers.serialize(
        object.isPaid,
        specifiedType: const FullType(bool),
      );
    }
    if (object.message != null) {
      yield r'message';
      yield serializers.serialize(
        object.message,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    PaymentStatusResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PaymentStatusResponseBuilder result,
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
        case r'orderId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.orderId = valueDes;
          break;
        case r'isPaid':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isPaid = valueDes;
          break;
        case r'message':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.message = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PaymentStatusResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PaymentStatusResponseBuilder();
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

