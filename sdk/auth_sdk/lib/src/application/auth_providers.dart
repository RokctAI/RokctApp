import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/interface/auth_repository_facade.dart';
import 'package:users_sdk/users_sdk.dart';

final authRepositoryProvider = Provider<AuthRepositoryFacade>((ref) => throw UnimplementedError());

final fetchMyShopProvider = Provider<void Function({required VoidCallback afterFetched})>((ref) => throw UnimplementedError());
final authNavigationProvider = Provider<void Function(BuildContext, dynamic)>((ref) => throw UnimplementedError());

// Firebase overrides specific to Auth
final firebaseSocialLoginProvider = Provider<Future<dynamic> Function(BuildContext, IconData)>((ref) => throw UnimplementedError());
final firebaseSendOtpProvider = Provider<Future<void> Function({required String phone, required Function(String) onSuccess, required Function(String) onError})>((ref) => throw UnimplementedError());
final firebaseVerifyPhoneProvider = Provider<Future<void> Function({required BuildContext context, required String smsCode, required String verificationId, required VoidCallback onSuccess, required VoidCallback onError})>((ref) => throw UnimplementedError());
final isPhoneFirebaseProvider = Provider<bool>((ref) => throw UnimplementedError());
final getFlavorProvider = Provider<String Function()>((ref) => throw UnimplementedError());


