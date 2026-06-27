import 'package:core_sdk/src/infrastructure/utils/app_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final connectivityProvider = Provider<Future<bool> Function()>(
  (ref) => throw UnimplementedError(),
);
final snackBarProvider = Provider<void Function(BuildContext, String)>(
  (ref) => throw UnimplementedError(),
);
final noConnectionSnackBarProvider = Provider<void Function(BuildContext)>(
  (ref) => throw UnimplementedError(),
);
final translationProvider = Provider<String Function(String)>(
  (ref) => throw UnimplementedError(),
);

// Firebase overrides
final firebaseGetFcmTokenProvider = Provider<Future<String?> Function()>(
  (ref) => throw UnimplementedError(),
);

// LocalStorage overrides
final getLanguageProvider = Provider<dynamic Function()>(
  (ref) => throw UnimplementedError(),
);
final setUserProvider = Provider<Future<void> Function(dynamic)>(
  (ref) => throw UnimplementedError(),
);
final setTokenProvider = Provider<Future<void> Function(String)>(
  (ref) => throw UnimplementedError(),
);
final isTokenExpiredProvider = Provider<bool Function()>(
  (ref) => throw UnimplementedError(),
);
final setWalletProvider = Provider<Future<void> Function(dynamic)>(
  (ref) => throw UnimplementedError(),
);
final setAddressSelectedProvider = Provider<Future<void> Function(dynamic)>(
  (ref) => throw UnimplementedError(),
);
final getAddressSelectedProvider = Provider<dynamic Function()>(
  (ref) => throw UnimplementedError(),
);
final getTokenProvider = Provider<String Function()>(
  (ref) => throw UnimplementedError(),
);
final setWalletDataProvider = Provider<Future<void> Function(dynamic)>(
  (ref) => throw UnimplementedError(),
);
final urlToFileProvider = Provider<Future<dynamic> Function(String)>(
  (ref) => throw UnimplementedError(),
);

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});
