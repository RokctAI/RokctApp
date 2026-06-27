import 'package:rokctapp/core/infrastructure/utils/api_result.dart';
import '../../models/customer/wallet_histories_response.dart';

abstract class WalletRepository {
  Future<ApiResult<WalletHistoriesResponse>> getWalletHistories(int page);
  
  Future<ApiResult<bool>> sendWallet({
    required String uuid,
    required num price,
  });

  Future<ApiResult<String>> paymentWalletWebView({
    required String name,
    required num price,
  });
}
