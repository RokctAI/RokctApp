import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:orders_sdk/src/application/manager/order/shipping/section/section_state.dart';
import 'package:orders_sdk/src/application/manager/order/shipping/section/section_notifier.dart';

final sectionProvider = StateNotifierProvider<SectionNotifier, SectionState>(
  (ref) => SectionNotifier(),
);
