import 'package:delivery_sdk/delivery_sdk.dart';
import 'package:delivery_sdk/delivery_sdk.dart';
import 'package:core_sdk/core_sdk.dart';

abstract class DriverSettingsRepository {
  Future<ApiResult<GalleryUploadResponse>> uploadImage(
    String filePath,
    UploadType uploadType,
  );

  Future<ApiResult<CurrenciesResponse>> getCurrencies();

  Future<ApiResult<SettingsResponse>> getGlobalSettings();

  Future<ApiResult<TranslationsResponse>> getTranslations();

  Future<ApiResult<LanguagesResponse>> getLanguages();
}
