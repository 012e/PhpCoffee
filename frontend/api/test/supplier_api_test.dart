import 'package:test/test.dart';
import 'package:api_client/api_client.dart';


/// tests for SupplierApi
void main() {
  final instance = ApiClient().getSupplierApi();

  group(SupplierApi, () {
    //Future<BuiltList<SupplierResponse>> supplierGet() async
    test('test supplierGet', () async {
      // TODO
    });

    //Future supplierIdDelete(int id) async
    test('test supplierIdDelete', () async {
      // TODO
    });

    //Future<SupplierResponse> supplierIdGet(int id) async
    test('test supplierIdGet', () async {
      // TODO
    });

    //Future<SupplierResponse> supplierPost({ CreateSupplierRequest createSupplierRequest }) async
    test('test supplierPost', () async {
      // TODO
    });

  });
}
