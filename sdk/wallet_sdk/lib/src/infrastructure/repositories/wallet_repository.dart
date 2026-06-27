import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:core_sdk/core_sdk.dart';
import '../../domain/interface/wallet.dart';
import '../../models/customer/wallet_histories_response.dart';

class WalletRepositoryImpl implements WalletRepository {
  final Dio _client;
  final String? Function()? _localeCallback;
  final String? Function()? _walletUuidCallback;
  final String? Function()? _currencyIdCallback;

  WalletRepositoryImpl(
    this._client, {
    String? Function()? localeCallback,
    String? Function()? walletUuidCallback,
    String? Function()? currencyIdCallback,
  }) : _localeCallback = localeCallback,
       _walletUuidCallback = walletUuidCallback,
       _currencyIdCallback = currencyIdCallback;

  @override
  Future<ApiResult<WalletHistoriesResponse>> getWalletHistories(int page) async {
    try {
      final response = await _client.get(
        '/api/v1/dashboard/user/wallet/histories',
        queryParameters: {
          'page': page,
          'lang': _localeCallback?.call() ?? 'en',
        },
      );
      return ApiResult.success(
        data: WalletHistoriesResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get wallet histories error: $e');
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
}
