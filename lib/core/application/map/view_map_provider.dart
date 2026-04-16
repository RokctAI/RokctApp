import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rokctapp/core/application/map/view_map_notifier.dart';
import 'package:rokctapp/core/application/map/view_map_state.dart';

final viewMapProvider = NotifierProvider<ViewMapNotifier, ViewMapState>(
  () => ViewMapNotifier(),
);
