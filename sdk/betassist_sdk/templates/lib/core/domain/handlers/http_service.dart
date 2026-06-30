import 'package:dio/dio.dart';
import 'package:betassist_mobile/core/domain/handlers/token_interceptor.dart';

/// Base URL loaded from dart-define environment — never hardcoded.
/// Pass at build time: --dart-define=BETASSIST_BASE_URL=https://your-backend.com
const String _baseUrl = String.fromEnvironment(
  'BETASSIST_BASE_URL',
  defaultValue: 'https://api.betassist.local',
);

class HttpService {
  /// Returns a configured Dio client with:
  ///  - 30s connect / receive / send timeouts
  ///  - x-trace-id injection via TokenInterceptor (matches RokctApp pattern)
  ///  - Optional Bearer token auth
  ///  - Request/response logging
  Dio client({bool requireAuth = false}) => Dio(
        BaseOptions(
          baseUrl: _baseUrl,
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
          sendTimeout: const Duration(seconds: 30),
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'x-trace-id': 'dio-client-default',
          },
        ),
      )
        ..interceptors.add(TokenInterceptor(requireAuth: requireAuth))
        ..interceptors.add(
          LogInterceptor(
            responseHeader: false,
            requestHeader: true,
            responseBody: true,
            requestBody: true,
          ),
        );
}
