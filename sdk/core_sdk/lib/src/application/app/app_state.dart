import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rokctapp/customer/models/models.dart';

part 'app_state.freezed.dart';

@freezed
sealed class AppState with _$AppState {
  const factory AppState({
    @Default(false) bool isDarkMode,
    @Default(true) bool isLtr,
    LanguageData? activeLanguage,
  }) = _AppState;

  const AppState._();
}
