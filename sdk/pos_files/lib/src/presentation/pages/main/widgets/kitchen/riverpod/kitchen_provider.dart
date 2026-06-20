import 'package:admin_desktop/src/core/di/dependency_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kitchen_sdk/kitchen_sdk.dart';
import 'package:admin_desktop/src/models/data/order_data.dart';

final kitchenProvider = StateNotifierProvider<KitchenNotifier<OrderData>, KitchenState<OrderData>>(
  (ref) => KitchenNotifier<OrderData>(ordersRepository),
);

