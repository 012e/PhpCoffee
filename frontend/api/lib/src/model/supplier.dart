//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api_client/src/model/ingredient.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'supplier.g.dart';

/// Supplier
///
/// Properties:
/// * [supplierId] 
/// * [supplierName] 
/// * [contactPhone] 
/// * [address] 
/// * [isActive] 
/// * [createdAt] 
/// * [ingredients] 
@BuiltValue()
abstract class Supplier implements Built<Supplier, SupplierBuilder> {
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

  @BuiltValueField(wireName: r'ingredients')
  BuiltList<Ingredient>? get ingredients;

  Supplier._();

  factory Supplier([void updates(SupplierBuilder b)]) = _$Supplier;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SupplierBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Supplier> get serializer => _$SupplierSerializer();
}

class _$SupplierSerializer implements PrimitiveSerializer<Supplier> {
  @override
  final Iterable<Type> types = const [Supplier, _$Supplier];

  @override
  final String wireName = r'Supplier';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Supplier object, {
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
    if (object.ingredients != null) {
      yield r'ingredients';
      yield serializers.serialize(
        object.ingredients,
        specifiedType: const FullType.nullable(BuiltList, [FullType(Ingredient)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    Supplier object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SupplierBuilder result,
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
        case r'ingredients':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(Ingredient)]),
          ) as BuiltList<Ingredient>?;
          if (valueDes == null) continue;
          result.ingredients.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Supplier deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SupplierBuilder();
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

