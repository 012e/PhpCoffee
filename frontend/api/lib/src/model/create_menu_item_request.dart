//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api_client/src/model/create_recipe_request.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_menu_item_request.g.dart';

/// CreateMenuItemRequest
///
/// Properties:
/// * [itemName] 
/// * [description] 
/// * [basePrice] 
/// * [isActive] 
/// * [recipe] 
@BuiltValue()
abstract class CreateMenuItemRequest implements Built<CreateMenuItemRequest, CreateMenuItemRequestBuilder> {
  @BuiltValueField(wireName: r'itemName')
  String? get itemName;

  @BuiltValueField(wireName: r'description')
  String? get description;

  @BuiltValueField(wireName: r'basePrice')
  double? get basePrice;

  @BuiltValueField(wireName: r'isActive')
  bool? get isActive;

  @BuiltValueField(wireName: r'recipe')
  CreateRecipeRequest? get recipe;

  CreateMenuItemRequest._();

  factory CreateMenuItemRequest([void updates(CreateMenuItemRequestBuilder b)]) = _$CreateMenuItemRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateMenuItemRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateMenuItemRequest> get serializer => _$CreateMenuItemRequestSerializer();
}

class _$CreateMenuItemRequestSerializer implements PrimitiveSerializer<CreateMenuItemRequest> {
  @override
  final Iterable<Type> types = const [CreateMenuItemRequest, _$CreateMenuItemRequest];

  @override
  final String wireName = r'CreateMenuItemRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateMenuItemRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.itemName != null) {
      yield r'itemName';
      yield serializers.serialize(
        object.itemName,
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
    if (object.basePrice != null) {
      yield r'basePrice';
      yield serializers.serialize(
        object.basePrice,
        specifiedType: const FullType(double),
      );
    }
    if (object.isActive != null) {
      yield r'isActive';
      yield serializers.serialize(
        object.isActive,
        specifiedType: const FullType.nullable(bool),
      );
    }
    if (object.recipe != null) {
      yield r'recipe';
      yield serializers.serialize(
        object.recipe,
        specifiedType: const FullType(CreateRecipeRequest),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateMenuItemRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreateMenuItemRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'itemName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.itemName = valueDes;
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.description = valueDes;
          break;
        case r'basePrice':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.basePrice = valueDes;
          break;
        case r'isActive':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.isActive = valueDes;
          break;
        case r'recipe':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(CreateRecipeRequest),
          ) as CreateRecipeRequest;
          result.recipe.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CreateMenuItemRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateMenuItemRequestBuilder();
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

