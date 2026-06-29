import 'package:rokctapp/customer/models/models.dart';
import 'package:core_sdk/core_sdk.dart';

abstract class AddressRepositoryFacade {
  Future<ApiResult<AddressesResponse>> getUserAddresses();

  Future<ApiResult<void>> deleteAddress(int addressId);

  Future<ApiResult<SingleAddressResponse>> createAddress(
    LocalAddressData address,
  );
}
