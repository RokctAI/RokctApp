import 'package:core_sdk/core_sdk.dart';
import 'package:core_sdk/core_sdk.dart';

abstract class CatalogInterface {
  Future<ApiResult<UnitsPaginateResponse>> getUnits();

  Future<ApiResult<KitchensPaginateResponse>> getKitchens();

  Future<ApiResult<void>> createCategory({required String title, int? input});

  Future<ApiResult<CategoriesPaginateResponse>> getCategories({
    int? page,
    String? query,
    String? type,
    bool hasProducts = false,
  });

  Future<ApiResult<CategoriesPaginateResponse>> getShopCategories({
    int? page,
    String? query,
  });

  Future<ApiResult<CategoriesPaginateResponse>> getCategoriesSub({
    int? page,
    String? query,
  });

  Future<ApiResult> deleteCategory({required int? id});
}
