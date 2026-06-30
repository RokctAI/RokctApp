import 'package:merchants_sdk/src/infrastructure/models/data/location_data.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:core_sdk/core_sdk.dart';
import 'package:core_sdk/src/domain/interface/shops.dart';
import 'package:core_sdk/src/models/models.dart';

import 'package:core_sdk/core_sdk.dart';
import 'package:core_sdk/core_sdk.dart';
import 'package:core_sdk/core_sdk.dart';

class ShopsRepository implements ShopsRepositoryFacade {
  @override
  Future<ApiResult<MerchantsPaginateResponse>> searchShops({
    required String text,
    String? categoryId,
  }) async {
    final data = SearchShopModel(text: text, categoryId: categoryId);
    try {
      final client = dioHttp.client(requireAuth: false);
      client.options.connectTimeout = const Duration(seconds: 30);
      client.options.receiveTimeout = const Duration(seconds: 30);
      final response = await client.get(
        '/api/v1/rest/shops/search',
        queryParameters: data.toJson(),
      );
      return ApiResult.success(
        data: MerchantsPaginateResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> search shops failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<MerchantsPaginateResponse>> getNearbyShops(
    double latitude,
    double longitude,
  ) async {
    final data = {'clientLocation': '$latitude,$longitude'};
    try {
      final client = dioHttp.client(requireAuth: false);
      client.options.connectTimeout = const Duration(seconds: 30);
      client.options.receiveTimeout = const Duration(seconds: 30);
      final response = await client.get(
        '/api/v1/rest/shops/nearby',
        queryParameters: data,
      );
      return ApiResult.success(
        data: MerchantsPaginateResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get nearby shops failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<MerchantsPaginateResponse>> getAllShops(
    int page, {
    String? categoryId,
    FilterModel? filterModel,
    required bool isOpen,
    bool? verify,
  }) async {
    final data = MerchantRequest(
      page: page,
      categoryId: categoryId,
      price: filterModel?.price,
      rating: filterModel?.rating,
      freeDelivery: filterModel?.isFreeDelivery,
      orderBy: filterModel?.sort,
      onlyOpen: isOpen,
      verify: verify,
      deals: filterModel?.isDeal,
      take: filterModel?.offer,
    );
    try {
      final client = dioHttp.client(requireAuth: false);
      client.options.connectTimeout = const Duration(seconds: 30);
      client.options.receiveTimeout = const Duration(seconds: 30);
      final response = await client.get(
        '/api/v1/rest/shops/paginate',
        queryParameters: data.toJson(),
      );
      return ApiResult.success(
        data: MerchantsPaginateResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get all shops failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<BranchResponse>> getShopBranch({
    required String uuid,
  }) async {
    try {
      final client = dioHttp.client(requireAuth: false);
      client.options.connectTimeout = const Duration(seconds: 30);
      client.options.receiveTimeout = const Duration(seconds: 30);
      final response = await client.get(
        '/api/v1/rest/branches?lang=en&shop_id=$uuid&page=1&perPage=100',
      );
      return ApiResult.success(data: BranchResponse.fromJson(response.data));
    } catch (e) {
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<SingleMerchantResponse>> getSingleShop({
    required String uuid,
  }) async {
    final data = OnlyMerchantRequest();
    try {
      final client = dioHttp.client(requireAuth: false);
      client.options.connectTimeout = const Duration(seconds: 30);
      client.options.receiveTimeout = const Duration(seconds: 30);
      final response = await client.get(
        '/api/v1/rest/shops/$uuid',
        queryParameters: data.toJson(),
      );
      return ApiResult.success(
        data: SingleMerchantResponse.fromJson(response.data),
      );
    } catch (e) {
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<dynamic>> joinOrder({
    required String shopId,
    required String name,
    required String cartId,
  }) async {
    final data = {"shop_id": shopId, "name": name, "cart_id": cartId};
    try {
      final client = dioHttp.client(requireAuth: false);
      client.options.connectTimeout = const Duration(seconds: 30);
      client.options.receiveTimeout = const Duration(seconds: 30);
      final response = await client.post('/api/v1/rest/cart/open', data: data);
      return ApiResult.success(data: response.data["data"]["uuid"]);
    } catch (e) {
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<MerchantsPaginateResponse>> getShopFilter({
    String? categoryId,
    required int page,
    String? subCategoryId,
  }) async {
    final data = {
      'category_id': subCategoryId ?? categoryId,
      'perPage': 5,
      "open": 1,
      "page": page,
      'lang': LocalStorage.getLanguage()?.locale,
      "address": {
        "latitude":
            LocalStorage.getAddressSelected()?.location?.latitude ??
            AppConstants.demoLatitude,
        "longitude":
            LocalStorage.getAddressSelected()?.location?.longitude ??
            AppConstants.demoLongitude,
      },
    };
    try {
      final client = dioHttp.client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/shops/paginate',
        queryParameters: data,
      );
      return ApiResult.success(
        data: MerchantsPaginateResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get work filter shops failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<MerchantsPaginateResponse>> getPickupShops() async {
    final data = {
      'delivery': 'pickup',
      'perPage': 100,
      'lang': LocalStorage.getLanguage()?.locale,
    };
    try {
      final client = dioHttp.client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/shops/paginate',
        queryParameters: data,
      );
      return ApiResult.success(
        data: MerchantsPaginateResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get pickup shops failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<MerchantsPaginateResponse>> getShopsByIds(
    List<String> shopIds,
  ) async {
    final data = <String, dynamic>{'lang': LocalStorage.getLanguage()?.locale};
    for (int i = 0; i < shopIds.length; i++) {
      data['shops[$i]'] = shopIds[i];
    }
    try {
      final client = dioHttp.client(requireAuth: false);
      client.options.connectTimeout = const Duration(seconds: 30);
      client.options.receiveTimeout = const Duration(seconds: 30);
      final response = await client.get(
        '/api/v1/rest/shops/paginate',
        queryParameters: data,
      );
      return ApiResult.success(
        data: MerchantsPaginateResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get shops by ids failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
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
    required AddressNewModel? address,
    String? logoImage,
    String? backgroundImage,
  }) async {
    final data = {
      "price_per_km": perKm,
      'tax': tax,
      'documents': documents,
      'delivery_time_type': deliveryType,
      'location': LocationData(
        latitude: address?.location?.first,
        longitude: address?.location?.last,
      ).toJson(),
      'phone': phone,
      'delivery_time_from': deliveryFrom,
      'delivery_time_to': deliveryTo,
      'title': {LocalStorage.getLanguage()?.locale ?? "": name},
      'description': {LocalStorage.getLanguage()?.locale ?? "": description},
      'price': startPrice,
      'address': {
        LocalStorage.getLanguage()?.locale ?? "":
            "${address?.address?.address}",
      },
      if (logoImage != null) 'images': [logoImage, backgroundImage],
    };
    try {
      final client = dioHttp.client(requireAuth: true);
      client.options.connectTimeout = const Duration(seconds: 30);
      client.options.receiveTimeout = const Duration(seconds: 30);
      await client.post('/api/v1/dashboard/user/shops', data: data);
      return const ApiResult.success(data: null);
    } catch (e) {
      debugPrint('==> create shop failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<MerchantsPaginateResponse>> getShopsRecommend(int page) async {
    final data = MerchantRequest(page: page, onlyOpen: true);
    try {
      final client = dioHttp.client(requireAuth: false);
      client.options.connectTimeout = const Duration(seconds: 30);
      client.options.receiveTimeout = const Duration(seconds: 30);
      final response = await client.get(
        '/api/v1/rest/shops/recommended',
        queryParameters: data.toJson(),
      );
      return ApiResult.success(
        data: MerchantsPaginateResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get all shops recommend failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<List<List<StoryModel?>?>?>> getStory(int page) async {
    final data = StoryRequest(page: page);
    try {
      final client = dioHttp.client(requireAuth: false);
      client.options.connectTimeout = const Duration(seconds: 30);
      client.options.receiveTimeout = const Duration(seconds: 30);
      final response = await client.get(
        '/api/v1/rest/stories/paginate',
        queryParameters: data,
      );
      return ApiResult.success(data: storyModelFromJson(response.data));
    } catch (e) {
      debugPrint('==> get all story failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<TagResponse>> getTags(String categoryId) async {
    try {
      final client = dioHttp.client(requireAuth: false);
      final data = <String, dynamic>{
        'lang': LocalStorage.getLanguage()?.locale ?? "en",
        'category_id': categoryId,
      };
      final response = await client.get(
        '/api/v1/rest/shops-takes',
        queryParameters: data,
      );
      return ApiResult.success(data: TagResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> get all take failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<bool>> checkDriverZone(
    LatLng location, {
    String? shopId,
  }) async {
    try {
      final client = dioHttp.client(requireAuth: false);
      final data = <String, dynamic>{
        'address[latitude]': location.latitude,
        'address[longitude]': location.longitude,
      };
      dynamic response;
      if (shopId == null) {
        response = await client.get(
          '/api/v1/rest/shop//delivery-zone/check/distance',
          queryParameters: data,
        );
      } else {
        response = await client.get(
          '/api/v1/rest/shop/$shopId/delivery-zone/check/distance',
          queryParameters: data,
        );
      }

      return ApiResult.success(data: response.data["status"]);
    } catch (e) {
      debugPrint('==> get delivery zone failure: $e');
      return ApiResult.failure(
        error: (e.runtimeType == DioException)
            ? ((e as DioException).response?.data["message"])
            : "",
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<PriceModel>> getSuggestPrice() async {
    try {
      final client = dioHttp.client(requireAuth: false);
      final data = {
        if (LocalStorage.getSelectedCurrency() != null)
          "currency_id": LocalStorage.getSelectedCurrency()?.id,
      };
      final response = await client.get(
        '/api/v1/rest/products-avg-prices',
        queryParameters: data,
      );
      return ApiResult.success(data: PriceModel.fromJson(response.data));
    } catch (e) {
      debugPrint('==> get all price failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }
}



