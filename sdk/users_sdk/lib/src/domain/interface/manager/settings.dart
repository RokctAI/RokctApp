import 'package:core_sdk/core_sdk.dart';
import 'package:merchants_sdk/merchants_sdk.dart';
import 'package:merchants_sdk/merchants_sdk.dart';

abstract class SettingsInterface {
  Future<ApiResult<GalleryUploadResponse>> uploadImage(
    String filePath,
    UploadType uploadType,
  );

  Future<ApiResult<MultiGalleryUploadResponse>> uploadMultiImage(
    List<String?> filePaths,
    UploadType uploadType,
  );

  Future<ApiResult<CurrenciesResponse>> getCurrencies();

  Future<ApiResult<SettingsResponse>> getGlobalSettings();

  Future<ApiResult<TranslationsResponse>> getTranslations();

  Future<ApiResult<LanguagesResponse>> getLanguages();

  Future<ApiResult<AiTranslationResponse>> getAiTranslation({
    required AiTranslationRequest model,
  });
}
