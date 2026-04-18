import 'package:flutter/material.dart';
import 'package:rokctapp/core/domain/handlers/handlers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/manager/application/order_details/order_details_state.dart';
import 'package:rokctapp/manager/infrastructure/models/models.dart';
import 'package:rokctapp/manager/infrastructure/services/services.dart';
import 'package:rokctapp/manager/domain/interface/interfaces.dart';

class OrderDetailsNotifier extends StateNotifier<OrderDetailsState> {
  final OrdersInterface _ordersRepository;

  OrderDetailsNotifier(this._ordersRepository)
    : super(const OrderDetailsState());

  Future<void> updateOrderStatus(
    BuildContext context, {
    required OrderStatus status,
    VoidCallback? success,
  }) async {
    state = state.copyWith(isUpdating: true);
    final response = await _ordersRepository.updateOrderStatus(
      status: status,
      orderId: state.order?.id,
    );
    response.when(
      success: (data) {
        state = state.copyWith(isUpdating: false);
        success?.call();
      },
      failure: (f, s) {
        debugPrint('===> update order status fail $f');
        state = state.copyWith(isUpdating: false);
        AppHelpers.showCheckTopSnackBar(
          context,
          text: f,
          type: SnackBarType.error,
        );
      },
    );
  }

  void toggleOrderDetailChecked({required int index}) {
    List<OrderDetail>? orderDetails = state.order?.details;
    if (orderDetails == null || orderDetails.isEmpty) {
      return;
    }
    OrderDetail detail = orderDetails[index];
    final bool isChecked = detail.isChecked ?? false;
    detail = detail.copyWith(isChecked: !isChecked);
    orderDetails[index] = detail;
    final order = state.order?.copyWith(details: orderDetails);
    state = state.copyWith(order: order);
  }

  Future<void> fetchOrderDetails({OrderData? order}) async {
    state = state.copyWith(isLoading: true, order: order);
    final response = await _ordersRepository.getOrderDetails(
      orderId: order?.id,
    );
    response.when(
      success: (data) {
        state = state.copyWith(isLoading: false, order: data.data);
      },
      failure: (f, s) {
        debugPrint('===> fetch order details fail $f');
        state = state.copyWith(isLoading: false);
      },
    );
  }
}
