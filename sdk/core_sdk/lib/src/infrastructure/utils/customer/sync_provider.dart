import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rokctapp/core/domain/di/dependency_manager.dart';
import 'package:core_sdk/core_sdk.dart';
import 'package:core_sdk/core_sdk.dart';

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});

final backgroundSyncServiceProvider = Provider<BackgroundSyncService>((ref) {
  final database = ref.watch(appDatabaseProvider);
  return BackgroundSyncService(
    database: database,
    httpService: dioHttp, // From DependencyManager
  );
});
