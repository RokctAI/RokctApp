import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:core_sdk/src/application/language/language_notifier.dart';
import 'package:core_sdk/src/application/language/language_state.dart';

final languageProvider = NotifierProvider<LanguageNotifier, LanguageState>(
  () => LanguageNotifier(),
);

final languagesProvider = languageProvider;

