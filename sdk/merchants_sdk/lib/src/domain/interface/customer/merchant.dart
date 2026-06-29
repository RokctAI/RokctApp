import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:core_sdk/core_sdk.dart';
import 'package:rokctapp/customer/models/models.dart';

abstract class MerchantRepositoryFacade {
  Future<ApiResult<MerchantsPaginateResponse>> getShopFilter({
    String? categoryId,
    required int page,
    String? subCategoryId,
  });

  Future<ApiResult<MerchantsPaginateResponse>> getPickupShops();

  Future<ApiResult<MerchantsPaginateResponse>> searchShops({
    required String text,
    String? categoryId,
  });

  Future<ApiResult<MerchantsPaginateResponse>> getNearbyShops(
    double latitude,
    double longitude,
  );

  Future<ApiResult<MerchantsPaginateResponse>> getAllShops(
    int page, {
    String? categoryId,
    FilterModel? filterModel,
    required bool isOpen,
    bool? verify,
  });

  Future<ApiResult<TagResponse>> getTags(String categoryId);

  Future<ApiResult<bool>> checkDriverZone(LatLng location, {String? shopId});

  Future<ApiResult<PriceModel>> getSuggestPrice();

  Future<ApiResult<MerchantsPaginateResponse>> getShopsRecommend(int page);

  Future<ApiResult<List<List<StoryModel?>?>?>> getStory(int page);

  Future<ApiResult<SingleMerchantResponse>> getSingleShop({required String uuid});

  Future<ApiResult<dynamic>> joinOrder({
    required String shopId,
    required String name,
    required String cartId,
  });

  Future<ApiResult<BranchResponse>> getShopBranch({required String uuid});

  Future<ApiResult<MerchantsPaginateResponse>> getShopsByIds(List<String> shopIds);

  Future<ApiResult<void>> createShop({
    required double tax,
    required List<String> documents,
    required double deliveryTo,
    required double deliveryFrom,
    required String deliveryType,
    required String phone,
    required String name,
    required String category,
    required String description,
    required double startPrice,
    required double perKm,
    required AddressNewModel address,
    String? logoImage,
    String? backgroundImage,
  });
}

