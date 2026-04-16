import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rokctapp/core/application/floating_button/floating_notifier.dart';
import 'package:rokctapp/core/application/floating_button/floating_state.dart';

final floatingProvider = NotifierProvider<FloatingNotifier, FloatingState>(
  () => FloatingNotifier(),
);
