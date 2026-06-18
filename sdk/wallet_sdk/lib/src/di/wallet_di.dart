import 'package:get_it/get_it.dart';
import '../../wallet_sdk.dart';
import 'package:rokctapp/customer/repository/payments_repository.dart';
import 'package:rokctapp/manager/infrastructure/repositories/payments_repository.dart' as manager_payment_impl;

class WalletSdkDependencies {
  static void register(GetIt getIt) {
    getIt.registerSingleton<PaymentsRepositoryFacade>(PaymentsRepository());
    getIt.registerSingleton<PaymentsFacade>(manager_payment_impl.PaymentRepository());
  }
}
