import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:core_sdk/src/application/help/help_notifier.dart';
import 'package:core_sdk/src/application/help/help_state.dart';

final helpProvider = NotifierProvider<HelpNotifier, HelpState>(
  () => HelpNotifier(),
);

