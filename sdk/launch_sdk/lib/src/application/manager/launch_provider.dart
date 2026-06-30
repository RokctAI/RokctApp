import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:launch_sdk/src/infrastructure/repositories/launch_repository.dart';
import 'launch_notifier.dart';
import 'launch_state.dart';

final launchRepositoryProvider = Provider<LaunchRepository>((ref) {
  return LaunchRepository();
});

final launchProvider =
    StateNotifierProvider<LaunchNotifier, LaunchState>((ref) {
  final repository = ref.watch(launchRepositoryProvider);
  return LaunchNotifier(repository);
});
