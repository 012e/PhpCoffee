import 'dart:io';

import 'package:api_client/api_client.dart';
import 'package:built_collection/built_collection.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:path/path.dart' as p;

part 'items_provider.g.dart';

@riverpod
class ItemList extends _$ItemList {
  @override
  Future<BuiltList<MenuItemResponse>?> build() async {
    final api = GetIt.I<MenuItemApi>();
    final response = await api.menuItemGet();
    // The logic we previously had in our FutureProvider is now in the build method.
    if (response.statusCode != 200) {
      throw AsyncError('Failed to fetch items', StackTrace.current);
    }
    return response.data ?? BuiltList<MenuItemResponse>();
  }

  Future<void> deleteItem(int itemId) async {
    final api = GetIt.I<MenuItemApi>();
    final response = await api.menuItemIdDelete(id: itemId);

    if (response.statusCode != 500) {
      // Refresh the list after successful deletion
      ref.invalidateSelf();
    } else {
      throw Exception('Failed to delete item');
    }
  }

  Future<MenuItemResponse?> getItemById(int itemId) async {
    final api = GetIt.I<MenuItemApi>();
    final response = await api.menuItemIdGet(
      id: itemId,
      validateStatus: (status) {
        return status == 204;
      },
    );

    return response.data;
  }

  Future<MenuItemResponse> createMenuItem(CreateMenuItemRequest request) async {
    final api = GetIt.I<MenuItemApi>();
    final response = await api.menuItemPost(createMenuItemRequest: request);

    if (response.statusCode == 201) {
      // Refresh the list after successful creation
      ref.invalidateSelf();
      return response.data!;
    } else {
      throw Exception('Failed to create menu item');
    }
  }

  Future<String> exportMenuItems({required String fileName}) async {
    try {
      final Dio dio = GetIt.instance<Dio>(); // Get Dio instance from GetIt

      final response = await dio.get(
        '/MenuItem/export-excel-closedxml',
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
              'Failed to download MenuItem Excel file: ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      print('Dio error downloading menu item excel for desktop: $e');
      print('Response data: ${e.response?.data}');
      rethrow;
    } catch (e) {
      print(
        'An unexpected error occurred during menu item excel desktop download: $e',
      );
      rethrow;
    }
  }
}
