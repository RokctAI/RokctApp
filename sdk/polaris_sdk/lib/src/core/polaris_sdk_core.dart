import 'package:flutter/foundation.dart';
import 'package:polaris_sdk/src/models/customer/polaris_models.dart';
import '../domain/bridges/polaris_wallet_bridge.dart';
import '../domain/interface/polaris_repository_facade.dart';
import 'package:get_it/get_it.dart';

class PolarisSDK {
  // Singleton instance
  static final PolarisSDK _instance = PolarisSDK._internal();
  static PolarisSDK get instance => _instance;

  PolarisSDK._internal();

  bool _initialized = false;
  late PolarisConfig _config;
  late PolarisSession _session;
  late PolarisWalletBridge _walletBridge;
  late PolarisUserPrefill _userPrefill;
  late PolarisRepositoryFacade _repository;

  bool get isInitialized => _initialized;
  PolarisConfig get config => _config;
  PolarisSession get session => _session;
  PolarisWalletBridge get walletBridge => _walletBridge;
  PolarisUserPrefill get userPrefill => _userPrefill;
  PolarisRepositoryFacade get repository => _repository;

  static void initialize({
    required PolarisConfig config,
    required PolarisSession session,
    required PolarisWalletBridge walletBridge,
    required PolarisUserPrefill userPrefill,
    PolarisRepositoryFacade? repository,
  }) {
    _instance._config = config;
    _instance._session = session;
    _instance._walletBridge = walletBridge;
    _instance._userPrefill = userPrefill;
    _instance._repository =
        repository ?? GetIt.instance<PolarisRepositoryFacade>();
    _instance._initialized = true;
  }

  void onSessionChanged(PolarisSession newSession) {
    if (!_initialized) {
      debugPrint('PolarisSDK not initialized, ignoring session change.');
      return;
    }
    _session = newSession;
  }

  void reset() {
    _initialized = false;
    // We could clear out references here, but not strictly necessary if re-initialized later
  }
}
