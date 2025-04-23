//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'sepay_response.g.dart';

/// SepayResponse
///
/// Properties:
/// * [id] 
/// * [gateway] 
/// * [transactionDate] 
/// * [accountNumber] 
/// * [code] 
/// * [content] 
/// * [transferType] 
/// * [transferAmount] 
/// * [accumulated] 
/// * [subAccount] 
/// * [referenceCode] 
/// * [description] 
@BuiltValue()
abstract class SepayResponse implements Built<SepayResponse, SepayResponseBuilder> {
  @BuiltValueField(wireName: r'id')
  int? get id;

  @BuiltValueField(wireName: r'gateway')
  String? get gateway;

  @BuiltValueField(wireName: r'transactionDate')
  DateTime? get transactionDate;

  @BuiltValueField(wireName: r'accountNumber')
  String? get accountNumber;

  @BuiltValueField(wireName: r'code')
  String? get code;

  @BuiltValueField(wireName: r'content')
  String? get content;

  @BuiltValueField(wireName: r'transferType')
  String? get transferType;

  @BuiltValueField(wireName: r'transferAmount')
  double? get transferAmount;

  @BuiltValueField(wireName: r'accumulated')
  double? get accumulated;

  @BuiltValueField(wireName: r'subAccount')
  String? get subAccount;

  @BuiltValueField(wireName: r'referenceCode')
  String? get referenceCode;

  @BuiltValueField(wireName: r'description')
  String? get description;

  SepayResponse._();

  factory SepayResponse([void updates(SepayResponseBuilder b)]) = _$SepayResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SepayResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SepayResponse> get serializer => _$SepayResponseSerializer();
}

class _$SepayResponseSerializer implements PrimitiveSerializer<SepayResponse> {
  @override
  final Iterable<Type> types = const [SepayResponse, _$SepayResponse];

  @override
  final String wireName = r'SepayResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SepayResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(int),
      );
    }
    if (object.gateway != null) {
      yield r'gateway';
      yield serializers.serialize(
        object.gateway,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.transactionDate != null) {
      yield r'transactionDate';
      yield serializers.serialize(
        object.transactionDate,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.accountNumber != null) {
      yield r'accountNumber';
      yield serializers.serialize(
        object.accountNumber,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.code != null) {
      yield r'code';
      yield serializers.serialize(
        object.code,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.content != null) {
      yield r'content';
      yield serializers.serialize(
        object.content,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.transferType != null) {
      yield r'transferType';
      yield serializers.serialize(
        object.transferType,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.transferAmount != null) {
      yield r'transferAmount';
      yield serializers.serialize(
        object.transferAmount,
        specifiedType: const FullType(double),
      );
    }
    if (object.accumulated != null) {
      yield r'accumulated';
      yield serializers.serialize(
        object.accumulated,
        specifiedType: const FullType(double),
      );
    }
    if (object.subAccount != null) {
      yield r'subAccount';
      yield serializers.serialize(
        object.subAccount,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.referenceCode != null) {
      yield r'referenceCode';
      yield serializers.serialize(
        object.referenceCode,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.description != null) {
      yield r'description';
      yield serializers.serialize(
        object.description,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    SepayResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SepayResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.id = valueDes;
          break;
        case r'gateway':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.gateway = valueDes;
          break;
        case r'transactionDate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.transactionDate = valueDes;
          break;
        case r'accountNumber':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.accountNumber = valueDes;
          break;
        case r'code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.code = valueDes;
          break;
        case r'content':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.content = valueDes;
          break;
        case r'transferType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.transferType = valueDes;
          break;
        case r'transferAmount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.transferAmount = valueDes;
          break;
        case r'accumulated':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.accumulated = valueDes;
          break;
        case r'subAccount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.subAccount = valueDes;
          break;
        case r'referenceCode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.referenceCode = valueDes;
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.description = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SepayResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SepayResponseBuilder();
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

