import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:core_sdk/src/application/map/view_map_notifier.dart';
import 'package:core_sdk/src/application/map/view_map_state.dart';

final viewMapProvider = NotifierProvider<ViewMapNotifier, ViewMapState>(
  () => ViewMapNotifier(),
);

