import 'package:core_sdk/core_sdk.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'order_details_state.dart';
import 'package:orders_sdk/orders_sdk.dart';

class PosOrderDetailsNotifier<T> extends StateNotifier<PosOrderDetailsState<T>> {
  final dynamic _ordersRepository;
  final dynamic _usersRepository;

  PosOrderDetailsNotifier(this._ordersRepository, this._usersRepository) : super(const PosOrderDetailsState());
  Timer? _searchUsersTimer;

  Future<void> updateOrderStatus({
    required OrderStatus status,
    VoidCallback? success,
  }) async {
    state = state.copyWith(isUpdating: true);
    final response = await _ordersRepository.updateOrderStatus(
      status: status,
      orderId: ((state.order as dynamic)?.id as int?),
    );
    response.when(
      success: (data) {
        state = state.copyWith(isUpdating: false);
        fetchOrderDetails(order: state.order);
        success?.call();
      },
      failure: (failure) {
        debugPrint('===> update order status fail $failure');
        state = state.copyWith(isUpdating: false);
      },
    );
  }

  Future<void> updateOrderDetailStatus({
    required String status,
    required int? id,
    VoidCallback? success,
  }) async {
    state = state.copyWith(isUpdating: true);
    final response = await _ordersRepository.updateOrderDetailStatus(
      status: status,
      orderId: id,
    );
    response.when(
      success: (data) {
        state = state.copyWith(isUpdating: false);
        fetchOrderDetails(order: state.order);
        success?.call();
      },
      failure: (failure) {
        debugPrint('===> update order detail status fail $failure');
        state = state.copyWith(isUpdating: false);
      },
    );
  }

  void toggleOrderDetailChecked({required int index}) {
    List<dynamic>? orderDetails = (state.order as dynamic)?.details;
    if (orderDetails == null || orderDetails.isEmpty) {
      return;
    }
    dynamic detail = orderDetails[index];
    final bool isChecked = detail.isChecked ?? false;
    detail = detail.copyWith(isChecked: !isChecked);
    orderDetails[index] = detail;
    final order = (state.order as dynamic)?.copyWith(details: orderDetails);
    state = state.copyWith(order: order);
  }

  void changeStatus(String status) {
    state = state.copyWith(status: status);
  }

  void changeDetailStatus(String status) {
    state = state.copyWith(detailStatus: status);
  }

  Future<void> fetchOrderDetails({T? order}) async {
    state = state.copyWith(isLoading: true, order: order);
    final response = await _ordersRepository.getOrderDetails(
      orderId: ((order as dynamic)?.id as int?),
    );
    response.when(
      success: (data) {
        state = state.copyWith(isLoading: false, order: data.data);
      },
      failure: (failure) {
        debugPrint('===> fetch order details fail $failure');
        state = state.copyWith(isLoading: false);
      },
    );
  }

  Future<void> fetchUsers({VoidCallback? checkYourNetwork}) async {
    const connected = true;
    if (connected) {
      state = state.copyWith(
        isUsersLoading: true,
        dropdownUsers: [],
        users: [],
      );
      final response = await _usersRepository.searchDeliveryman(
        state.usersQuery.isEmpty ? null : state.usersQuery,
      );
      response.when(
        success: (data) async {
          final List<dynamic> users = data.users ?? [];
          List<DropDownItemData> dropdownUsers = [];
          for (int i = 0; i < users.length; i++) {
            dropdownUsers.add(
              DropDownItemData(
                index: i,
                title: '${users[i].firstname} ${users[i].lastname ?? ""}',
              ),
            );
          }
          state = state.copyWith(
            isUsersLoading: false,
            users: users,
            dropdownUsers: dropdownUsers,
          );
        },
        failure: (failure) {
          state = state.copyWith(isUsersLoading: false);
          debugPrint('==> get users failure: $failure');
        },
      );
    } else {
      checkYourNetwork?.call();
    }
  }

  void setUsersQuery(BuildContext context, String query) {
    if (state.usersQuery == query) {
      return;
    }
    state = state.copyWith(usersQuery: query.trim());

    if (_searchUsersTimer?.isActive ?? false) {
      _searchUsersTimer?.cancel();
    }
    _searchUsersTimer = Timer(const Duration(milliseconds: 500), () {
      state = state.copyWith(users: [], dropdownUsers: []);
      fetchUsers(
        checkYourNetwork: () {
          debugPrint("Check your network connection");
        },
      );
    });
  }

  void setSelectedUser(BuildContext context, int index) {
    final user = state.users[index];
    state = state.copyWith(selectedUser: user);

    setUsersQuery(context, '');
  }

  Future<void> setDeliveryMan(BuildContext context) async {
    state = state.copyWith(isUpdating: true);
    final response = await _ordersRepository.setDeliverMan(
      orderId: ((state.order as dynamic)?.id as int?) ?? 0,
      deliverymanId: state.selectedUser?.id ?? 0,
    );
    response.when(
      success: (data) {
        fetchOrderDetails(order: state.order);
      },
      failure: (failure) {
        debugPrint('===> set deliveryman fail $failure');
        debugPrint("Something went wrong with the server");
      },
    );
  }

  void removeSelectedUser() {
    state = state.copyWith(selectedUser: null);
  }
}
