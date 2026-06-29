import 'package:flutter/material.dart';
import 'package:core_sdk/core_sdk.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:core_sdk/core_sdk.dart';

import 'package:core_sdk/core_sdk.dart';
import 'package:rokctapp/core/application/help/help_state.dart';

class HelpNotifier extends Notifier<HelpState> {
  @override
  HelpState build() => const HelpState();

  Future<void> fetchHelp(BuildContext context) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isLoading: true);
      final response = await settingsRepository.getFaq();
      response.when(
        success: (data) async {
          state = state.copyWith(isLoading: false, data: data);
        },
        failure: (failure, status) {
          state = state.copyWith(isLoading: false);
          AppHelpers.showCheckTopSnackBar(context, failure);
        },
      );
    } else {
      if (context.mounted) {
        AppHelpers.showNoConnectionSnackBar(context);
      }
    }
  }
}
