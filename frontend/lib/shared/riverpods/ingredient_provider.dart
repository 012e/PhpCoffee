import 'package:api_client/api_client.dart';
import 'package:built_collection/built_collection.dart';
import 'package:get_it/get_it.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ingredient_provider.g.dart';

@riverpod
class IngredientList extends _$IngredientList {
  @override
  FutureOr<BuiltList<IngredientResponse>> build() async {
    final api = GetIt.I<IngredientApi>();
    final response = await api.ingredientGet();
    if (response.statusCode != 200) {
      throw AsyncError('Failed to fetch ingredients', StackTrace.current);
    }
    return response.data ?? BuiltList<IngredientResponse>();
  }
}
