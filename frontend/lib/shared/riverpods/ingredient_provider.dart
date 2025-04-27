import 'package:api_client/api_client.dart';
import 'package:built_collection/built_collection.dart';
import 'package:get_it/get_it.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ingredient_provider.g.dart';

@riverpod
class IngredientList extends _$IngredientList {
  @override
  Future<BuiltList<IngredientResponse>> build() async {
    final api = GetIt.I<IngredientApi>();
    final response = await api.ingredientGet();
    if (response.statusCode != 200) {
      throw AsyncError('Failed to fetch ingredients', StackTrace.current);
    }
    return response.data ?? BuiltList<IngredientResponse>();
  }

  Future<void> createIngredient(
    CreateIngredientRequest createIngredientRequest,
  ) async {
    final api = GetIt.I<IngredientApi>();
    try {
      final response = await api.ingredientPost(
        createIngredientRequest: createIngredientRequest,
      );
      if (response.statusCode != 201) {
        throw AsyncError('Failed to create ingredient', StackTrace.current);
      }
    } catch (e) {
      throw AsyncError('Failed to create ingredient', StackTrace.current);
    }
  }
}
