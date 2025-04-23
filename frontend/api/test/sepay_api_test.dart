import 'package:test/test.dart';
import 'package:api_client/api_client.dart';


/// tests for SepayApi
void main() {
  final instance = ApiClient().getSepayApi();

  group(SepayApi, () {
    //Future sepayPost({ SepayResponse sepayResponse }) async
    test('test sepayPost', () async {
      // TODO
    });

  });
}
