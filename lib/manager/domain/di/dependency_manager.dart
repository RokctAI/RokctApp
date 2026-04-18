import 'package:rokctapp/core/domain/di/dependency_manager.dart';

// No longer defines setUpDependencies - it is now part of the core setup.

// Export the manager-specific variables with their original names for backward compatibility
final translation = coreTranslation; // Note: if core has translation, we use that
final authRepository = managerAuthRepository;
final shopsRepository = managerShopsRepository;
final tableRepository = managerTableRepository;
final usersRepository = managerUsersRepository;
final ordersRepository = managerOrdersRepository;
final catalogRepository = managerCatalogRepository;
final productRepository = managerProductRepository;
final settingsRepository = managerSettingsRepository;
final notificationRepository = managerNotificationRepository;
final subscriptionRepository = managerSubscriptionRepository;
final paymentRepositoryNew = managerPaymentRepositoryNew;

// Helper to provide core translation if needed
final coreTranslation = getIt.get<Map>();
