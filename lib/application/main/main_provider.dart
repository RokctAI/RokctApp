import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rokctapp/application/main/main_notifier.dart';
import 'package:rokctapp/application/main/main_state.dart';

final mainProvider = NotifierProvider<MainNotifier, MainState>(
  () => MainNotifier(),
);
