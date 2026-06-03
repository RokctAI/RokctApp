import 'package:dio/dio.dart';
import 'package:rokctapp/core/infrastructure/utils/services.dart';

class TokenInterceptor extends Interceptor {
  final bool requireAuth;

  TokenInterceptor({required this.requireAuth});

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Generate a unique microsecond trace ID prefixed for mobile tracking
    final String traceId = 'mob-${DateTime.now().microsecondsSinceEpoch}';
    options.headers.addAll({'x-trace-id': traceId});

    final String token = LocalStorage.getToken();
    if (token.isNotEmpty && requireAuth) {
      options.headers.addAll({'Authorization': 'Bearer $token'});
    }
    handler.next(options);
  }
}
