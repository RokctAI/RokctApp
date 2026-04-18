import 'package:flutter/material.dart';
import 'package:rokctapp/core/domain/handlers/handlers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/manager/infrastructure/services/services.dart';
import 'package:rokctapp/manager/application/main/foods/extras/details/edit_item/edit_extras_item_state.dart';
import 'package:rokctapp/manager/domain/interface/interfaces.dart';

class EditExtrasItemNotifier extends AutoDisposeNotifier<EditExtrasItemState> {
  final ProductsInterface _productsRepository;
  String _title = '';

  EditExtrasItemNotifier(this._productsRepository)
    : super(const EditExtrasItemState());

  Future<void> updateExtrasItem(
    BuildContext context, {
    VoidCallback? success,
    int? groupId,
    int? extrasId,
  }) async {
    state = state.copyWith(isLoading: true);
    final response = await _productsRepository.updateExtrasItem(
      extrasId: extrasId ?? 0,
      title: _title,
      groupId: groupId ?? 0,
    );
    response.when(
      success: (data) {
        state = state.copyWith(isLoading: false);
        success?.call();
      },
      f: (f, s) {
        debugPrint('===> update extras item f $f');
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
