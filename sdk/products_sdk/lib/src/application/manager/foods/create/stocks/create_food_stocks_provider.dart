import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:products_sdk/src/application/manager/foods/create/stocks/create_food_stocks_state.dart';
import 'package:products_sdk/src/application/manager/foods/create/stocks/create_food_stocks_notifier.dart';
import 'package:rokctapp/core/domain/di/dependency_manager.dart';

final createFoodStocksProvider =
    StateNotifierProvider<CreateFoodStocksNotifier, CreateFoodStocksState>(
      (ref) => CreateFoodStocksNotifier(managerProductRepository),
    );
