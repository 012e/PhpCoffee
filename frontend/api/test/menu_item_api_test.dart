import 'package:test/test.dart';
import 'package:api_client/api_client.dart';


/// tests for MenuItemApi
void main() {
  final instance = ApiClient().getMenuItemApi();

  group(MenuItemApi, () {
    //Future<BuiltList<MenuItemResponse>> menuItemGet() async
    test('test menuItemGet', () async {
      // TODO
    });

    //Future menuItemIdDelete(int id) async
    test('test menuItemIdDelete', () async {
      // TODO
    });

    //Future<MenuItemResponse> menuItemIdGet(int id) async
    test('test menuItemIdGet', () async {
      // TODO
    });

    //Future<MenuItemResponse> menuItemPost({ CreateMenuItemRequest createMenuItemRequest }) async
    test('test menuItemPost', () async {
      // TODO
    });

  });
}
