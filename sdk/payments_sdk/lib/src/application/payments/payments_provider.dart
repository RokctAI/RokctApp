import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/interface/payment_facade.dart';
import 'payments_state.dart';
import 'payments_notifier.dart';

final paymentsRepositoryProvider = Provider<PaymentsFacade>((ref) => throw UnimplementedError());
final connectivityProvider = Provider<Future<bool> Function()>((ref) => throw UnimplementedError());
final snackBarProvider = Provider<void Function(BuildContext, String)>((ref) => throw UnimplementedError());
final noConnectionSnackBarProvider = Provider<void Function(BuildContext)>((ref) => throw UnimplementedError());
final translationProvider = Provider<String Function(String)>((ref) => throw UnimplementedError());

final paymentProvider = NotifierProvider<PaymentNotifier, PaymentState>(() => PaymentNotifier());
