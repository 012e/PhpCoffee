//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'supplier_response.g.dart';

/// SupplierResponse
///
/// Properties:
/// * [supplierId] 
/// * [supplierName] 
/// * [contactPhone] 
/// * [address] 
/// * [isActive] 
/// * [createdAt] 
@BuiltValue()
abstract class SupplierResponse implements Built<SupplierResponse, SupplierResponseBuilder> {
  @BuiltValueField(wireName: r'supplierId')
  int? get supplierId;

  @BuiltValueField(wireName: r'supplierName')
  String? get supplierName;

  @BuiltValueField(wireName: r'contactPhone')
  String? get contactPhone;

  @BuiltValueField(wireName: r'address')
  String? get address;

  @BuiltValueField(wireName: r'isActive')
  bool? get isActive;

  @BuiltValueField(wireName: r'createdAt')
  DateTime? get createdAt;

  SupplierResponse._();

  factory SupplierResponse([void updates(SupplierResponseBuilder b)]) = _$SupplierResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SupplierResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SupplierResponse> get serializer => _$SupplierResponseSerializer();
}

class _$SupplierResponseSerializer implements PrimitiveSerializer<SupplierResponse> {
  @override
  final Iterable<Type> types = const [SupplierResponse, _$SupplierResponse];

  @override
  final String wireName = r'SupplierResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SupplierResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.supplierId != null) {
      yield r'supplierId';
      yield serializers.serialize(
        object.supplierId,
        specifiedType: const FullType(int),
      );
    }
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
    if (object.createdAt != null) {
      yield r'createdAt';
      yield serializers.serialize(
        object.createdAt,
        specifiedType: const FullType.nullable(DateTime),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    SupplierResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SupplierResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'supplierId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.supplierId = valueDes;
          break;
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
        case r'createdAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.createdAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SupplierResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SupplierResponseBuilder();
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

