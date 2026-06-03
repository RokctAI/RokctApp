# API Reference: ai_translation_notifier

Source file: `lib/manager/application/ai_translation/ai_translation_notifier.dart`

## Classes

### class `AiTranslationNotifier`

## Whitelisted API Endpoints

### `AiTranslationState()); Future<void> getAiTranslation({ required AiTranslationRequest model, ValueChanged<String?>? onSuccess, }) async { state = state.copyWith(isLoading: true); final response = await managerSettingsRepository.getAiTranslation( model: model, ); response.when( success: (data)`
*No documentation provided (generation failed).*

### `setLanguage(LanguageData language)`
*No documentation provided (generation failed).*

### `setTranslatedUsingAi(bool value)`
*No documentation provided (generation failed).*
