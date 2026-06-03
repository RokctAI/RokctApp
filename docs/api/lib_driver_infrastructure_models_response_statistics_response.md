# API Reference: statistics_response

Source file: `lib/driver/infrastructure/models/response/statistics_response.dart`

## Classes

### class `StatisticsResponse`

### class `StatisticsData`

## Whitelisted API Endpoints

### `copyWith({ String? timestamp, bool? status, String? message, StatisticsData? data, }) => StatisticsResponse( timestamp: timestamp ?? this.timestamp, status: status ?? this.status, message: message ?? this.message, data: data ?? this.data, ); Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*

### `copyWith({ num? progressOrdersCount, num? deliveredOrdersCount, num? cancelOrdersCount, num? newOrdersCount, num? acceptedOrdersCount, num? readyOrdersCount, num? onAWayOrdersCount, num? ordersCount, Dyn totalPrice, }) => StatisticsData( progressOrdersCount: progressOrdersCount ?? this.progressOrdersCount, deliveredOrdersCount: deliveredOrdersCount ?? this.deliveredOrdersCount, cancelOrdersCount: cancelOrdersCount ?? this.cancelOrdersCount, newOrdersCount: newOrdersCount ?? this.newOrdersCount, acceptedOrdersCount: acceptedOrdersCount ?? this.acceptedOrdersCount, readyOrdersCount: readyOrdersCount ?? this.readyOrdersCount, onAWayOrdersCount: onAWayOrdersCount ?? this.onAWayOrdersCount, ordersCount: ordersCount ?? this.ordersCount, totalPrice: totalPrice ?? this.totalPrice, ); Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*
