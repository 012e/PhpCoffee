//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'payment_response.g.dart';

/// PaymentResponse
///
/// Properties:
/// * [paymentId] 
/// * [amount] 
/// * [paymentMethod] 
/// * [paymentDate] 
@BuiltValue()
abstract class PaymentResponse implements Built<PaymentResponse, PaymentResponseBuilder> {
  @BuiltValueField(wireName: r'paymentId')
  int? get paymentId;

  @BuiltValueField(wireName: r'amount')
  double? get amount;

  @BuiltValueField(wireName: r'paymentMethod')
  String? get paymentMethod;

  @BuiltValueField(wireName: r'paymentDate')
  DateTime? get paymentDate;

  PaymentResponse._();

  factory PaymentResponse([void updates(PaymentResponseBuilder b)]) = _$PaymentResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PaymentResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PaymentResponse> get serializer => _$PaymentResponseSerializer();
}

class _$PaymentResponseSerializer implements PrimitiveSerializer<PaymentResponse> {
  @override
  final Iterable<Type> types = const [PaymentResponse, _$PaymentResponse];

  @override
  final String wireName = r'PaymentResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PaymentResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.paymentId != null) {
      yield r'paymentId';
      yield serializers.serialize(
        object.paymentId,
        specifiedType: const FullType(int),
      );
    }
    if (object.amount != null) {
      yield r'amount';
      yield serializers.serialize(
        object.amount,
        specifiedType: const FullType(double),
      );
    }
    if (object.paymentMethod != null) {
      yield r'paymentMethod';
      yield serializers.serialize(
        object.paymentMethod,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.paymentDate != null) {
      yield r'paymentDate';
      yield serializers.serialize(
        object.paymentDate,
        specifiedType: const FullType.nullable(DateTime),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    PaymentResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PaymentResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'paymentId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.paymentId = valueDes;
          break;
        case r'amount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.amount = valueDes;
          break;
        case r'paymentMethod':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.paymentMethod = valueDes;
          break;
        case r'paymentDate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.paymentDate = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PaymentResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PaymentResponseBuilder();
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

