import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:core_sdk/core_sdk.dart';

part 'order_address_state.freezed.dart';

@freezed
sealed class OrderAddressState with _$OrderAddressState {
  const factory OrderAddressState({
    TextEditingController? textController,
    LocationData? location,
    @Default('') String entrance,
    @Default('') String floor,
    @Default('') String house,
  }) = _OrderAddressState;

  const OrderAddressState._();
}

