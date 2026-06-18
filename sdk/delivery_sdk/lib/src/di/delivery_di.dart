import 'package:get_it/get_it.dart';
import '../../delivery_sdk.dart';
import 'package:rokctapp/customer/repository/parcel_repository.dart' as customer_parcel_repo;
import 'package:rokctapp/driver/infrastructure/repositories/parcel_repository.dart' as driver_parcel_impl;

class DeliverySdkDependencies {
  static void register(GetIt getIt) {
    getIt.registerSingleton<ParcelRepositoryFacade>(customer_parcel_repo.ParcelRepository());
    getIt.registerSingleton<driver_parcel_int.DriverParcelRepository>(driver_parcel_impl.ParcelRepository());
  }
}
