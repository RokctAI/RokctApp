import 'package:get_it/get_it.dart';
library delivery_sdk;

export 'src/models/data/delivery_models.dart';
export 'src/delivery_repository.dart';
export 'src/delivery_sdk_impl.dart';

export 'src/models/data/parcel_order.dart';
export 'src/models/data/local_location_data.dart';

// Domain Interfaces
export 'src/domain/interface/parcel.dart';
export 'src/domain/interface/driver_parcel.dart';

export 'src/di/delivery_di.dart';

// Global DI Getters
ParcelRepositoryFacade get parcelRepository => GetIt.instance.get<ParcelRepositoryFacade>();
driver_parcel_int.DriverParcelRepository get driverParcelRepository => GetIt.instance.get<driver_parcel_int.DriverParcelRepository>();
export "src/di/delivery_di.dart";
