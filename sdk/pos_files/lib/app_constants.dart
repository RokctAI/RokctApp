abstract class AppConstants {
  AppConstants._();

  static const String baseUrl = String.fromEnvironment('BASE_URL');
  static const String webUrl = String.fromEnvironment('WEB_URL');

  static const bool autoTrn = bool.fromEnvironment('AUTO_TRN');
  static const bool isDemo = bool.fromEnvironment('IS_DEMO');

  static bool playMusicOnOrderStatusChange = true;
  static bool keepPlayingOnNewOrder = false;

  static const String demoSellerLogin = String.fromEnvironment(
    'DEMO_SELLER_LOGIN',
  );
  static const String demoSellerPassword = String.fromEnvironment(
    'DEMO_SELLER_PASSWORD',
  );
  static const String demoCookerLogin = String.fromEnvironment(
    'DEMO_COOKER_LOGIN',
  );
  static const String demoCookerPassword = String.fromEnvironment(
    'DEMO_COOKER_PASSWORD',
  );
  static const String demoWaiterLogin = String.fromEnvironment(
    'DEMO_WAITER_LOGIN',
  );
  static const String demoWaiterPassword = String.fromEnvironment(
    'DEMO_WAITER_PASSWORD',
  );

  static const Duration refreshTime = Duration(seconds: 10);
  static final double demoLatitude = double.parse(
    const String.fromEnvironment('DEMO_LATITUDE'),
  );
  static final double demoLongitude = double.parse(
    const String.fromEnvironment('DEMO_LONGITUDE'),
  );
  static const double pinLoadingMin = 0.116666667;
  static const double pinLoadingMax = 0.611111111;
  static const Duration animationDuration = Duration(milliseconds: 375);

  static const double radius = 12;
}
