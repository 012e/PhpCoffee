import 'package:api_client/api_client.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

void setupApis() {
  final dio = GetIt.I<Dio>();
  final getIt = GetIt.I;
  final apiClient = ApiClient(dio: dio);
  getIt.registerSingleton<ApiClient>(apiClient);

  final MenuItemApi menuItemApi = apiClient.getMenuItemApi();
  getIt.registerSingleton<MenuItemApi>(menuItemApi);

  final InventoryTransactionApi inventoryTransactionApi =
      apiClient.getInventoryTransactionApi();
  getIt.registerSingleton<InventoryTransactionApi>(inventoryTransactionApi);

  final OrderApi orderApi = apiClient.getOrderApi();
  getIt.registerSingleton<OrderApi>(orderApi);

  final IngredientApi ingredientApi = apiClient.getIngredientApi();
  getIt.registerSingleton<IngredientApi>(ingredientApi);

  final HealthCheckApi healthCheckApi = apiClient.getHealthCheckApi();
  getIt.registerSingleton<HealthCheckApi>(healthCheckApi);
}
