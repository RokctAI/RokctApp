# API Reference: address_repository

Source file: `lib/customer/repository/address_repository.dart`

## Classes

### class `AddressRepository`

## Whitelisted API Endpoints

### `getUserAddresses() async { try { final client = dioHttp.client(requireAuth: true); final response = await client.get('/api/v1/dashboard/user/addresses'); return ApiResult.success(data: AddressesResponse.fromJson(response.data)); } catch (e)`
*No documentation provided (generation failed).*

### `deleteAddress(int addressId) async { try { final client = dioHttp.client(requireAuth: true); await client.delete('/api/v1/dashboard/user/addresses/$addressId'); return const ApiResult.success(data: null); } catch (e)`
*No documentation provided (generation failed).*

### `createAddress(LocalAddressData address, ) async { try { final client = dioHttp.client(requireAuth: true); final response = await client.post( '/api/v1/dashboard/user/addresses', data: address.toJson(), ); return ApiResult.success( data: SingleAddressResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*
