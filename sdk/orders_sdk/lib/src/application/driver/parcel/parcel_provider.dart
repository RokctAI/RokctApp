import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/core/domain/di/dependency_manager.dart';
import 'package:orders_sdk/src/application/driver/parcel/parcel_notifier.dart';
import 'package:orders_sdk/src/application/driver/parcel/parcel_state.dart';

final parcelProvider = StateNotifierProvider<ParcelNotifier, ParcelState>(
  (ref) => ParcelNotifier(driverParcelRepository),
);
