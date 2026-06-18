import 'package:core_sdk/core_sdk.dart';
import 'profile_repository.dart';
import 'models/data/profile_models.dart';

class ProfileSDK {
  final ProfileRepository _repository = ProfileRepository();

  Future<Map<String, dynamic>> getProfile() async {
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get('/api/v1/dashboard/user/profile');
      return Map<String, dynamic>.from(response.data['data'] ?? {});
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> updateProfile({required Map<String, dynamic> data}) async {
    final res = await _repository.updateProfile(data: data);
    res.when(
      success: (_) {},
      failure: (err, status) {
        throw Exception(err.toString());
      },
    );
  }

  Future<List<dynamic>> getAddresses() async {
    final res = await _repository.getUserAddresses();
    return res.when(
      success: (response) => response.data ?? [],
      failure: (err, status) {
        throw Exception(err.toString());
      },
    );
  }

  Future<void> deleteAddress(int addressId) async {
    final res = await _repository.deleteAddress(addressId);
    res.when(
      success: (_) {},
      failure: (err, status) {
        throw Exception(err.toString());
      },
    );
  }

  Future<dynamic> createAddress(LocalAddressData address) async {
    final res = await _repository.createAddress(address);
    return res.when(
      success: (response) => response.data,
      failure: (err, status) {
        throw Exception(err.toString());
      },
    );
  }

  ProfileRepository get repository => _repository;
}
