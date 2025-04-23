//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_supplier_request.g.dart';

/// CreateSupplierRequest
///
/// Properties:
/// * [supplierName] 
/// * [contactPhone] 
/// * [address] 
/// * [isActive] 
@BuiltValue()
abstract class CreateSupplierRequest implements Built<CreateSupplierRequest, CreateSupplierRequestBuilder> {
  @BuiltValueField(wireName: r'supplierName')
  String? get supplierName;

  @BuiltValueField(wireName: r'contactPhone')
  String? get contactPhone;

  @BuiltValueField(wireName: r'address')
  String? get address;

  @BuiltValueField(wireName: r'isActive')
  bool? get isActive;

  CreateSupplierRequest._();

  factory CreateSupplierRequest([void updates(CreateSupplierRequestBuilder b)]) = _$CreateSupplierRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateSupplierRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateSupplierRequest> get serializer => _$CreateSupplierRequestSerializer();
}

class _$CreateSupplierRequestSerializer implements PrimitiveSerializer<CreateSupplierRequest> {
  @override
  final Iterable<Type> types = const [CreateSupplierRequest, _$CreateSupplierRequest];

  @override
  final String wireName = r'CreateSupplierRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateSupplierRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.supplierName != null) {
      yield r'supplierName';
      yield serializers.serialize(
        object.supplierName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.contactPhone != null) {
      yield r'contactPhone';
      yield serializers.serialize(
        object.contactPhone,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.address != null) {
      yield r'address';
      yield serializers.serialize(
        object.address,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.isActive != null) {
      yield r'isActive';
      yield serializers.serialize(
        object.isActive,
        specifiedType: const FullType.nullable(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateSupplierRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreateSupplierRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'supplierName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.supplierName = valueDes;
          break;
        case r'contactPhone':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.contactPhone = valueDes;
          break;
        case r'address':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.address = valueDes;
          break;
        case r'isActive':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.isActive = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CreateSupplierRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateSupplierRequestBuilder();
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

