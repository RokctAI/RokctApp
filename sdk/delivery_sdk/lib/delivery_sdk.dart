library delivery_sdk;

import 'package:get_it/get_it.dart';
import 'src/domain/interface/driver_parcel.dart';

// Domain Interfaces
// Global DI Getters
ParcelRepositoryFacade get parcelRepository => GetIt.instance.get<ParcelRepositoryFacade>();
DriverParcelRepository get driverParcelRepository => GetIt.instance.get<DriverParcelRepository>();

export 'src/domain/interface/driver_parcel.dart';
export 'src/domain/interface/parcel.dart';
export 'src/models/customer/delivery_models.dart';
export 'src/models/customer/delivery_zone_paginate.dart';
export 'src/models/customer/local_location.dart';
export 'src/models/customer/local_location_data.dart';
export 'src/models/customer/location.dart';
export 'src/models/customer/location_data.dart';
export 'src/models/customer/parcel_calculate_response.dart';
export 'src/models/customer/parcel_order.dart';
export 'src/models/customer/parcel_paginate_response.dart';
export 'src/models/customer/parcel_response.dart';
export 'src/models/customer/merchant_delivery.dart';
export 'src/models/driver/request_model_data.dart';
export 'src/models/driver/request_model_response.dart';
