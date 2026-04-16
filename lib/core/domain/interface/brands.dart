import 'package:rokctapp/core/infrastructure/models/models.dart';
import 'package:rokctapp/core/domain/handlers/handlers.dart';

abstract class BrandsRepositoryFacade {
  Future<ApiResult<BrandsPaginateResponse>> getBrandsPaginate(int page);

  Future<ApiResult<BrandsPaginateResponse>> searchBrands(String query);

  Future<ApiResult<SingleBrandResponse>> getSingleBrand(int id);

  Future<ApiResult<BrandsPaginateResponse>> getAllBrands({
    required int categoryId,
  });
}
