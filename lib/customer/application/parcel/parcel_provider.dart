import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/customer/application/parcel/parcel_notifier.dart';
import 'package:rokctapp/customer/application/parcel/parcel_state.dart';

final parcelProvider = NotifierProvider<ParcelNotifier, ParcelState>(
  () => ParcelNotifier(),
);
