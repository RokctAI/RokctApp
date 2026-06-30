import 'package:core_sdk/src/models/models.dart';
import 'package:core_sdk/core_sdk.dart';

abstract class BrandsRepositoryFacade {
  Future<ApiResult<BrandsPaginateResponse>> getBrandsPaginate(int page);

  Future<ApiResult<BrandsPaginateResponse>> searchBrands(String query);

  Future<ApiResult<SingleBrandResponse>> getSingleBrand(int id);

  Future<ApiResult<BrandsPaginateResponse>> getAllBrands({
    required int categoryId,
  });
}

