import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:products_sdk/src/application/manager/foods/edit/stocks/edit_food_stocks_state.dart';
import 'package:products_sdk/src/application/manager/foods/edit/stocks/edit_food_stocks_notifier.dart';
import 'package:core_sdk/core_sdk.dart';

final editFoodStocksProvider =
    StateNotifierProvider<EditFoodStocksNotifier, EditFoodStocksState>(
      (ref) => EditFoodStocksNotifier(managerProductRepository),
    );
