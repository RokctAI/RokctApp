enum UserRole {
  customer,
  seller,
  driver,
  admin
}

class Permissions {
  final bool canPlaceOrders;
  final bool canManageShop;
  final bool canDeliver;
  final bool canUseWallet;
  final bool canUseLending;

  const Permissions({
    required this.canPlaceOrders,
    required this.canManageShop,
    required this.canDeliver,
    required this.canUseWallet,
    required this.canUseLending,
  });

  factory Permissions.fromRole(UserRole role) {
    switch (role) {
      case UserRole.customer:
        return const Permissions(
          canPlaceOrders: true,
          canManageShop: false,
          canDeliver: false,
          canUseWallet: true,
          canUseLending: true,
        );
      case UserRole.seller:
        return const Permissions(
          canPlaceOrders: true,
          canManageShop: true,
          canDeliver: false,
          canUseWallet: true,
          canUseLending: true,
        );
      case UserRole.driver:
        return const Permissions(
          canPlaceOrders: false,
          canManageShop: false,
          canDeliver: true,
          canUseWallet: true,
          canUseLending: false,
        );
      case UserRole.admin:
        return const Permissions(
          canPlaceOrders: true,
          canManageShop: true,
          canDeliver: true,
          canUseWallet: true,
          canUseLending: true,
        );
    }
  }
}

class AuthSession {
  final String accessToken;
  final String refreshToken;
  final String expiresAt;
  final UserRole role;
  final Permissions permissions;
  final List<String> enabledModules;

  AuthSession({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresAt,
    required this.role,
    required this.permissions,
    required this.enabledModules,
  });
}
