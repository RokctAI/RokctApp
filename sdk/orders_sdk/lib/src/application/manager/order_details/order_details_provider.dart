import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:orders_sdk/orders_sdk.dart';
import 'package:rokctapp/manager/infrastructure/models/models.dart';
import 'package:rokctapp/core/domain/di/dependency_manager.dart';

final orderDetailsProvider =
    StateNotifierProvider<OrderDetailsNotifier<OrderData>, OrderDetailsState<OrderData>>(
      (ref) => OrderDetailsNotifier<OrderData>(managerOrdersRepository),
    );

