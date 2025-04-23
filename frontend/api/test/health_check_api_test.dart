import 'package:test/test.dart';
import 'package:api_client/api_client.dart';


/// tests for HealthCheckApi
void main() {
  final instance = ApiClient().getHealthCheckApi();

  group(HealthCheckApi, () {
    //Future<String> healthCheckAuthorizedGet() async
    test('test healthCheckAuthorizedGet', () async {
      // TODO
    });

    //Future<ProblemDetails> healthCheckCurrentUserGet() async
    test('test healthCheckCurrentUserGet', () async {
      // TODO
    });

    //Future<String> healthCheckThrowExceptionGet() async
    test('test healthCheckThrowExceptionGet', () async {
      // TODO
    });

  });
}
