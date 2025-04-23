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
}
