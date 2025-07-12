import 'dart:io';

import 'package:api_client/api_client.dart';
import 'package:built_collection/built_collection.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

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

  Future<String> exportExcel({required String fileName}) async {
    try {
      final Dio dio = GetIt.instance<Dio>(); // Get Dio instance from GetIt

      final response = await dio.get(
        '/Ingredient/export-excel',
        options: Options(
          responseType: ResponseType.bytes, // Important for binary files
          followRedirects: false,
          validateStatus: (status) => status != null && status < 500,
        ),
      );

      if (response.statusCode == 200) {
        Directory? downloadDirectory;

        // Try to get the Downloads directory first (preferred for user downloads)
        try {
          downloadDirectory = await getDownloadsDirectory();
        } catch (e) {
          print(
            'Warning: Could not get Downloads directory: $e. Falling back to application documents.',
          );
        }

        // Fallback to application documents if downloads directory is not available or failed
        downloadDirectory ??= await getApplicationDocumentsDirectory();

        // Ensure the directory exists
        if (!await downloadDirectory.exists()) {
          await downloadDirectory.create(recursive: true);
        }

        // Use path.join to create an OS-agnostic file path
        final filePath = p.join(downloadDirectory.path, fileName);
        final file = File(filePath);
        await file.writeAsBytes(response.data as List<int>);
        return filePath;
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
          error:
              'Failed to download Ingredient Excel file: ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      print('Dio error downloading ingredient excel for desktop: $e');
      print('Response data: ${e.response?.data}');
      rethrow;
    } catch (e) {
      print(
        'An unexpected error occurred during ingredient excel desktop download: $e',
      );
      rethrow;
    }
  }
}
