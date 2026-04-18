import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:rokctapp/driver/infrastructure/models/models.dart';

part 'app_state.freezed.dart';

@freezed
sealed class AppState with _$AppState {
  const factory AppState({LanguageData? activeLanguage}) = _AppState;

  const AppState._();
}
