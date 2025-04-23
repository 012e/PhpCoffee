import 'package:test/test.dart';
import 'package:api_client/api_client.dart';


/// tests for IngredientApi
void main() {
  final instance = ApiClient().getIngredientApi();

  group(IngredientApi, () {
    //Future<BuiltList<IngredientResponse>> ingredientGet() async
    test('test ingredientGet', () async {
      // TODO
    });

    //Future ingredientIdDelete(int id) async
    test('test ingredientIdDelete', () async {
      // TODO
    });

    //Future<IngredientResponse> ingredientIdGet(int id) async
    test('test ingredientIdGet', () async {
      // TODO
    });

    //Future ingredientIdImagePut(int id, { MultipartFile file }) async
    test('test ingredientIdImagePut', () async {
      // TODO
    });

    //Future<IngredientResponse> ingredientIdPatch(int id, { UpdateIngredientRequest updateIngredientRequest }) async
    test('test ingredientIdPatch', () async {
      // TODO
    });

    //Future<IngredientResponse> ingredientPost({ CreateIngredientRequest createIngredientRequest }) async
    test('test ingredientPost', () async {
      // TODO
    });

  });
}
