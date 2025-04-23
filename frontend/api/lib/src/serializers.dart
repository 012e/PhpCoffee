//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_import

import 'package:one_of_serializer/any_of_serializer.dart';
import 'package:one_of_serializer/one_of_serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:api_client/src/date_serializer.dart';
import 'package:api_client/src/model/date.dart';

import 'package:api_client/src/model/claim.dart';
import 'package:api_client/src/model/claims_identity.dart';
import 'package:api_client/src/model/create_ingredient_request.dart';
import 'package:api_client/src/model/create_inventory_transaction_detail_request.dart';
import 'package:api_client/src/model/create_inventory_transaction_request.dart';
import 'package:api_client/src/model/create_menu_item_request.dart';
import 'package:api_client/src/model/create_order_item_request.dart';
import 'package:api_client/src/model/create_orders_request.dart';
import 'package:api_client/src/model/create_payment_request.dart';
import 'package:api_client/src/model/create_recipe_ingredient_request.dart';
import 'package:api_client/src/model/create_recipe_request.dart';
import 'package:api_client/src/model/create_supplier_request.dart';
import 'package:api_client/src/model/ingredient.dart';
import 'package:api_client/src/model/ingredient_response.dart';
import 'package:api_client/src/model/inventory_transaction.dart';
import 'package:api_client/src/model/inventory_transaction_detail.dart';
import 'package:api_client/src/model/inventory_transaction_detail_response.dart';
import 'package:api_client/src/model/inventory_transaction_response.dart';
import 'package:api_client/src/model/menu_item.dart';
import 'package:api_client/src/model/menu_item_response.dart';
import 'package:api_client/src/model/order.dart';
import 'package:api_client/src/model/order_item.dart';
import 'package:api_client/src/model/payment.dart';
import 'package:api_client/src/model/problem_details.dart';
import 'package:api_client/src/model/recipe.dart';
import 'package:api_client/src/model/recipe_ingredient.dart';
import 'package:api_client/src/model/sepay_response.dart';
import 'package:api_client/src/model/supplier.dart';
import 'package:api_client/src/model/supplier_response.dart';
import 'package:api_client/src/model/update_ingredient_request.dart';

part 'serializers.g.dart';

@SerializersFor([
  Claim,
  ClaimsIdentity,
  CreateIngredientRequest,
  CreateInventoryTransactionDetailRequest,
  CreateInventoryTransactionRequest,
  CreateMenuItemRequest,
  CreateOrderItemRequest,
  CreateOrdersRequest,
  CreatePaymentRequest,
  CreateRecipeIngredientRequest,
  CreateRecipeRequest,
  CreateSupplierRequest,
  Ingredient,
  IngredientResponse,
  InventoryTransaction,
  InventoryTransactionDetail,
  InventoryTransactionDetailResponse,
  InventoryTransactionResponse,
  MenuItem,
  MenuItemResponse,
  Order,
  OrderItem,
  Payment,
  ProblemDetails,
  Recipe,
  RecipeIngredient,
  SepayResponse,
  Supplier,
  SupplierResponse,
  UpdateIngredientRequest,
])
Serializers serializers = (_$serializers.toBuilder()
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(SupplierResponse)]),
        () => ListBuilder<SupplierResponse>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(IngredientResponse)]),
        () => ListBuilder<IngredientResponse>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(InventoryTransactionResponse)]),
        () => ListBuilder<InventoryTransactionResponse>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(MenuItemResponse)]),
        () => ListBuilder<MenuItemResponse>(),
      )
      ..add(const OneOfSerializer())
      ..add(const AnyOfSerializer())
      ..add(const DateSerializer())
      ..add(Iso8601DateTimeSerializer()))
    .build();

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
