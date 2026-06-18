import 'package:core_sdk/core_sdk.dart';
import 'delivery_repository.dart';
import 'models/data/delivery_models.dart';

class DeliverySDK {
  final DeliveryRepository _repository = DeliveryRepository();

  Future<List<dynamic>> getParcels({int? page}) async {
    final res = await _repository.getParcels(page: page);
    return res.when(
      success: (response) => response.data ?? [],
      failure: (err, status) {
        throw Exception(err.toString());
      },
    );
  }

  Future<void> sendLocationUpdate({required double latitude, required double longitude}) async {
    final res = await _repository.updateDriverLocation(latitude: latitude, longitude: longitude);
    res.when(
      success: (_) {},
      failure: (err, status) {
        throw Exception(err.toString());
      },
    );
  }

  DeliveryRepository get repository => _repository;
}
