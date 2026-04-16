import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rokctapp/core/application/auth/register/register_notifier.dart';
import 'package:rokctapp/core/application/auth/register/register_state.dart';

final registerProvider = NotifierProvider<RegisterNotifier, RegisterState>(
  () => RegisterNotifier(),
);
