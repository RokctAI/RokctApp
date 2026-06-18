import 'package:flutter/material.dart';
import 'package:core_sdk/core_sdk.dart';
import 'models/data/profile_models.dart';

class ProfileRepository {
  // --- Address Management ---
  Future<ApiResult<AddressesResponse>> getUserAddresses() async {
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get('/api/v1/dashboard/user/addresses');
      return ApiResult.success(data: AddressesResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> get user addresses failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  Future<ApiResult<void>> deleteAddress(int addressId) async {
    try {
      final client = dioHttp.client(requireAuth: true);
      await client.delete('/api/v1/dashboard/user/addresses/$addressId');
      return const ApiResult.success(data: null);
    } catch (e) {
      debugPrint('==> delete address failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  Future<ApiResult<SingleAddressResponse>> createAddress(
    LocalAddressData address,
  ) async {
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.post(
        '/api/v1/dashboard/user/addresses',
        data: address.toJson(),
      );
      return ApiResult.success(
        data: SingleAddressResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> create address failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  // --- Profile / User Settings ---
  Future<ApiResult<void>> updateProfile({required Map<String, dynamic> data}) async {
    try {
      final client = dioHttp.client(requireAuth: true);
      await client.put('/api/v1/dashboard/user/profile/update', data: data);
      return const ApiResult.success(data: null);
    } catch (e) {
      debugPrint('==> update profile failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  // --- App / Translation Settings ---
  Future<ApiResult<Map<String, dynamic>>> getGlobalSettings() async {
    try {
      final client = dioHttp.client(requireAuth: false);
      final response = await client.get('/api/v1/rest/settings');
      return ApiResult.success(data: Map<String, dynamic>.from(response.data));
    } catch (e) {
      debugPrint('==> get settings failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }
}
