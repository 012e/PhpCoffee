import 'package:api_client/api_client.dart';
import 'package:built_collection/built_collection.dart';
import 'package:get_it/get_it.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'items_provider.g.dart';

@riverpod
class ItemList extends _$ItemList {
  @override
  Future<BuiltList<MenuItemResponse>?> build() async {
    final api = GetIt.I<MenuItemApi>();
    final response = await api.menuItemGet();
    // The logic we previously had in our FutureProvider is now in the build method.
    if (response.statusCode != 200) {
      throw AsyncError('Failed to fetch items', StackTrace.current);
    }
    return response.data ?? BuiltList<MenuItemResponse>();
  }

  Future<void> deleteItem(int itemId) async {
    final api = GetIt.I<MenuItemApi>();
    final response = await api.menuItemIdDelete(id: itemId);

    if (response.statusCode == 204) {
      // Refresh the list after successful deletion
      ref.invalidateSelf();
    } else {
      throw Exception('Failed to delete item');
    }
  }

  Future<MenuItemResponse?> getItemById(int itemId) async {
    final api = GetIt.I<MenuItemApi>();
    final response = await api.menuItemIdGet(id: itemId);

    if (response.statusCode == 200) {
      return response.data;
    }
    return null;
  }

  Future<MenuItemResponse> createMenuItem(CreateMenuItemRequest request) async {
    final api = GetIt.I<MenuItemApi>();
    final response = await api.menuItemPost(createMenuItemRequest: request);

    if (response.statusCode == 201) {
      // Refresh the list after successful creation
      ref.invalidateSelf();
      return response.data!;
    } else {
      throw Exception('Failed to create menu item');
    }
  }
}
