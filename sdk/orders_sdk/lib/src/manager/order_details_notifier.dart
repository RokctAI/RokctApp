import 'package:orders_sdk/src/manager/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'order_details_state.dart';
import 'package:orders_sdk/orders_sdk.dart';

class ManagerOrderDetailsNotifier extends StateNotifier<ManagerOrderDetailsState> {
  final dynamic _ordersRepository;

  ManagerOrderDetailsNotifier(this._ordersRepository) : super(const ManagerOrderDetailsState());

  Future<void> updateOrderStatus(
    BuildContext context, {
    required OrderStatus status,
    VoidCallback? success,
  }) async {
    state = state.copyWith(isUpdating: true);
    final response = await _ordersRepository.updateOrderStatus(
      status: status,
      orderId: (state.order?.id as int?),
    );
    response.when(
      success: (data) {
        state = state.copyWith(isUpdating: false);
        success?.call();
      },
      failure: (failure, status) {
        debugPrint('===> update order status fail $failure');
        state = state.copyWith(isUpdating: false);
      },
    );
  }

  void toggleOrderDetailChecked({required int index}) {
    List<dynamic>? orderDetails = (state.order?.details as List?);
    if (orderDetails == null || orderDetails.isEmpty) {
      return;
    }
    final detail = orderDetails[index];
    final bool isChecked = detail.isChecked ?? false;
    final updatedDetail = detail.copyWith(isChecked: !isChecked);
    orderDetails[index] = updatedDetail;
    final order = state.order?.copyWith(details: orderDetails?.cast<OrderDetail>());
    state = state.copyWith(order: order);
  }

  Future<void> fetchOrderDetails({OrderData? order}) async {
    state = state.copyWith(isLoading: true, order: order);
    final response = await _ordersRepository.getOrderDetails(
      orderId: (order?.id as int?),
    );
    response.when(
      success: (data) {
        state = state.copyWith(isLoading: false, order: data.data);
      },
      failure: (failure, status) {
        debugPrint('===> fetch order details fail $failure');
        state = state.copyWith(isLoading: false);
      },
    );
  }
}
