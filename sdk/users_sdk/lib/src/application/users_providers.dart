import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/interface/user_repository_facade.dart';

final userRepositoryProvider = Provider<UserRepositoryFacade>((ref) => throw UnimplementedError());
final settingsRepositoryProvider = Provider<dynamic>((ref) => throw UnimplementedError());

final logoutNavigationProvider = Provider<void Function(BuildContext)>((ref) => throw UnimplementedError());

// LocalStorage helpers for UserRepository
final getSelectedCurrencyProvider = Provider<dynamic Function()>((ref) => throw UnimplementedError());
final logoutStorageProvider = Provider<Future<void> Function()>((ref) => throw UnimplementedError());
final galleryRepositoryProvider = Provider<dynamic>((ref) => throw UnimplementedError());
final shopsRepositoryProvider = Provider<dynamic>((ref) => throw UnimplementedError());

