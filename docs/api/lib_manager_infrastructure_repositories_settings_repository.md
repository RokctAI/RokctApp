# API Reference: settings_repository

Source file: `lib/manager/infrastructure/repositories/settings_repository.dart`

## Classes

### class `SettingsRepository`

## Whitelisted API Endpoints

### `uploadImage(String filePath, UploadType uploadType, ) async { String type = ''; switch (uploadType)`
*No documentation provided (generation failed).*

### `Duration(seconds: 30); client.options.receiveTimeout = const Duration(seconds: 30); final response = await client.post( '/api/v1/dashboard/galleries', data: data, ); return ApiResult.success( data: GalleryUploadResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `uploadMultiImage(List<String?> filePaths, UploadType uploadType, ) async { String type = ''; switch (uploadType)`
*No documentation provided (generation failed).*

### `Duration(seconds: 30); client.options.receiveTimeout = const Duration(seconds: 30); final response = await client.post( '/api/v1/dashboard/galleries/store-many', data: data, ); return ApiResult.success( data: MultiGalleryUploadResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `getCurrencies() async { try { final client = dioHttp.client(requireAuth: false); client.options.connectTimeout = const Duration(seconds: 30); client.options.receiveTimeout = const Duration(seconds: 30); final response = await client.get('/api/v1/rest/currencies'); return ApiResult.success( data: CurrenciesResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `getGlobalSettings() async { try { final client = dioHttp.client(requireAuth: false); client.options.connectTimeout = const Duration(seconds: 30); client.options.receiveTimeout = const Duration(seconds: 30); final response = await client.get('/api/v1/rest/settings'); return ApiResult.success(data: SettingsResponse.fromJson(response.data)); } catch (e)`
*No documentation provided (generation failed).*

### `getTranslations() async { final data = {'lang': LocalStorage.getLanguage()?.locale ?? 'en'}; try { final client = dioHttp.client(requireAuth: false); client.options.connectTimeout = const Duration(seconds: 30); client.options.receiveTimeout = const Duration(seconds: 30); final response = await client.get( '/api/v1/rest/translations/paginate', queryParameters: data, ); return ApiResult.success( data: TranslationsResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `getLanguages() async { try { final client = dioHttp.client(requireAuth: false); client.options.connectTimeout = const Duration(seconds: 30); client.options.receiveTimeout = const Duration(seconds: 30); final response = await client.get('/api/v1/rest/languages/active'); final languagesResponse = LanguagesResponse.fromJson(response.data); if (LocalStorage.getLanguage() != null && !(languagesResponse.data ?.map((e) => e.id) .contains(LocalStorage.getLanguage()?.id) ?? true))`
*No documentation provided (generation failed).*

### `getAiTranslation({ required AiTranslationRequest model, }) async { debugPrint('==> get ai translation request: ${jsonEncode(model.toJson())}'); final client = dioHttp.client(requireAuth: true); try { final response = await client.post( '/api/v1/dashboard/seller/ai-translations', data: model.toJson(), ); return ApiResult.success( data: AiTranslationResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*
