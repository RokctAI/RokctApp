import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:merchants_sdk/src/application/map/view_map_notifier.dart';
import 'package:merchants_sdk/src/application/map/view_map_state.dart';

final viewMapProvider = StateNotifierProvider<ViewMapNotifier, ViewMapState>(
  (ref) => ViewMapNotifier(),
);

