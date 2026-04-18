import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/manager/application/foods/create/details/create_food_details_state.dart';
import 'package:rokctapp/manager/application/foods/create/details/create_food_details_notifier.dart';
import 'package:rokctapp/manager/domain/di/dependency_manager.dart';

final createFoodDetailsProvider =
    StateNotifierProvider<CreateFoodDetailsNotifier, CreateFoodDetailsState>(
      (ref) => CreateFoodDetailsNotifier(productRepository, settingsRepository),
    );
