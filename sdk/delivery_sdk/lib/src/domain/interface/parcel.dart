import 'package:merchants_sdk/src/infrastructure/models/data/location_data.dart';
import 'package:core_sdk/core_sdk.dart';
import 'package:core_sdk/src/models/response/parcel_paginate_response.dart';

import 'package:core_sdk/src/models/models.dart';

abstract class ParcelRepositoryFacade {
  Future<ApiResult<ParcelTypeResponse>> getTypes();

  Future<ApiResult<ParcelCalculateResponse>> getCalculate({
    required int typeId,
    required LocationData from,
    required LocationData to,
  });

  Future<ApiResult> orderParcel({
    required int typeId,
    required LocationData from,
    required String fromTitle,
    required LocationData to,
    required String toTitle,
    required String time,
    required String note,
    required String phoneFrom,
    required String phoneTo,
    required String usernameTo,
    required String usernameFrom,
    required String floorTo,
    required String floorFrom,
    required String houseFrom,
    required String houseTo,
    required String comment,
    required String value,
    required String instruction,
    required bool notify,
  });

  Future<ApiResult<ParcelPaginateResponse>> getActiveParcel(int page);

  Future<ApiResult<ParcelPaginateResponse>> getHistoryParcel(int page);

  Future<ApiResult<ParcelOrder>> getSingleParcel(num orderId);

  Future<ApiResult<void>> addReview(
    num orderId, {
    required double rating,
    required String comment,
  });

  Future<ApiResult<String>> process(num orderId, String name);

  Future<ApiResult<TransactionsResponse>> createTransaction({
    required int orderId,
    required int paymentId,
  });
}

