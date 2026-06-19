abstract class AppConstants {
  AppConstants._();

  static const String baseUrl = String.fromEnvironment('BASE_URL');
  static const String adminPageUrl = String.fromEnvironment('ADMIN_URL');
  static String webUrl = const String.fromEnvironment('WEB_URL');

  static bool autoTrn = const bool.fromEnvironment('AUTO_TRN');
  static const bool isDemo = bool.fromEnvironment('IS_DEMO');

  static bool playMusicOnOrderStatusChange = true;
  static bool keepPlayingOnNewOrder = true;

  static String demoSellerLogin = const String.fromEnvironment(
    'DEMO_SELLER_LOGIN',
  );
  static String demoSellerPassword = const String.fromEnvironment(
    'DEMO_SELLER_PASSWORD',
  );
  static String demoCookerLogin = const String.fromEnvironment(
    'DEMO_COOKER_LOGIN',
  );
  static String demoCookerPassword = const String.fromEnvironment(
    'DEMO_COOKER_PASSWORD',
  );
  static String demoWaiterLogin = const String.fromEnvironment(
    'DEMO_WAITER_LOGIN',
  );
  static String demoWaiterPassword = const String.fromEnvironment(
    'DEMO_WAITER_PASSWORD',
  );

  static Duration refreshTime = const Duration(seconds: 10);
  static double demoLatitude = double.parse(
    const String.fromEnvironment('DEMO_LATITUDE'),
  );
  static double demoLongitude = double.parse(
    const String.fromEnvironment('DEMO_LONGITUDE'),
  );
  static double pinLoadingMin = 0.116666667;
  static double pinLoadingMax = 0.611111111;
  static Duration animationDuration = const Duration(milliseconds: 375);
  static Duration weatherRefresher = const Duration(minutes: 360);

  static double radius = 12;

  /// JuvoONE
  static String keyShopData = 'keyShopData';
  static bool autoDeliver = false;
  static bool secondScreen = false;
  static bool enableJuvoONE = true;
  static bool skipPin = false;
  static bool useDummyDataFallback = true;
  static bool enableOfflineMode = true;
  static bool sound = true;
  //After this period the app on Desktop goes to Idle, it shows the Dashboard
  static Duration idleTimeout = const Duration(minutes: 15);
  static Duration fetchTime = const Duration(seconds: 60);
  static Duration dashboardFetchTime = const Duration(minutes: 45);
  static String googleApiKey = const String.fromEnvironment(
    'GOOGLE_MAPS_API_KEY',
  );
  static bool weatherIcon = true;
  static int rainPOP = 60;
  static String chatGpt = const String.fromEnvironment('CHAT_GPT_KEY');

  /// Optimized stock ids
  static final OptimizedStockIds stockIds = OptimizedStockIds();

  static const String terminal = 'terminal';
  static const String terminalPayment = 'terminal_payment';
  static const String processingPayment = 'processing_payment';
  static const String paymentComplete = 'payment_complete';
  static const String paymentFailed = 'payment_failed';

  // Yoco credentials (Mutable for Remote Config, sourced from Shared Environment)
  static String yocoPublicKey = const String.fromEnvironment('YOCO_PUBLIC_KEY');
  static String yocoPrivateKey = const String.fromEnvironment(
    'YOCO_PRIVATE_KEY',
  );
  static String yocoEnvironment = const String.fromEnvironment(
    'YOCO_ENVIRONMENT',
  );

  // Yoco test credentials (sourced from Shared Environment)
  static String yocoTestPublicKey = const String.fromEnvironment(
    'YOCO_TEST_PUBLIC_KEY',
  );
  static String yocoTestPrivateKey = const String.fromEnvironment(
    'YOCO_TEST_PRIVATE_KEY',
  );

  ///OrderUsageDate
  static String dateAt = 'createdAt';

  ///QuickSale
  // Comma-separated list of stock IDs for no-user mode
  static List<int> quickSaleNoUserStockIds = [669, 670, 671, 672, 668];
  // Default quantity for quick sale orders
  static int quickSaleDefaultQuantity = 1;
  // Maximum number of taps for user mode (for coupon)
  static int quickSaleCouponTapCount = 4;
  // Stock ID for regular user mode
  static int quickSaleStockId = 672;
  // Coupon code to apply when tap count reaches maximum in user mode
  static String quickSaleCouponCode = "FREE25";

  /// Maintenance constants
  // Maintenance check intervals (in days)
  static int maintenanceCheckDays = 7;
  static int preFilterReplaceDays = 30;
  static int postFilterReplaceDays = 90;
  static int roFilterReplaceDays = 180;
  static int vesselReplaceDays = 365;
  static int roMembraneReplaceDays = 365;

  // Maintenance procedure durations (in minutes)
  static Map<String, int> megaCharMaintenanceDurations = {
    'initialCheck': 0,
    'pressureRelease': 2,
    'backwash': 10,
    'settling': 2,
    'fastWash': 10,
    'stabilization': 2,
    'returnToFilter': 0,
  };

  static Map<String, int> softenerMaintenanceDurations = {
    'initialCheck': 0,
    'pressureRelease': 2,
    'backwash': 10,
    'settling': 2,
    'brineAndSlowRinse': 30,
    'fastRinse': 10,
    'brineRefill': 5,
    'stabilization': 2,
    'returnToService': 0,
  };

  static Map<String, String> maintenanceTypes = {
    'megaChar': 'Megachar',
    'softener': 'Softener',
    'preFilter': 'Pre Filter',
    'roFilter': 'RO Filter',
    'postFilter': 'Post Filter',
    'roMembrane': 'RO Membrane',
  };

  static Map<String, String> filterTypes = {
    'birm': 'Birm',
    'sediment': 'Sediment',
    'carbonBlock': 'Carbon Block/CTO',
  };
}

class OptimizedStockIds {
  static final Map<String, int> _optimizedStockIds = {
    '672, 295, 303': 25,
    '671, 293, 301': 20,
    '670, 291, 299': 10,
    '669, 281, 297, 298': 5,
    '668': 3,
  };

  int? operator [](String prop) {
    for (final entry in _optimizedStockIds.entries) {
      if (entry.key.split(', ').contains(prop)) {
        return entry.value;
      }
    }
    return null; // or a default value
  }
}
