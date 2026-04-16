import 'package:rokctapp/core/infrastructure/models/models.dart';
import 'package:rokctapp/core/domain/handlers/handlers.dart';

abstract class CurrenciesRepositoryFacade {
  Future<ApiResult<CurrenciesResponse>> getCurrencies();
}
