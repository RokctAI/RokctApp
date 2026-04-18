import 'package:flutter/material.dart';
import 'package:rokctapp/core/domain/di/dependency_manager.dart';
import 'package:rokctapp/core/domain/interface/blogs.dart';
import 'package:rokctapp/customer/models/models.dart';
import 'package:rokctapp/core/infrastructure/utils/services.dart';
import 'package:rokctapp/core/domain/handlers/handlers.dart';

class BlogsRepository implements BlogsRepositoryFacade {
  @override
  Future<ApiResult<BlogsPaginateResponse>> getBlogs(
    int page,
    String type,
  ) async {
    final data = {
      'perPage': 15,
      'page': page,
      'type': type,
      'lang': LocalStorage.getLanguage()?.locale,
    };
    try {
      final client = dioHttp.client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/blogs/paginate',
        queryParameters: data,
      );
      return ApiResult.success(
        data: BlogsPaginateResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get blogs paginate failure: $e');
      return ApiResult.f(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<BlogDetailsResponse>> getBlogDetails(String uuid) async {
    final data = {'lang': LocalStorage.getLanguage()?.locale};
    try {
      final client = dioHttp.client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/blogs/$uuid',
        queryParameters: data,
      );
      return ApiResult.success(
        data: BlogDetailsResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get blogs details failure: $e');
      return ApiResult.f(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }
}
