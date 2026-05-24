# Offline-First Implementation Guide Based on Spazafy Experience

## Overview
This guide details the offline-first approach successfully implemented in the Spazafy project (the first attempt at merging 3 apps). The goal is to ensure the application remains functional and provides a seamless user experience even when network connectivity is unavailable or unreliable.

**Important Notes for RokctApp Implementation:**
- RokctApp already has a local storage implementation in `lib/core/local_storage.dart` and role-specific extensions
- Some Spazafy patterns need adaptation for RokctApp's modular structure
- Certain features in both apps remain online-only by design
- RokctApp has migrated from int-based IDs to string-based IDs in several areas

## Key Differences: Spazafy vs RokctApp

### 1. Online-Only Features (Present in Both Apps)
Based on code review, these features require connectivity and don't work offline:
- **Real-time location sharing**: Background location updates require API calls
- **Instant messaging/chat features**: Require WebSocket or API connections
- **Live order tracking**: Depends on server-sent events or polling
- **Payment processing**: Requires communication with payment gateways
- **Real-time inventory updates**: Need server synchronization
- **Authentication with server**: Initial login/token refresh requires API calls
- **Feature flags/remote config**: Fetched from server
- **Analytics/reporting**: Sent to analytics endpoints

### 2. Data Type Changes (int to string)
RokctApp has migrated from integer IDs to string IDs in several areas:
- User IDs, shop IDs, product IDs are now strings instead of integers
- This affects API payloads, database storage, and local caching
- String IDs provide better flexibility for UUIDs, slugs, or external system IDs
- Requires updates to:
  - Local storage serialization/deserialization
  - API request/response models
  - Database schemas (if using local DB)
  - Equality checks and comparisons

## Updated Implementation Recommendations for RokctApp

### 1. Leverage Existing Storage Infrastructure
RokctApp already has:
- Core local storage (`lib/core/local_storage.dart`)
- Role-specific storage extensions (driver, manager, etc.)
- Use these as foundation rather than reimplementing

### 2. Enhance Current Storage with Offline Queues
Add to existing storage:
```dart
// Add to CoreLocalStorage or role-specific storage
static Future<void> setOfflineQueue(List<dynamic> items) async {
  await preferences?.setStringList(
    StorageKeys.keyOfflineQueue, 
    items.map((item) => jsonEncode(item)).toList()
  );
}

static List<dynamic> getOfflineQueue() {
  final List<String> strings = 
      preferences?.getStringList(StorageKeys.keyOfflineQueue) ?? [];
  return strings.map((s) => jsonDecode(s)).toList();
}
```

### 3. Improve Background Processing
Current RokctApp background processing:
- Only runs every 15 minutes (minimum allowed)
- Consider implementing connectivity-triggered immediate sync
- Add retry mechanisms with exponential backoff

### 4. Handle String ID Migration
When implementing offline storage:
- Ensure all ID fields are stored as strings
- Update JSON serialization to handle string IDs
- Modify API clients to send/receive string IDs
- Update any local database schemas if used

### 5. Online-Only Feature Management
Implement graceful degradation:
- Detect connectivity before attempting online operations
- Queue operations that fail due to no connectivity
- Show appropriate UI states for offline vs online features
- Provide clear user feedback when features are unavailable

## Critical Files in RokctApp for Offline-First

### Storage Layer
- `lib/core/local_storage.dart` - Core storage implementation
- `lib/driver/infrastructure/services/local_storage.dart` - Driver-specific storage
- `lib/manager/infrastructure/services/local_storage.dart` - Manager-specific storage
- `lib/customer/infrastructure/services/local_storage.dart` - Customer-specific storage (if exists)

### App Initialization
- `lib/main.dart` - Main entry point with background task setup

### Connectivity Checking
- Check for `AppConnectivity` or similar connectivity utility
- Look for connectivity checks in repository/service layers

### Background Processing
- Workmanager configuration in `main.dart`
- Callback dispatcher for background tasks

### Repository Layers
- Look for repository implementations that could benefit from offline caching
- Identify API call sites that need connectivity checks

This guide provides a foundation for implementing offline-first capabilities in RokctApp while respecting its existing architecture and addressing the specific considerations identified.

## Core Principles Implemented

### 1. Local Data Persistence Layer
- **SharedPreferences-based Storage**: Utilized `shared_preferences` package for lightweight, persistent storage of critical app data
- **Singleton Pattern**: Implemented `LocalStorage` as a singleton service with static methods for easy access throughout the app
- **Data Types Stored**:
  - Authentication tokens
  - User profiles (including driver-specific data)
  - Application settings and preferences
  - Address information and search history
  - Currency and language selections
  - Wallet and payment information
  - Offline user data queue
  - Sync error tracking
  - Theme and localization preferences

### 2. Background Processing Capabilities
- **Workmanager Integration**: Used `workmanager` plugin to execute periodic background tasks even when app is terminated
- **Entry Point Dispatcher**: Implemented `@pragma('vm:entry-point') callbackDispatcher()` to handle background task execution
- **Periodic Location Updates**: For driver role, registered background task to update location every 10 seconds
- **Background Message Handling**: Configured Firebase messaging to handle messages when app is in background/terminated state

### 3. Connectivity-Aware Operations
- **Pre-operation Connectivity Checks**: Before making API calls, check connectivity using `connectivity_plus` package
- **Conditional Data Fetching**: Only attempt to fetch settings/translations when online (mobile, ethernet, or wifi)
- **Graceful Degradation**: When offline, continue operating with locally cached data

### 4. Offline Data Queueing & Sync Mechanism
- **Offline User Storage**: Implemented `setOfflineUser()`/`getOfflineUser()` methods to store data that couldn't be sent due to connectivity issues
- **Sync Error Tracking**: Maintained sync error counts and last error messages for debugging and user feedback
- **Automatic Retry Logic**: Background workers automatically retry failed operations when connectivity is restored

### 5. Application Initialization & State Management
- **Splash Screen Preservation**: Used `flutter_native_splash` to maintain branding during initialization
- **Early Initialization**: Initialized Firebase, LocalStorage, and Workmanager before UI rendering
- **Role-Based Behavior**: Conditionally registered background tasks based on user role (e.g., only deliverymen get location updates)
- **Phoenix Widget Pattern**: Implemented crash recovery mechanism using `Phoenix` widget
- **App Initializer Widget**: Used custom initializer to handle async setup before main app widget builds

## Detailed Implementation Components

### 1. LocalStorage Service (`lib/infrastructure/services/utils/local_storage.dart`)
The core of the offline-first approach is this service which handles:

#### Initialization
```dart
static Future<void> init() async {
  _preferences = await SharedPreferences.getInstance();
}
```

#### Authentication Persistence
- Token storage/retrieval (`setToken`, `getToken`, `deleteToken`)
- User profile persistence (`setUser`, `getUser`, `getDriver`)
- Automatic re-authentication on app startup using stored tokens

#### Settings & Preferences
- UI type/theme preferences (`setUiType`, `getUiType`)
- Language selections (`setLanguageSelected`, `getLanguageSelected`)
- Currency preferences (`setSelectedCurrency`, `getSelectedCurrency`)
- Guest mode tracking (`setIsGuest`, `getIsGuest`)
- App theme mode (`setAppThemeMode`, `getAppThemeMode`)
- Settings fetch status (`setSettingsFetched`, `getSettingsFetched`)

#### Location & Address Data
- Selected address persistence (`setAddressSelected`, `getAddressSelected`)
- Address information storage (`setAddressInformation`, `getAddressInformation`)
- Search history management (`setSearchHistory`, `getSearchList`)
- Saved shops list (`setSavedShopsList`, `getSavedShopsList`)

#### Wallet & Payment Data
- Wallet data storage (`setWalletData`, `getWalletData`, `setWallet`, `getWallet`)
- Transaction history and payment method persistence

#### Offline Queue & Sync Tracking
```dart
// Store data for later sync when online
static Future<void> setOfflineUser(Map<String, dynamic>? data) async {
  await _preferences?.setString(StorageKeys.keyOfflineUser, jsonEncode(data));
}

static Map<String, dynamic>? getOfflineUser() {
  final data = _preferences?.getString(StorageKeys.keyOfflineUser);
  return data != null ? jsonDecode(data) : null;
}

// Track sync issues for debugging/user feedback
static Future<void> setSyncErrorCount(int count) async {
  await _preferences?.setInt('sync_error_count', count);
}

static int getSyncErrorCount() =>
    _preferences?.getInt('sync_error_count') ?? 0;
```

#### Cleanup Operations
- Comprehensive logout method that clears all persisted data
- Individual delete methods for each data type

### 2. Background Processing (`lib/main.dart`)
Key aspects of background task implementation:

#### Firebase Messaging Background Handler
```dart
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}
```

#### Workmanager Configuration
```dart
// Initialize workmanager with callback dispatcher
await Workmanager().initialize(callbackDispatcher);

// Register periodic task for location updates (deliverymen only)
Workmanager().registerPeriodicTask(
  'a',
  fetchBackground,
  frequency: const Duration(seconds: 10),
);
```

#### Background Task Callback
```dart
@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    switch (task) {
      case fetchBackground:
        await LocalStorage.init();
        // Get current location
        Position userLocation = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );
        
        // Prepare API client with auth token
        final Dio client = Dio(
          BaseOptions(
            headers: {
              'Authorization': "Bearer ${LocalStorage.getToken()}",
              // ... other headers
            },
          ),
        )..interceptors.add(LogInterceptor(...));
        
        // Send location data to server
        await client.post(
          '${global_constants.AppConstants.baseUrl}/api/v1/method/paas.api.driver.driver.update_location',
          data: {
            "location": LocalLocationData(
              latitude: userLocation.latitude,
              longitude: userLocation.longitude,
            ).toJson(),
          },
        );
        break;
    }
    return Future.value(true);
  });
}
```

### 3. Application Entry Point (`lib/main.dart`)
Critical initialization sequence for offline-first operation:

```dart
void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  
  // Initialize core services BEFORE UI rendering
  await Firebase.initializeApp();
  await LocalStorage.init();  // Critical for offline operation
  
  // Check user role and setup background processing
  final role = LocalStorage.getUser()?.role;
  if (role == 'deliveryman') {
    await Workmanager().initialize(callbackDispatcher);
    Workmanager().registerPeriodicTask(
      'a',
      fetchBackground,
      frequency: const Duration(seconds: 10),
    );
  }
  
  // Setup Firebase messaging for background messages
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  
  // System UI configurations
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  // ... other system configurations
  
  // Setup dependency injection
  setUpDependencies();
  
  // Run app with error recovery and initialization widgets
  runApp(
    ProviderScope(
      child: Phoenix(child: AppInitializerWidget(child: AppWidget())),
    ),
  );
}
```

### 4. Connectivity Checking (`lib/presentation/app_widget.dart`)
Smart data fetching based on network status:

```dart
Future fetchSetting() async {
  final connect = await Connectivity().checkConnectivity();
  if (connect.contains(ConnectivityResult.mobile) ||
      connect.contains(ConnectivityResult.ethernet) ||
      connect.contains(ConnectivityResult.wifi)) {
    // Only fetch when online
    settingsRepository.getGlobalSettings();
    await settingsRepository.getLanguages();
    await settingsRepository.getMobileTranslations();
  }
  // If offline, app continues with cached/local data
}
```

Used in build method:
```dart
FutureBuilder(
  future: Future.wait([
    FlutterDisplayMode.setHighRefreshRate(),
    if (LocalStorage.getTranslations().isEmpty) fetchSetting(),  // Only fetch if needed
  ]),
  // ...
)
```

### 5. Error Handling & Recovery
- **Phoenix Widget**: Automatic app restart after crashes
- **Sync Error Tracking**: Monitor and display sync issues to users
- **Fallback to Local Data**: When API calls fail, use locally cached data
- **Graceful Degradation**: Non-critical features disabled when offline but core functionality maintained

## Key Benefits Achieved

1. **Continuous Operation**: App functions fully offline with data entered locally syncing when connection restored
2. **Battery Efficient**: Background tasks only run when necessary (every 10 seconds for active drivers)
3. **Data Consistency**: Local storage serves as single source of truth with periodic sync to server
4. **User Trust**: Users aren't frustrated by connectivity issues as their work is preserved
5. **Reduced Server Load**: Intelligent syncing reduces unnecessary API calls
6. **Offline-First Mindset**: Architecture assumes offline state as default, online as enhancement

## Implementation Recommendations

For implementing offline-first in your current project:

1. **Start with Storage Layer**: Implement a robust local storage service early
2. **Identify Critical Data**: Determine what data must be available offline (auth, user profile, core settings)
3. **Implement Background Workers**: Use platform-appropriate background processing
4. **Add Connectivity Checks**: Wrap all API calls with connectivity verification
5. **Create Offline Queues**: Store operations that fail due to connectivity for later retry
6. **Handle Initialization Carefully**: Initialize storage before UI rendering
7. **Provide User Feedback**: Indicate online/offline status and sync progress
8. **Test Thoroughly**: Test scenarios like:
   - App launch offline
   - Going online/offline during use
   - Background sync when app is terminated
   - Data conflicts between local and server versions

## Files to Reference in Spazafy Implementation
- `lib/infrastructure/services/utils/local_storage.dart` - Core storage logic
- `lib/main.dart` - App initialization and background processing
- `lib/presentation/app_widget.dart` - Connectivity-aware data fetching
- `lib/app_constants.dart` - Configuration and constants
- `lib/presentation/theme/theme.dart` and `app_style.dart` - UI theming that respects offline/online states

This approach ensured the Spazafy application remained functional and user-friendly regardless of network conditions, providing a true offline-first experience that synchronized seamlessly when connectivity was restored.