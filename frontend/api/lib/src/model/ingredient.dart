//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api_client/src/model/inventory_transaction_detail.dart';
import 'package:api_client/src/model/supplier.dart';
import 'package:built_collection/built_collection.dart';
import 'package:api_client/src/model/recipe_ingredient.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ingredient.g.dart';

/// Ingredient
///
/// Properties:
/// * [ingredientId] 
/// * [ingredientName] 
/// * [unit] 
/// * [currentQuantity] 
/// * [supplierId] 
/// * [createdAt] 
/// * [imageUrl] 
/// * [inventoryTransactionDetails] 
/// * [recipeIngredients] 
/// * [supplier] 
@BuiltValue()
abstract class Ingredient implements Built<Ingredient, IngredientBuilder> {
  @BuiltValueField(wireName: r'ingredientId')
  int? get ingredientId;

  @BuiltValueField(wireName: r'ingredientName')
  String? get ingredientName;

  @BuiltValueField(wireName: r'unit')
  String? get unit;

  @BuiltValueField(wireName: r'currentQuantity')
  double? get currentQuantity;

  @BuiltValueField(wireName: r'supplierId')
  int? get supplierId;

  @BuiltValueField(wireName: r'createdAt')
  DateTime? get createdAt;

  @BuiltValueField(wireName: r'imageUrl')
  String? get imageUrl;

  @BuiltValueField(wireName: r'inventoryTransactionDetails')
  BuiltList<InventoryTransactionDetail>? get inventoryTransactionDetails;

  @BuiltValueField(wireName: r'recipeIngredients')
  BuiltList<RecipeIngredient>? get recipeIngredients;

  @BuiltValueField(wireName: r'supplier')
  Supplier? get supplier;

  Ingredient._();

  factory Ingredient([void updates(IngredientBuilder b)]) = _$Ingredient;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(IngredientBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Ingredient> get serializer => _$IngredientSerializer();
}

class _$IngredientSerializer implements PrimitiveSerializer<Ingredient> {
  @override
  final Iterable<Type> types = const [Ingredient, _$Ingredient];

  @override
  final String wireName = r'Ingredient';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Ingredient object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.ingredientId != null) {
      yield r'ingredientId';
      yield serializers.serialize(
        object.ingredientId,
        specifiedType: const FullType(int),
      );
    }
    if (object.ingredientName != null) {
      yield r'ingredientName';
      yield serializers.serialize(
        object.ingredientName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.unit != null) {
      yield r'unit';
      yield serializers.serialize(
        object.unit,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.currentQuantity != null) {
      yield r'currentQuantity';
      yield serializers.serialize(
        object.currentQuantity,
        specifiedType: const FullType.nullable(double),
      );
    }
    if (object.supplierId != null) {
      yield r'supplierId';
      yield serializers.serialize(
        object.supplierId,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.createdAt != null) {
      yield r'createdAt';
      yield serializers.serialize(
        object.createdAt,
        specifiedType: const FullType.nullable(DateTime),
      );
    }
    if (object.imageUrl != null) {
      yield r'imageUrl';
      yield serializers.serialize(
        object.imageUrl,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.inventoryTransactionDetails != null) {
      yield r'inventoryTransactionDetails';
      yield serializers.serialize(
        object.inventoryTransactionDetails,
        specifiedType: const FullType.nullable(BuiltList, [FullType(InventoryTransactionDetail)]),
      );
    }
    if (object.recipeIngredients != null) {
      yield r'recipeIngredients';
      yield serializers.serialize(
        object.recipeIngredients,
        specifiedType: const FullType.nullable(BuiltList, [FullType(RecipeIngredient)]),
      );
    }
    if (object.supplier != null) {
      yield r'supplier';
      yield serializers.serialize(
        object.supplier,
        specifiedType: const FullType(Supplier),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    Ingredient object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required IngredientBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'ingredientId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.ingredientId = valueDes;
          break;
        case r'ingredientName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.ingredientName = valueDes;
          break;
        case r'unit':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.unit = valueDes;
          break;
        case r'currentQuantity':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(double),
          ) as double?;
          if (valueDes == null) continue;
          result.currentQuantity = valueDes;
          break;
        case r'supplierId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.supplierId = valueDes;
          break;
        case r'createdAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.createdAt = valueDes;
          break;
        case r'imageUrl':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.imageUrl = valueDes;
          break;
        case r'inventoryTransactionDetails':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(InventoryTransactionDetail)]),
          ) as BuiltList<InventoryTransactionDetail>?;
          if (valueDes == null) continue;
          result.inventoryTransactionDetails.replace(valueDes);
          break;
        case r'recipeIngredients':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(RecipeIngredient)]),
          ) as BuiltList<RecipeIngredient>?;
          if (valueDes == null) continue;
          result.recipeIngredients.replace(valueDes);
          break;
        case r'supplier':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Supplier),
          ) as Supplier;
          result.supplier.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Ingredient deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = IngredientBuilder();
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

