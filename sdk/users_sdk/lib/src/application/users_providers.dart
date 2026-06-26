import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import '../domain/interface/user_repository_facade.dart';

final userRepositoryProvider = Provider<UserRepositoryFacade>(
  (ref) => GetIt.instance<UserRepositoryFacade>(),
);
final settingsRepositoryProvider = Provider<dynamic>(
  (ref) => GetIt.instance<dynamic>(),
);

final logoutNavigationProvider = Provider<void Function(BuildContext)>(
  (ref) => GetIt.instance<void Function(BuildContext)>(),
);

// LocalStorage helpers for UserRepository
final getSelectedCurrencyProvider = Provider<dynamic Function()>(
  (ref) => GetIt.instance<dynamic Function>(),
);
final logoutStorageProvider = Provider<Future<void> Function()>(
  (ref) => GetIt.instance<Future<void> Function>(),
);
final galleryRepositoryProvider = Provider<dynamic>(
  (ref) => GetIt.instance<dynamic>(),
);
final shopsRepositoryProvider = Provider<dynamic>(
  (ref) => GetIt.instance<dynamic>(),
);
