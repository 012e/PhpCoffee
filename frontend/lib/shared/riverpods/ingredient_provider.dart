import 'package:api_client/api_client.dart';
import 'package:built_collection/built_collection.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ingredient_provider.g.dart';

@riverpod
class IngredientList extends _$IngredientList {
  final api = GetIt.I<IngredientApi>();

  @override
  Future<BuiltList<IngredientResponse>> build() async {
    final response = await api.ingredientGet();
    if (response.statusCode != 200) {
      throw AsyncError('Failed to fetch ingredients', StackTrace.current);
    }
    return response.data ?? BuiltList<IngredientResponse>();
  }

  Future<IngredientResponse> createIngredient(
    CreateIngredientRequest createIngredientRequest,
  ) async {
    try {
      final response = await api.ingredientPost(
        createIngredientRequest: createIngredientRequest,
      );
      if (response.statusCode != 201) {
        throw AsyncError('Failed to create ingredient', StackTrace.current);
      }
      ref.invalidateSelf();
      return response.data!;
    } catch (e) {
      throw AsyncError('Failed to create ingredient', StackTrace.current);
    }
  }

  Future<void> uploadImage({
    required int ingredientId,
    required String imagePath,
  }) async {
    final file = await MultipartFile.fromFile(imagePath);
    try {
      final response = await api.ingredientIdImagePut(
        id: ingredientId,
        file: file,
      );
      if (response.statusCode != 201 && response.statusCode != 200) {
        throw AsyncError('Failed to upload image', StackTrace.current);
      }
      ref.invalidateSelf();
    } catch (e) {
      throw AsyncError('Failed to upload image', StackTrace.current);
    }
  }

  Future<void> deleteIngredient(int ingredientId) async {
    try {
      final response = await api.ingredientIdDelete(id: ingredientId);
      if (response.statusCode != 204) {
        throw AsyncError('Failed to delete ingredient', StackTrace.current);
      }
      ref.invalidateSelf();
    } catch (e) {
      throw AsyncError('Failed to delete ingredient', StackTrace.current);
    }
  }

  Future<void> updateIngredient(
    int ingredientId,
    UpdateIngredientRequest updateIngredientRequest,
  ) async {
    try {
      final response = await api.ingredientIdPatch(
        id: ingredientId,
        updateIngredientRequest: updateIngredientRequest,
      );
      if (response.statusCode != 200) {
        throw AsyncError('Failed to update ingredient', StackTrace.current);
      }
      ref.invalidateSelf();
    } catch (e) {
      throw AsyncError('Failed to update ingredient', StackTrace.current);
    }
  }
}
