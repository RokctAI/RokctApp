import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rokctapp/customer/application/help/help_notifier.dart';
import 'package:rokctapp/customer/application/help/help_state.dart';

final helpProvider = NotifierProvider<HelpNotifier, HelpState>(
  () => HelpNotifier(),
);
