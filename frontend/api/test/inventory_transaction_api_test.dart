import 'package:test/test.dart';
import 'package:api_client/api_client.dart';


/// tests for InventoryTransactionApi
void main() {
  final instance = ApiClient().getInventoryTransactionApi();

  group(InventoryTransactionApi, () {
    //Future<BuiltList<InventoryTransactionResponse>> inventoryTransactionGet() async
    test('test inventoryTransactionGet', () async {
      // TODO
    });

    //Future inventoryTransactionIdDelete(int id) async
    test('test inventoryTransactionIdDelete', () async {
      // TODO
    });

    //Future<InventoryTransactionResponse> inventoryTransactionIdGet(int id) async
    test('test inventoryTransactionIdGet', () async {
      // TODO
    });

    //Future<InventoryTransaction> inventoryTransactionPost({ CreateInventoryTransactionRequest createInventoryTransactionRequest }) async
    test('test inventoryTransactionPost', () async {
      // TODO
    });

  });
}
