import 'package:core_sdk/core_sdk.dart';
import 'wallet_repository.dart';
import 'models/data/wallet_models.dart';

class WalletSDK {
  final WalletRepository _repository = WalletRepository();

  Future<double> getBalance() async {
    // Under the hood, balance is fetched from profile/user cache or a dedicated endpoint.
    // In Frappe, user profile contains the wallet info.
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get('/api/v1/dashboard/user/profile');
      final wallet = response.data['data']?['wallet'];
      if (wallet != null) {
        return double.tryParse(wallet['balance']?.toString() ?? '0.0') ?? 0.0;
      }
      return 0.0;
    } catch (_) {
      return 0.0;
    }
  }

  Future<List<dynamic>> getHistory({int page = 1}) async {
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/user/wallet/histories',
        queryParameters: {'page': page},
      );
      return response.data['data'] ?? [];
    } catch (_) {
      return [];
    }
  }

  Future<bool> transfer({
    required String recipientMailOrPhone,
    required double amount,
  }) async {
    // Step 1: Find wallet UUID of recipient
    try {
      final client = dioHttp.client(requireAuth: true);
      final searchRes = await client.get(
        '/api/v1/dashboard/user/search',
        queryParameters: {'search': recipientMailOrPhone},
      );
      final users = searchRes.data['data'] as List?;
      if (users == null || users.isEmpty) {
        throw Exception("Recipient user not found.");
      }
      final uuid = users.first['wallet']?['uuid'];
      if (uuid == null) {
        throw Exception("Recipient does not have an active wallet.");
      }

      // Step 2: Perform transfer
      final res = await _repository.sendWallet(uuid: uuid, price: amount);
      return res.when(
        success: (success) => success,
        failure: (err, status) {
          throw Exception(err.toString());
        },
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Public SDK accessors
  WalletRepository get repository => _repository;
}
