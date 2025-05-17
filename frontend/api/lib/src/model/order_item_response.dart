//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api_client/src/model/menu_item_response.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'order_item_response.g.dart';

/// OrderItemResponse
///
/// Properties:
/// * [itemId] 
/// * [quantity] 
/// * [unitPrice] 
/// * [totalPrice] 
/// * [menuItem] 
@BuiltValue()
abstract class OrderItemResponse implements Built<OrderItemResponse, OrderItemResponseBuilder> {
  @BuiltValueField(wireName: r'itemId')
  int? get itemId;

  @BuiltValueField(wireName: r'quantity')
  int? get quantity;

  @BuiltValueField(wireName: r'unitPrice')
  double? get unitPrice;

  @BuiltValueField(wireName: r'totalPrice')
  double? get totalPrice;

  @BuiltValueField(wireName: r'menuItem')
  MenuItemResponse? get menuItem;

  OrderItemResponse._();

  factory OrderItemResponse([void updates(OrderItemResponseBuilder b)]) = _$OrderItemResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(OrderItemResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<OrderItemResponse> get serializer => _$OrderItemResponseSerializer();
}

class _$OrderItemResponseSerializer implements PrimitiveSerializer<OrderItemResponse> {
  @override
  final Iterable<Type> types = const [OrderItemResponse, _$OrderItemResponse];

  @override
  final String wireName = r'OrderItemResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    OrderItemResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.itemId != null) {
      yield r'itemId';
      yield serializers.serialize(
        object.itemId,
        specifiedType: const FullType(int),
      );
    }
    if (object.quantity != null) {
      yield r'quantity';
      yield serializers.serialize(
        object.quantity,
        specifiedType: const FullType(int),
      );
    }
    if (object.unitPrice != null) {
      yield r'unitPrice';
      yield serializers.serialize(
        object.unitPrice,
        specifiedType: const FullType(double),
      );
    }
    if (object.totalPrice != null) {
      yield r'totalPrice';
      yield serializers.serialize(
        object.totalPrice,
        specifiedType: const FullType(double),
      );
    }
    if (object.menuItem != null) {
      yield r'menuItem';
      yield serializers.serialize(
        object.menuItem,
        specifiedType: const FullType(MenuItemResponse),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    OrderItemResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required OrderItemResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'itemId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.itemId = valueDes;
          break;
        case r'quantity':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.quantity = valueDes;
          break;
        case r'unitPrice':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.unitPrice = valueDes;
          break;
        case r'totalPrice':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.totalPrice = valueDes;
          break;
        case r'menuItem':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(MenuItemResponse),
          ) as MenuItemResponse;
          result.menuItem.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  OrderItemResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = OrderItemResponseBuilder();
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

