import 'package:flutter/material.dart';
import 'package:rokctapp/core/domain/handlers/handlers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/manager/application/main/foods/extras/details/extras_group_details_state.dart';
import 'package:rokctapp/manager/domain/interface/interfaces.dart';

class ExtrasGroupDetailsNotifier
    extends AutoDisposeNotifier<ExtrasGroupDetailsState> {
  final ProductsInterface _productsRepository;

  ExtrasGroupDetailsNotifier(this._productsRepository)
    : super(const ExtrasGroupDetailsState());

  Future<void> fetchGroupExtras({int? groupId}) async {
    state = state.copyWith(isLoading: true);
    final response = await _productsRepository.getExtras(groupId: groupId);
    response.when(
      success: (data) {
        state = state.copyWith(
          extras: data.data?.extraValues ?? [],
          isLoading: false,
        );
      },
      f: (f, s) {
        debugPrint('===> fetch extras f $f');
        state = state.copyWith(isLoading: false);
      },
    );
  }
}
