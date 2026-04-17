import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/infrastructure/services/services.dart';
import 'package:rokctapp/manager/application/main/foods/extras/details/delete_item/delete_extras_item_state.dart';
import 'package:rokctapp/domain/interface/interfaces.dart';

class DeleteExtrasItemNotifier extends StateNotifier<DeleteExtrasItemState> {
  final ProductsInterface _productsRepository;

  DeleteExtrasItemNotifier(this._productsRepository)
    : super(const DeleteExtrasItemState());

  Future<void> deleteExtrasItem(
    BuildContext context, {
    VoidCallback? success,
    int? extrasId,
  }) async {
    state = state.copyWith(isLoading: true);
    final response = await _productsRepository.deleteExtrasItem(
      extrasId: extrasId ?? 0,
    );
    response.when(
      success: (data) {
        state = state.copyWith(isLoading: false);
        success?.call();
      },
      failure: (fail, status) {
        debugPrint('===> delete extras item fail $fail');
        state = state.copyWith(isLoading: false);
        AppHelpers.showCheckTopSnackBar(
          context,
          text: fail,
          type: SnackBarType.error,
        );
      },
    );
  }
}
