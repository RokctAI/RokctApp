class SecretVars {
  SecretVars._();

  /// api variables
  static const String baseUrl = String.fromEnvironment('BASE_URL');
  static const String webUrl = String.fromEnvironment('WEB_URL');
}
