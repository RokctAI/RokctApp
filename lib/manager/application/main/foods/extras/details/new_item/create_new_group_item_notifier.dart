import 'package:flutter/material.dart';
import 'package:rokctapp/core/domain/handlers/handlers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/manager/infrastructure/services/services.dart';
import 'package:rokctapp/manager/application/main/foods/extras/details/new_item/create_new_group_item_state.dart';
import 'package:rokctapp/manager/domain/interface/interfaces.dart';

class CreateNewGroupItemNotifier
    extends AutoDisposeNotifier<CreateNewGroupItemState> {
  final ProductsInterface _productsRepository;
  String _title = '';

  CreateNewGroupItemNotifier(this._productsRepository)
    : super(const CreateNewGroupItemState());

  Future<void> createExtrasItem(
    BuildContext context, {
    VoidCallback? success,
    int? groupId,
  }) async {
    state = state.copyWith(isLoading: true);
    final response = await _productsRepository.createExtrasItem(
      title: _title,
      groupId: groupId ?? 0,
    );
    response.when(
      success: (data) {
        state = state.copyWith(isLoading: false);
        success?.call();
      },
      f: (f, s) {
        debugPrint('===> create extras item f $f');
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
