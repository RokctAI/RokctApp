import 'package:core_sdk/core_sdk.dart';
import 'auth_repository.dart';
import 'models/user_role.dart';
import 'models/data/user_model.dart';

class AuthSDK {
  final AuthRepository _repository = AuthRepository();

  Future<AuthSession> login({
    required String identifier,
    required String password,
    required String deviceFingerprint,
  }) async {
    // 1. Fraud Check
    final isBanned = await isDeviceBanned(deviceFingerprint);
    if (isBanned) {
      throw Exception("This device is banned due to security violations.");
    }

    final email = AppValidators.isValidEmail(identifier) ? identifier : "";
    final phone = AppValidators.isValidEmail(identifier) ? "" : identifier;

    final result = await _repository.login(
      email: email,
      phone: phone,
      password: password,
    );

    return result.when(
      success: (response) {
        final data = response.data;
        if (data == null || data.accessToken == null) {
          throw Exception("Invalid credentials or empty session payload.");
        }

        // Save token to local storage
        LocalStorage.setToken(data.accessToken!);

        // Determine user role and load permissions/modules
        final userRole = _parseRole(data.user?.role);
        final permissions = Permissions.fromRole(userRole);
        final modules = _determineModules(userRole);

        return AuthSession(
          accessToken: data.accessToken!,
          refreshToken: "",
          expiresAt: "",
          role: userRole,
          permissions: permissions,
          enabledModules: modules,
        );
      },
      failure: (error, status) {
        throw Exception(error.toString());
      },
    );
  }

  Future<AuthSession> verifyOtp(String code) async {
    // Standard verification mock/logic
    return AuthSession(
      accessToken: LocalStorage.getToken(),
      refreshToken: "",
      expiresAt: "",
      role: UserRole.customer,
      permissions: Permissions.fromRole(UserRole.customer),
      enabledModules: _determineModules(UserRole.customer),
    );
  }

  Future<void> logout() async {
    LocalStorage.logout();
  }

  AuthSession? getSession() {
    final token = LocalStorage.getToken();
    if (token.isEmpty) return null;

    // Retrieve user and role from LocalStorage
    // For simplicity, we restore a baseline user role from configuration
    final roleStr = LocalStorage.getTranslations()["user_role"]?.toString() ?? "customer";
    final userRole = _parseRole(roleStr);

    return AuthSession(
      accessToken: token,
      refreshToken: "",
      expiresAt: "",
      role: userRole,
      permissions: Permissions.fromRole(userRole),
      enabledModules: _determineModules(userRole),
    );
  }

  Future<bool> isDeviceBanned(String fingerprint) async {
    // Under a real fraud control pipeline, we query check-device endpoints on the backend
    try {
      final client = dioHttp.client(requireAuth: false);
      final response = await client.get('/api/v1/auth/check-device/$fingerprint');
      return response.data['is_banned'] == true;
    } catch (_) {
      return false; // Fail open for resilience if API doesn't exist yet
    }
  }

  UserRole _parseRole(String? role) {
    if (role == null) return UserRole.customer;
    switch (role.toLowerCase()) {
      case 'seller':
      case 'manager':
        return UserRole.seller;
      case 'driver':
      case 'deliveryman':
        return UserRole.driver;
      case 'admin':
      case 'administrator':
        return UserRole.admin;
      default:
        return UserRole.customer;
    }
  }

  List<String> _determineModules(UserRole role) {
    switch (role) {
      case UserRole.customer:
        return ["orders", "wallet", "profile", "notifications"];
      case UserRole.seller:
        return ["orders", "wallet", "profile", "notifications"];
      case UserRole.driver:
        return ["delivery", "wallet", "notifications"];
      case UserRole.admin:
        return ["orders", "delivery", "wallet", "profile", "notifications", "lending"];
    }
  }
}
