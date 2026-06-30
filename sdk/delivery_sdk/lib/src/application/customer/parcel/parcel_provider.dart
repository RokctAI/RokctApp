import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:core_sdk/src/application/parcel/parcel_notifier.dart';
import 'package:delivery_sdk/src/application/customer/parcel/parcel_state.dart';

final parcelProvider = NotifierProvider<ParcelNotifier, ParcelState>(
  () => ParcelNotifier(),
);


