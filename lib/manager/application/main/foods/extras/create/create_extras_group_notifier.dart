import 'package:flutter/material.dart';
import 'package:rokctapp/core/domain/handlers/handlers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/manager/infrastructure/services/services.dart';
import 'package:rokctapp/manager/application/main/foods/extras/create/create_extras_group_state.dart';
import 'package:rokctapp/manager/domain/interface/interfaces.dart';

class CreateExtrasGroupNotifier
    extends AutoDisposeNotifier<CreateExtrasGroupState> {
  final ProductsInterface _productsRepository;
  String _title = '';

  CreateExtrasGroupNotifier(this._productsRepository)
    : super(const CreateExtrasGroupState());

  Future<void> createExtrasGroup(
    BuildContext context, {
    VoidCallback? success,
  }) async {
    state = state.copyWith(isLoading: true);
    final response = await _productsRepository.createExtrasGroup(title: _title);
    response.when(
      success: (data) {
        state = state.copyWith(isLoading: false);
        success?.call();
      },
      f: (f, s) {
        debugPrint('===> create extras group f $f');
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
