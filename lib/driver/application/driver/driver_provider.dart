import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/driver/application/driver/driver_notifier.dart';
import 'package:rokctapp/driver/application/driver/driver_state.dart';

final driverProvider = StateNotifierProvider<DriverNotifier, DriverState>(
  (ref) => DriverNotifier(),
);
