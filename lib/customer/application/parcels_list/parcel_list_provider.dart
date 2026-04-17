import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/customer/application/parcels_list/parcel_list_notifier.dart';
import 'package:rokctapp/customer/application/parcels_list/parcel_list_state.dart';

final parcelListProvider =
    NotifierProvider<ParcelListNotifier, ParcelListState>(
      () => ParcelListNotifier(),
    );
