# API Reference: ai_translation_response

Source file: `lib/manager/infrastructure/models/response/ai_translation_response.dart`

## Classes

### class `AiTranslationResponse`

### class `AiTranslationData`

## Whitelisted API Endpoints

### `copyWith({ String? timestamp, bool? status, String? message, AiTranslationData? data, }) => AiTranslationResponse( timestamp: timestamp ?? _timestamp, status: status ?? _status, message: message ?? _message, data: data ?? _data, ); String? get timestamp => _timestamp; bool? get status => _status; String? get message => _message; AiTranslationData? get data => _data; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*

### `copyWith({String? title, String? description}) => AiTranslationData( title: title ?? _title, description: description ?? _description, ); String? get title => _title; String? get description => _description; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*
