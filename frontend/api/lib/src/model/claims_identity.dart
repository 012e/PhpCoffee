//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:api_client/src/model/claim.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'claims_identity.g.dart';

/// ClaimsIdentity
///
/// Properties:
/// * [authenticationType] 
/// * [isAuthenticated] 
/// * [actor] 
/// * [bootstrapContext] 
/// * [claims] 
/// * [label] 
/// * [name] 
/// * [nameClaimType] 
/// * [roleClaimType] 
@BuiltValue()
abstract class ClaimsIdentity implements Built<ClaimsIdentity, ClaimsIdentityBuilder> {
  @BuiltValueField(wireName: r'authenticationType')
  String? get authenticationType;

  @BuiltValueField(wireName: r'isAuthenticated')
  bool? get isAuthenticated;

  @BuiltValueField(wireName: r'actor')
  ClaimsIdentity? get actor;

  @BuiltValueField(wireName: r'bootstrapContext')
  JsonObject? get bootstrapContext;

  @BuiltValueField(wireName: r'claims')
  BuiltList<Claim>? get claims;

  @BuiltValueField(wireName: r'label')
  String? get label;

  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'nameClaimType')
  String? get nameClaimType;

  @BuiltValueField(wireName: r'roleClaimType')
  String? get roleClaimType;

  ClaimsIdentity._();

  factory ClaimsIdentity([void updates(ClaimsIdentityBuilder b)]) = _$ClaimsIdentity;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ClaimsIdentityBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ClaimsIdentity> get serializer => _$ClaimsIdentitySerializer();
}

class _$ClaimsIdentitySerializer implements PrimitiveSerializer<ClaimsIdentity> {
  @override
  final Iterable<Type> types = const [ClaimsIdentity, _$ClaimsIdentity];

  @override
  final String wireName = r'ClaimsIdentity';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ClaimsIdentity object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.authenticationType != null) {
      yield r'authenticationType';
      yield serializers.serialize(
        object.authenticationType,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.isAuthenticated != null) {
      yield r'isAuthenticated';
      yield serializers.serialize(
        object.isAuthenticated,
        specifiedType: const FullType(bool),
      );
    }
    if (object.actor != null) {
      yield r'actor';
      yield serializers.serialize(
        object.actor,
        specifiedType: const FullType(ClaimsIdentity),
      );
    }
    if (object.bootstrapContext != null) {
      yield r'bootstrapContext';
      yield serializers.serialize(
        object.bootstrapContext,
        specifiedType: const FullType.nullable(JsonObject),
      );
    }
    if (object.claims != null) {
      yield r'claims';
      yield serializers.serialize(
        object.claims,
        specifiedType: const FullType.nullable(BuiltList, [FullType(Claim)]),
      );
    }
    if (object.label != null) {
      yield r'label';
      yield serializers.serialize(
        object.label,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.nameClaimType != null) {
      yield r'nameClaimType';
      yield serializers.serialize(
        object.nameClaimType,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.roleClaimType != null) {
      yield r'roleClaimType';
      yield serializers.serialize(
        object.roleClaimType,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ClaimsIdentity object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ClaimsIdentityBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'authenticationType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.authenticationType = valueDes;
          break;
        case r'isAuthenticated':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isAuthenticated = valueDes;
          break;
        case r'actor':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ClaimsIdentity),
          ) as ClaimsIdentity;
          result.actor.replace(valueDes);
          break;
        case r'bootstrapContext':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.bootstrapContext = valueDes;
          break;
        case r'claims':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(Claim)]),
          ) as BuiltList<Claim>?;
          if (valueDes == null) continue;
          result.claims.replace(valueDes);
          break;
        case r'label':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.label = valueDes;
          break;
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.name = valueDes;
          break;
        case r'nameClaimType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.nameClaimType = valueDes;
          break;
        case r'roleClaimType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.roleClaimType = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ClaimsIdentity deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ClaimsIdentityBuilder();
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

