import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:core_sdk/core_sdk.dart';
import 'package:wallet_sdk/wallet_sdk.dart';
import '../../domain/interface/payment_facade.dart';

class PaymentRepository implements PaymentsFacade {
  final Dio _client;
  final String? Function()? _localeCallback;
  final String? Function()? _walletUuidCallback;
  final String? Function()? _currencyIdCallback;

  PaymentRepository(
    this._client, {
    String? Function()? localeCallback,
    String? Function()? walletUuidCallback,
    String? Function()? currencyIdCallback,
  }) : _localeCallback = localeCallback,
       _walletUuidCallback = walletUuidCallback,
       _currencyIdCallback = currencyIdCallback;

  @override
  Future<ApiResult<PaymentsResponse>> getPayments() async {
    try {
      final response = await _client.get(
        '/api/v1/rest/payments',
        queryParameters: {"lang": _localeCallback?.call() ?? 'en'},
      );
      return ApiResult.success(data: PaymentsResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> get payments error: $e');
      return ApiResult.failure(
        error: NetworkHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<NonExistPaymentResponse>> getNonExistPayments() async {
    try {
      final response = await _client.get(
        '/api/v1/dashboard/seller/shop-payments/shop-non-exist',
        queryParameters: {"lang": _localeCallback?.call() ?? 'en'},
      );
      return ApiResult.success(
        data: NonExistPaymentResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get non exist payments error: $e');
      return ApiResult.failure(
        error: NetworkHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<String>> paymentWalletWebView({
    required String name,
    required num price,
  }) async {
    try {
      final data = {
        'wallet_id': _walletUuidCallback?.call() ?? "",
        'total_price': price,
        "currency_id": _currencyIdCallback?.call(),
      };

      final res = await _client.post(
        '/api/v1/dashboard/user/$name-process',
        data: data,
      );

      return ApiResult.success(data: res.data["data"]["data"]["url"] ?? "");
    } catch (e) {
      debugPrint('==> web view wallet failure: $e');
      return ApiResult.failure(
        error: NetworkHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<MaksekeskusResponse>> paymentMaksekeskusView({
    num? price,
  }) async {
    try {
      final data = {
        'wallet_id': _walletUuidCallback?.call() ?? "",
        'total_price': price ?? 0,
        "currency_id": _currencyIdCallback?.call(),
      };
      debugPrint('==> payment maksekeskus request: $data');
      final res = await _client.post(
        '/api/v1/dashboard/user/maksekeskus-process',
        data: data,
      );

      return ApiResult.success(
        data: MaksekeskusResponse.fromJson(res.data["data"]),
      );
    } catch (e) {
      debugPrint('==> payment maksekeskus  failure: $e');
      return ApiResult.failure(
        error: NetworkHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<String>> paymentSubscriptionWebView({
    required String name,
    required int subscriptionId,
  }) async {
    try {
      final data = {
        'subscription_id': subscriptionId,
        "currency_id": _currencyIdCallback?.call(),
      };

      final res = await _client.post(
        '/api/v1/dashboard/user/$name-process',
        data: data,
      );

      return ApiResult.success(data: res.data["data"]["data"]["url"] ?? "");
    } catch (e) {
      debugPrint('==> web view wallet failure: $e');
      return ApiResult.failure(
        error: NetworkHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<bool>> sendWallet({
    required String uuid,
    required num price,
  }) async {
    try {
      final data = {
        'uuid': uuid,
        'price': price,
        "currency_id": _currencyIdCallback?.call(),
      };
      await _client.post('/api/v1/dashboard/user/wallet/send', data: data);
      return const ApiResult.success(data: true);
    } catch (e) {
      debugPrint('==> send wallet failure: $e');
      return ApiResult.failure(
        error: NetworkHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }
}
