import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:core_sdk/core_sdk.dart';

part 'section_state.freezed.dart';

@freezed
sealed class SectionState with _$SectionState {
  const factory SectionState({
    @Default([]) List<MerchantSection> sections,
    @Default(0) int selectedIndex,
    @Default(false) bool isLoading,
    MerchantSection? selectSection,
    TextEditingController? textController,
  }) = _SectionState;

  const SectionState._();
}

