import 'package:flutter/material.dart';
import 'package:core_sdk/core_sdk.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:core_sdk/core_sdk.dart';
import 'package:core_sdk/core_sdk.dart';

import 'package:rokctapp/customer/application/favorites/favorites_state.dart';

class FavoritesNotifier extends Notifier<FavoritesState> {
  @override
  FavoritesState build() => const FavoritesState();

  Future<void> fetchFavoritesShop(BuildContext context) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isShopLoading: true);
      final list = LocalStorage.getSavedShopsList();
      if (list.isNotEmpty) {
        final response = await shopsRepository.getShopsByIds(list);
        response.when(
          success: (data) async {
            state = state.copyWith(
              isShopLoading: false,
              shops: data.data ?? [],
            );
          },
          failure: (failure, status) {
            state = state.copyWith(isShopLoading: false);
            AppHelpers.showCheckTopSnackBar(context, failure);
          },
        );
      } else {
        state = state.copyWith(isShopLoading: false, shops: []);
      }
    } else {
      if (context.mounted) {
        AppHelpers.showNoConnectionSnackBar(context);
      }
    }
  }
}
