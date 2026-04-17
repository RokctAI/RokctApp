import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rokctapp/application/auth/confirmation/register_confirmation_notifier.dart';
import 'package:rokctapp/application/auth/confirmation/register_confirmation_state.dart';

final registerConfirmationProvider =
    NotifierProvider.autoDispose<
      RegisterConfirmationNotifier,
      RegisterConfirmationState
    >(() => RegisterConfirmationNotifier());
