import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:delivery_sdk/delivery_sdk.dart';

part 'app_state.freezed.dart';

@freezed
sealed class AppState with _$AppState {
  const factory AppState({LanguageData? activeLanguage}) = _AppState;

  const AppState._();
}
