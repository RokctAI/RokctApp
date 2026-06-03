# API Reference: language_notifier

Source file: `lib/core/application/language/language_notifier.dart`

## Classes

### class `LanguageNotifier`

## Whitelisted API Endpoints

### `build() => const LanguageState(); void change(int index)`
*No documentation provided (generation failed).*

### `getLanguages(BuildContext context) async { final connect = await AppConnectivity.connectivity(); if (connect)`
*No documentation provided (generation failed).*

### `makeSelectedLang(BuildContext context, { Function(LanguageData?)? afterUpdate, }) async { LocalStorage.setLanguageSelected(true); final selected = state.list[state.index]; LocalStorage.setLanguageData(selected); LocalStorage.setLangLtr(selected.backward); if (afterUpdate != null)`
*No documentation provided (generation failed).*

### `getTranslations(context); } Future<void> getTranslations(BuildContext context) async { final connect = await AppConnectivity.connectivity(); if (connect)`
*No documentation provided (generation failed).*
