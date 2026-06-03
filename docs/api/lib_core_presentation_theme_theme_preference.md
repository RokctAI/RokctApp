# API Reference: theme_preference

Source file: `lib/core/presentation/theme/theme_preference.dart`

## Classes

### class `ThemePreference`

## Whitelisted API Endpoints

### `setMode(CustomThemeMode mode) async { await _preferences.setString(ThemePreference.prefKey, mode.toKey); } Future<void> clean() async { await _preferences.clear(); } } extension CustomThemeModeX on CustomThemeMode { static const light = 'light'; static const dark = 'dark'; bool get isLight => this == CustomThemeMode.light; bool get isDark => this == CustomThemeMode.dark; String get toKey => toString().split('.')[1]; static CustomThemeMode toValue(String key)`
*No documentation provided (generation failed).*
