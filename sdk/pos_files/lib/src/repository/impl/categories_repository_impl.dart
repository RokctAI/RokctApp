import 'package:flutter/material.dart';
import 'package:admin_desktop/src/core/di/dependency_manager.dart';
import 'package:admin_desktop/src/core/handlers/handlers.dart';
import 'package:admin_desktop/src/core/utils/utils.dart';
import 'package:admin_desktop/src/models/models.dart';
import '../repository.dart';

class CategoriesRepositoryImpl extends CategoriesRepository {
  @override
  Future<ApiResult<CategoriesPaginateResponse>> searchCategories(
    int page, {
    String? query,
    String? type,
  }) async {
    final data = {
      'lang': LocalStorage.getLanguage()?.locale ?? 'en',
      'perPage': 100,
      'page': page,
      if (type == null) 'type': 'main',
      "has_products": 1,
      if (query != null && query.isNotEmpty) 'search': query,
      if (type != null && type.isNotEmpty) 'type': type,
      type == 'combo' ? "c_shop_id" : "p_shop_id":
          LocalStorage.getUser()?.shop?.id,
    };
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
        '/api/v1/rest/categories/paginate',
        queryParameters: data,
      );
      return ApiResult.success(
        data: CategoriesPaginateResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get categories failure: $e');
      return ApiResult.failure(error: AppHelpers.errorHandler(e));
    }
  }
}
