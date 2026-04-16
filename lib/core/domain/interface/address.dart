import 'package:rokctapp/core/infrastructure/models/models.dart';
import 'package:rokctapp/core/domain/handlers/handlers.dart';

abstract class AddressRepositoryFacade {
  Future<ApiResult<AddressesResponse>> getUserAddresses();

  Future<ApiResult<void>> deleteAddress(int addressId);

  Future<ApiResult<SingleAddressResponse>> createAddress(
    LocalAddressData address,
  );
}
