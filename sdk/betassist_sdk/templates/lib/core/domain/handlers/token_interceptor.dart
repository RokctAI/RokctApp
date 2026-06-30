import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenInterceptor extends Interceptor {
  final bool requireAuth;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  TokenInterceptor({required this.requireAuth});

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Generate a unique microsecond trace ID prefixed for mobile tracking
    final String traceId = 'mob-${DateTime.now().microsecondsSinceEpoch}';
    options.headers['x-trace-id'] = traceId;

    if (requireAuth) {
      final String? token = await _storage.read(key: 'partner_token');
      if (token != null && token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    }

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Log trace ID alongside error for observability
    final traceId = err.requestOptions.headers['x-trace-id'] ?? 'unknown';
    // ignore: avoid_print
    print('[BetAssist][trace=$traceId] HTTP Error: ${err.type} - ${err.message}');
    handler.next(err);
  }
}
