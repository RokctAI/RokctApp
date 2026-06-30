import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merchants_sdk/merchants_sdk.dart';
import 'package:merchants_sdk/merchants_sdk.dart';
import 'package:merchants_sdk/src/presentation/pages/add_address.dart';
import 'package:merchants_sdk/src/application/map/view_map_state.dart';

class ViewMapNotifier extends StateNotifier<ViewMapState> {
  ViewMapNotifier() : super(const ViewMapState());

  void changePlace(AddressData place) {
    state = state.copyWith(place: place, isSetAddress: true);
  }

  void checkAddress(BuildContext context) {
    AddressData? data = LocalStorage.getAddressSelected();
    if (data == null) {
      state = state.copyWith(isSetAddress: false);
      AppHelpers.showAlertDialog(context: context, child: const AddAddress());
    } else {
      state = state.copyWith(isSetAddress: true);
    }
  }

  void updateActive() {
    state = state.copyWith(isLoading: true);
  }
}

