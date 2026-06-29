import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:delivery_sdk/delivery_sdk.dart';
import 'package:delivery_sdk/delivery_sdk.dart';
import 'package:rokctapp/driver/application/app/app_state.dart';

class AppNotifier extends StateNotifier<AppState> {
  AppNotifier() : super(const AppState()) {
    fetchThemeAndLocale();
  }

  void fetchThemeAndLocale() {
    final lang = LocalStorage.getLanguage();
    state = state.copyWith(activeLanguage: lang);
  }

  void changeLanguage(LanguageData? language) {
    state = state.copyWith(activeLanguage: language);
  }
}
