import 'package:rokctapp/core/domain/di/dependency_manager.dart';

// No longer defines setUpDependencies - it is now part of the core setup.

// Export the driver-specific variables with their original names for backward compatibility
final authRepository = driverAuthRepository;
final settingsRepository = driverSettingsRepository;
final userRepository = driverUserRepository;
final drawRepository = driverDrawRepository;
final orderRepository = driverOrdersRepository;
final parcelRepository = driverParcelRepository;
final notificationRepo = driverNotificationRepo;
