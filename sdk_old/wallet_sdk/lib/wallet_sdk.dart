import 'package:get_it/get_it.dart';
library wallet_sdk;

export 'src/models/data/wallet_models.dart';
export 'src/models/response/income_statistic_response.dart';
export 'src/wallet_repository.dart';
export 'src/wallet_sdk_impl.dart';
export 'src/application/payment_provider.dart';
export 'src/application/payment_state.dart';


// Domain Interfaces
export 'src/domain/interface/payments.dart';
export 'src/domain/interface/manager_payment_facade.dart';

export 'src/di/wallet_di.dart';

// Global DI Getters
PaymentsRepositoryFacade get walletRepository => GetIt.instance.get<PaymentsRepositoryFacade>();
PaymentsFacade get managerPaymentsRepository => GetIt.instance.get<PaymentsFacade>();
