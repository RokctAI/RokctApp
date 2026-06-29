import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:core_sdk/core_sdk.dart';
import 'package:wallet_sdk/wallet_sdk.dart';
import '../../domain/interface/subscription_facade.dart';
import '../../models/manager/subscriptions_response.dart';

class SubscriptionsRepository implements SubscriptionsFacade {
  final Dio _client;
  final String? Function()? _localeCallback;

  SubscriptionsRepository(this._client, {String? Function()? localeCallback})
    : _localeCallback = localeCallback;

  @override
  Future<ApiResult<SubscriptionResponse>> getSubscriptions({
    required int page,
    String? locale,
  }) async {
    final activeLocale = locale ?? _localeCallback?.call();
    final data = {'lang': activeLocale};
    try {
      final response = await _client.get(
        '/api/v1/dashboard/seller/subscriptions',
        queryParameters: data,
      );
      return ApiResult.success(
        data: SubscriptionResponse.fromJson(response.data),
      );
    } catch (e, s) {
      debugPrint('==> get subscription failure: $e,$s');
      return ApiResult.failure(
        error: NetworkHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult> purchaseSubscription({
    required int id,
    required int paymentId,
  }) async {
    final data = {'payment_sys_id': paymentId};
    try {
      final response = await _client.post(
        '/api/v1/dashboard/seller/subscriptions/$id/attach',
        data: data,
      );
      return ApiResult.success(data: response.data['data']['id']);
    } catch (e) {
      debugPrint('==> purchase ads failure: $e');
      return ApiResult.failure(
        error: NetworkHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<TransactionsResponse>> createTransaction({
    required int id,
    required int paymentId,
  }) async {
    final data = {'payment_sys_id': paymentId};
    debugPrint('===> create transaction body: ${jsonEncode(data)}');
    debugPrint('===> create transaction subscriptions id: $id');
    try {
      final response = await _client.post(
        '/api/v1/payments/subscription/$id/transactions',
        data: data,
      );
      return ApiResult.success(
        data: TransactionsResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> create transaction failure: $e');
      return ApiResult.failure(
        error: NetworkHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }
}
