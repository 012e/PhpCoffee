import 'package:test/test.dart';
import 'package:api_client/api_client.dart';


/// tests for OrderApi
void main() {
  final instance = ApiClient().getOrderApi();

  group(OrderApi, () {
    //Future<Order> orderPost({ CreateOrdersRequest createOrdersRequest }) async
    test('test orderPost', () async {
      // TODO
    });

  });
}
