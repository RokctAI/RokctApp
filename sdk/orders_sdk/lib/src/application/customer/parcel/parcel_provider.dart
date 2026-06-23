import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:orders_sdk/src/application/customer/parcel/parcel_notifier.dart';
import 'package:orders_sdk/src/application/customer/parcel/parcel_state.dart';

final parcelProvider = NotifierProvider<ParcelNotifier, ParcelState>(
  () => ParcelNotifier(),
);
