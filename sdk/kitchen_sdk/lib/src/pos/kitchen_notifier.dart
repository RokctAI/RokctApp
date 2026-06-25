import 'dart:async';

import 'package:orders_sdk/orders_sdk.dart';

import 'package:kitchen_sdk/src/domain/kitchen_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'kitchen_state.dart';
import 'package:orders_sdk/orders_sdk.dart';

class KitchenNotifier<T> extends StateNotifier<KitchenState<T>> {
  final KitchenRepository<dynamic, dynamic, OrderStatus> _ordersRepository;

  KitchenNotifier(this._ordersRepository) : super(const KitchenState());
  int _page = 0;
  Timer? _searchProductsTimer;
  Timer? _refreshTime;

  void changeType(String type) {
    state = state.copyWith(selectType: type, orders: []);
    fetchOrders(isRefresh: true);
  }

  Future<void> updateOrderDetailStatus({
    required String status,
    required int? id,
    VoidCallback? success,
  }) async {
    state = state.copyWith(isUpdatingStatus: true);
    final response = await _ordersRepository.updateOrderDetailStatus(
      status: status,
      orderId: id,
    );
    response.when(
      success: (data) {
        state = state.copyWith(isUpdatingStatus: false);
        fetchOrderDetails();
        success?.call();
      },
      failure: (failure) {
        debugPrint('===> update order detail status fail $failure');
        state = state.copyWith(isUpdatingStatus: false);
      },
    );
  }

  void changeDetailStatus(String status) {
    state = state.copyWith(detailStatus: status);
  }

  Future<void> selectIndex(int index) async {
    state = state.copyWith(
      selectIndex: index,
      selectOrder: state.orders[index],
    );
    fetchOrderDetails();
  }

  Future<void> fetchOrderDetails() async {
    final response = await _ordersRepository.getOrderDetailsKitchen(
      orderId: ((state.selectOrder as dynamic)?.id as int?),
    );
    response.when(
      success: (data) {
        state = state.copyWith(selectOrder: data.data);
      },
      failure: (e) {},
    );
  }

  void setOrdersQuery(BuildContext context, String query) {
    if (state.query == query) {
      return;
    }
    state = state.copyWith(query: query.trim());
    if (state.query.isNotEmpty) {
      if (_searchProductsTimer?.isActive ?? false) {
        _searchProductsTimer?.cancel();
      }
      _searchProductsTimer = Timer(const Duration(milliseconds: 500), () {
        state = state.copyWith(hasMore: true, orders: []);
        _page = 0;
        fetchOrders(
          isRefresh: true,
          checkYourNetwork: () {
            debugPrint("Check your network connection");
          },
        );
      });
    } else {
      if (_searchProductsTimer?.isActive ?? false) {
        _searchProductsTimer?.cancel();
      }
      _searchProductsTimer = Timer(const Duration(milliseconds: 500), () {
        state = state.copyWith(hasMore: true, orders: []);
        _page = 0;
        fetchOrders(
          isRefresh: true,
          checkYourNetwork: () {
            debugPrint("Check your network connection");
          },
        );
      });
    }
  }

  Future<void> fetchOrders({
    bool isRefresh = false,
    VoidCallback? checkYourNetwork,
  }) async {
    if (isRefresh) {
      _refreshTime?.cancel();
      _page = 0;
      state = state.copyWith(hasMore: true, orders: []);
    }
    if (!state.hasMore) {
      return;
    }
    state = state.copyWith(isLoading: true);
    final response = await _ordersRepository.getKitchenOrders(
      status: state.selectType,
      page: ++_page,
      search: state.query.isEmpty ? null : state.query,
    );
    response.when(
      success: (data) {
        List<T> orders =
            isRefresh || state.query.isNotEmpty ? [] : List.from(state.orders);
        final List<T> newOrders = data.orders ?? [];
        for (T element in data.orders ?? []) {
          if (!orders
              .map((item) => ((item as dynamic).id))
              .contains(((element as dynamic).id))) {
            orders.add(element);
          }
        }
        state = state.copyWith(hasMore: newOrders.length >= 6);
        if (_page == 1 && !isRefresh) {
          state = state.copyWith(isLoading: false, orders: orders);
        } else {
          state = state.copyWith(isLoading: false, orders: orders);
        }
        if (isRefresh && (data.orders?.isNotEmpty ?? false)) {
          selectIndex(0);
          _refreshTime = Timer.periodic(const Duration(seconds: 10), (s) async {
            final response = await _ordersRepository.getKitchenOrders(
              status: state.selectType,
              page: 1,
              search: state.query.isEmpty ? null : state.query,
            );
            response.when(
              success: (data) {
                // bool isAdd = false;
                // List<T> orders = List.from(state.orders);
                // for (T element in data.orders ?? []) {
                //   if (!orders.map((item) => ((item as dynamic).id)).contains(((element as dynamic).id))) {
                //     orders.insert(0, element);
                //     isAdd = true;
                //   }
                // }
                state = state.copyWith(orders: data.orders ?? []);
                if (state.selectIndex > (data.orders?.length ?? 0)) {
                  selectIndex(0);
                }
              },
              failure: (f) {},
            );
          });
        } else if (isRefresh && (data.orders?.isEmpty ?? true)) {
          state = state.copyWith(selectOrder: null);
        }
      },
      failure: (failure) {
        _page--;
        if (_page == 0) {
          state = state.copyWith(isLoading: false);
        }
      },
    );
  }

  Future<void> changeStatus({String? status}) async {
    T? newOrder = (state.selectOrder as dynamic)?.copyWith(
      status: status ??
          status ??
          ((state.selectOrder as dynamic)?.status as String),
    );
    state = state.copyWith(selectOrder: newOrder);

    List<T> orders = List.from(state.orders);

    for (int i = 0; i < orders.length; i++) {
      if (((orders[i] as dynamic).id) ==
          ((state.selectOrder as dynamic)?.id as int?)) {
        orders.removeAt(i);
        orders.insert(i, newOrder as T);
      }
    }

    state = state.copyWith(orders: orders);

    await _ordersRepository.updateOrderStatusKitchen(
      status: OrderStatusProcessingMapping.fromProcessingState(OrderStatus
          .values
          .firstWhere((e) =>
              e.toString().split('.').last ==
              ((state.selectOrder as dynamic)?.status as String))
          .toProcessingState()),
      orderId: ((state.selectOrder as dynamic)?.id as int?),
    );
    _page = 0;
    fetchOrders();
  }

  void stopTimer() {
    _refreshTime?.cancel();
  }
}
