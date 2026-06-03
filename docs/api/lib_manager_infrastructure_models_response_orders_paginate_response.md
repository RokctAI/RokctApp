# API Reference: orders_paginate_response

Source file: `lib/manager/infrastructure/models/response/orders_paginate_response.dart`

## Classes

### class `OrdersPaginateResponse`

### class `OrderResponseData`

### class `OrdersStatistic`

## Whitelisted API Endpoints

### `copyWith({OrderResponseData? data}) => OrdersPaginateResponse(data: data ?? _data); OrderResponseData? get data => _data; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*

### `copyWith({ OrdersStatistic? statistic, List<OrderData>? orders, }) => OrderResponseData( statistic: statistic ?? _statistic, orders: orders ?? _orders, ); OrdersStatistic? get statistic => _statistic; List<OrderData>? get orders => _orders; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*

### `copyWith({ int? progressOrdersCount, int? deliveredOrdersCount, int? cancelOrdersCount, int? newOrdersCount, int? acceptedOrdersCount, int? cookingOrdersCount, int? readyOrdersCount, int? onAWayOrdersCount, int? ordersCount, num? totalPrice, int? todayCount, }) => OrdersStatistic( progressOrdersCount: progressOrdersCount ?? _progressOrdersCount, deliveredOrdersCount: deliveredOrdersCount ?? _deliveredOrdersCount, cancelOrdersCount: cancelOrdersCount ?? _cancelOrdersCount, newOrdersCount: newOrdersCount ?? _newOrdersCount, acceptedOrdersCount: acceptedOrdersCount ?? _acceptedOrdersCount, cookingOrdersCount: cookingOrdersCount ?? _cookingOrdersCount, readyOrdersCount: readyOrdersCount ?? _readyOrdersCount, onAWayOrdersCount: onAWayOrdersCount ?? _onAWayOrdersCount, ordersCount: ordersCount ?? _ordersCount, totalPrice: totalPrice ?? _totalPrice, todayCount: todayCount ?? _todayCount, ); int? get progressOrdersCount => _progressOrdersCount; int? get deliveredOrdersCount => _deliveredOrdersCount; int? get cancelOrdersCount => _cancelOrdersCount; int? get newOrdersCount => _newOrdersCount; int? get acceptedOrdersCount => _acceptedOrdersCount; int? get cookingOrdersCount => _cookingOrdersCount; int? get readyOrdersCount => _readyOrdersCount; int? get onAWayOrdersCount => _onAWayOrdersCount; int? get ordersCount => _ordersCount; num? get totalPrice => _totalPrice; int? get todayCount => _todayCount; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*
