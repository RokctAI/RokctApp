import 'package:flutter/material.dart';
import 'package:rokctapp/core/domain/handlers/handlers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/manager/infrastructure/services/services.dart';
import 'package:rokctapp/manager/application/main/foods/extras/update/update_extras_group_state.dart';
import 'package:rokctapp/manager/domain/interface/interfaces.dart';

class UpdateExtrasGroupNotifier extends AutoDisposeNotifier<UpdateExtrasGroupState> {
  final ProductsInterface _productsRepository;
  String _title = '';

  UpdateExtrasGroupNotifier(this._productsRepository)
    : super(const UpdateExtrasGroupState());

  Future<void> updateExtrasGroup(
    BuildContext context, {
    VoidCallback? success,
    int? groupId,
  }) async {
    state = state.copyWith(isLoading: true);
    final response = await _productsRepository.updateExtrasGroup(
      title: _title,
      groupId: groupId,
    );
    response.when(
      success: (data) {
        state = state.copyWith(isLoading: false);
        success?.call();
      },
      f: (f, s) {
        debugPrint('===> update extras group f $f');
        state = state.copyWith(isLoading: false);
        AppHelpers.showCheckTopSnackBar(
          context,
          text: f,
          type: SnackBarType.error,
        );
      },
    );
  }

  void setTitle(String value) {
    _title = value.trim();
  }
}
