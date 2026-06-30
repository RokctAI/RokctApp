import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:core_sdk/core_sdk.dart';
import 'package:delivery_sdk/src/application/parcel/parcel_notifier.dart';
import 'package:delivery_sdk/src/application/parcel/parcel_state.dart';

final parcelProvider = StateNotifierProvider<ParcelNotifier, ParcelState>(
  (ref) => ParcelNotifier(driverParcelRepository),
);

