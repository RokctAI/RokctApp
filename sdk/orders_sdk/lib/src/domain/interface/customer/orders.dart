import 'package:rokctapp/customer/models/data/order_active_model.dart';
import 'package:rokctapp/customer/models/data/refund_data.dart';
import 'package:rokctapp/customer/models/models.dart';
import 'package:core_sdk/core_sdk.dart';

import 'package:core_sdk/core_sdk.dart';
import 'package:rokctapp/customer/models/data/get_calculate_data.dart';

abstract class OrdersInterface {
  Future<ApiResult<GetCalculateModel>> getCalculate({
    required String cartId,
    required double lat,
    required double long,
    required DeliveryTypeEnum type,
    String? coupon,
  });

  Future<ApiResult<OrderActiveModel>> createOrder(OrderBodyData orderBody);

  Future<ApiResult> createAutoOrder({
    required String orderId,
    required String startDate,
    String? endDate,
    String? cronPattern,
    String? paymentMethod,
    String? savedCardId,
  });

  Future<ApiResult> deleteAutoOrder(String orderId);

  Future<ApiResult<OrderPaginateResponse>> getCompletedOrders(int page);

  Future<ApiResult<OrderPaginateResponse>> getActiveOrders(int page);

  Future<ApiResult<OrderPaginateResponse>> getHistoryOrders(
    int page, {
    DateTime? start,
    DateTime? end,
    List<String>? status,
  });

  Future<ApiResult<RefundOrdersModel>> getRefundOrders(int page);

  Future<ApiResult<OrderActiveModel>> getSingleOrder(String orderId);

  Future<ApiResult<LocalLocation>> getDriverLocation(String deliveryId);

  Future<ApiResult<void>> cancelOrder(String orderId, [String? note]);

  Future<ApiResult<void>> refundOrder(String orderId, String title);

  Future<ApiResult<void>> addReview(
    String orderId, {
    required double rating,
    required String comment,
  });

  Future<ApiResult<String>> process(
    OrderBodyData orderBody,
    String name, {
    bool forceCardPayment,
    bool enableTokenization,
  });

  Future<ApiResult<String>> tipProcess({
    required String orderId,
    required double tip,
  });

  Future<ApiResult<CouponResponse>> checkCoupon({
    required String coupon,
    required String shopId,
  });

  Future<ApiResult<CashbackResponse>> checkCashback({
    required double amount,
    required String shopId,
  });
}
