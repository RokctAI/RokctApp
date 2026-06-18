import 'package:flutter/material.dart';
import 'package:core_sdk/core_sdk.dart';
import 'models/data/wallet_models.dart';

class WalletRepository {
  Future<ApiResult<PaymentsResponse>> getPayments() async {
    final data = {'lang': LocalStorage.getLanguage()?.locale ?? 'en'};
    try {
      final client = dioHttp.client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/payments',
        queryParameters: data,
      );
      return ApiResult.success(data: PaymentsResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> get payments failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  Future<ApiResult<TransactionsResponse>> createTransaction({
    required int orderId,
    required int paymentId,
  }) async {
    final data = {'payment_sys_id': paymentId};
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.post(
        '/api/v1/payments/order/$orderId/transactions',
        data: data,
      );
      return ApiResult.success(
        data: TransactionsResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> create transaction failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  Future<ApiResult<NonExistPaymentResponse>> getNonExistPayments() async {
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/seller/shop-payments/shop-non-exist',
        queryParameters: {"lang": LocalStorage.getLanguage()?.locale ?? 'en'},
      );
      return ApiResult.success(
        data: NonExistPaymentResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get non exist payments error: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  Future<ApiResult<String>> paymentWalletWebView({
    required String name,
    required num price,
    required String walletUuid,
  }) async {
    try {
      final data = {
        'wallet_id': walletUuid,
        'total_price': price,
        "currency_id": LocalStorage.getSelectedCurrency()?.id,
      };

      final client = dioHttp.client(requireAuth: true);
      final res = await client.post(
        '/api/v1/dashboard/user/$name-process',
        data: data,
      );

      return ApiResult.success(data: res.data["data"]["data"]["url"] ?? "");
    } catch (e) {
      debugPrint('==> web view wallet failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  Future<ApiResult<MaksekeskusResponse>> paymentMaksekeskusView({
    num? price,
    required String walletUuid,
  }) async {
    try {
      final data = {
        'wallet_id': walletUuid,
        'total_price': price ?? 0,
        "currency_id": LocalStorage.getSelectedCurrency()?.id,
      };
      final client = dioHttp.client(requireAuth: true);
      final res = await client.post(
        '/api/v1/dashboard/user/maksekeskus-process',
        data: data,
      );

      return ApiResult.success(
        data: MaksekeskusResponse.fromJson(res.data["data"]),
      );
    } catch (e) {
      debugPrint('==> payment maksekeskus failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  Future<ApiResult<bool>> sendWallet({
    required String uuid,
    required num price,
  }) async {
    try {
      final data = {
        'uuid': uuid,
        'price': price,
        "currency_id": LocalStorage.getSelectedCurrency()?.id,
      };
      final client = dioHttp.client(requireAuth: true);
      await client.post('/api/v1/dashboard/user/wallet/send', data: data);
      return const ApiResult.success(data: true);
    } catch (e) {
      debugPrint('==> send wallet failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }
}
