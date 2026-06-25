import 'package:processing_sdk/processing_sdk.dart';

enum OrderStatus {
  open,
  newOrder,
  accepted,
  cooking,
  ready,
  onAWay,
  onWay,
  delivered,
  canceled,
}

extension OrderStatusProcessingMapping on OrderStatus {
  ProcessingState toProcessingState() {
    switch (this) {
      case OrderStatus.open:
      case OrderStatus.newOrder:
        return ProcessingState.submitted;
      case OrderStatus.accepted:
        return ProcessingState.accepted;
      case OrderStatus.cooking:
        return ProcessingState.processing;
      case OrderStatus.ready:
        return ProcessingState.ready;
      case OrderStatus.onAWay:
      case OrderStatus.onWay:
        return ProcessingState.dispatched;
      case OrderStatus.delivered:
        return ProcessingState.completed;
      case OrderStatus.canceled:
        return ProcessingState.cancelled;
    }
  }

  static OrderStatus fromProcessingState(
    ProcessingState state, {
    bool useManagerFormat = false,
  }) {
    switch (state) {
      case ProcessingState.draft:
      case ProcessingState.submitted:
        return useManagerFormat ? OrderStatus.newOrder : OrderStatus.open;
      case ProcessingState.accepted:
        return OrderStatus.accepted;
      case ProcessingState.processing:
        return OrderStatus.cooking;
      case ProcessingState.ready:
        return OrderStatus.ready;
      case ProcessingState.dispatched:
      case ProcessingState.active:
        return useManagerFormat ? OrderStatus.onAWay : OrderStatus.onWay;
      case ProcessingState.completed:
        return OrderStatus.delivered;
      case ProcessingState.failed:
      case ProcessingState.cancelled:
        return OrderStatus.canceled;
    }
  }
}
