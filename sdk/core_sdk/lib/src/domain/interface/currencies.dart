import 'package:core_sdk/src/models/models.dart';
import 'package:core_sdk/core_sdk.dart';

abstract class CurrenciesRepositoryFacade {
  Future<ApiResult<CurrenciesResponse>> getCurrencies();
}

