// Trace ID propagation context
import 'package:dio/dio.dart';
import 'package:core_sdk/core_sdk.dart';

import 'package:core_sdk/core_sdk.dart';

import 'package:core_sdk/core_sdk.dart';

final dioHttp = HttpService();

class HttpService {
  Dio client({bool requireAuth = false, bool routing = false}) =>
      Dio(
          BaseOptions(
            baseUrl: routing
                ? AppConstants.routingBaseUrl
                : AppConstants.baseUrl,
            connectTimeout: const Duration(seconds: 30),
            receiveTimeout: const Duration(seconds: 30),
            sendTimeout: const Duration(seconds: 30),
            headers: {
              'Accept':
                  'application/json, application/geo+json, application/gpx+xml, img/png; charset=utf-8',
              'Content-type': 'application/json',
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
