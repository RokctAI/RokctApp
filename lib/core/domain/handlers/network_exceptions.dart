import 'dart:io';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_exceptions.freezed.dart';

@freezed
sealed class NetworkExceptions with _$NetworkExceptions {
  const factory NetworkExceptions.requestCancelled() = RequestCancelled;

  const factory NetworkExceptions.unauthorisedRequest() = UnauthorisedRequest;

  const factory NetworkExceptions.badRequest() = BadRequest;

  const factory NetworkExceptions.notFound(String reason) = NotFound;

  const factory NetworkExceptions.methodNotAllowed() = MethodNotAllowed;

  const factory NetworkExceptions.notAcceptable() = NotAcceptable;

  const factory NetworkExceptions.requestTimeout() = RequestTimeout;

  const factory NetworkExceptions.sendTimeout() = SendTimeout;

  const factory NetworkExceptions.conflict() = Conflict;

  const factory NetworkExceptions.internalServerError() = InternalServerError;

  const factory NetworkExceptions.notImplemented() = NotImplemented;

  const factory NetworkExceptions.serviceUnavailable() = ServiceUnavailable;

  const factory NetworkExceptions.noInternetConnection() = NoInternetConnection;

  const factory NetworkExceptions.formatException() = FormatException;

  const factory NetworkExceptions.unableToProcess() = UnableToProcess;

  const factory NetworkExceptions.defaultError(String error) = DefaultError;

  const factory NetworkExceptions.unexpectedError() = UnexpectedError;

  static NetworkExceptions getDioException(dynamic error) {
    if (error is Exception) {
      try {
        if (error is DioException) {
          switch (error.type) {
            case DioExceptionType.cancel:
              break;
            case DioExceptionType.connectionTimeout:
              break;
            case DioExceptionType.unknown:
              break;
            case DioExceptionType.receiveTimeout:
              break;
            case DioExceptionType.badResponse:
              switch (error.response!.statusCode) {
                case 400:
                  break;
                case 401:
                  break;
                case 403:
                  break;
                case 404:
                  break;
                case 409:
                  break;
                case 408:
                  break;
                case 500:
                  break;
                case 503:
                  break;
                default:
              }
              break;
            case DioExceptionType.sendTimeout:
              break;
            case DioExceptionType.badCertificate:
              // TODO: Handle this case.
              break;
            case DioExceptionType.connectionError:
              // TODO: Handle this case.
              break;
          }
        } else if (error is SocketException) {
        } else {}
        return const NetworkExceptions.noInternetConnection();
      } on FormatException catch (_) {
        return const NetworkExceptions.formatException();
      } catch (_) {
        return const NetworkExceptions.unexpectedError();
      }
    } else {
      if (error.toString().contains("is not a subtype of")) {
        return const NetworkExceptions.unableToProcess();
      } else {
        return const NetworkExceptions.unexpectedError();
      }
    }
  }

  static int getDioStatus(dynamic error) {
    if (error is Exception) {
      try {
        int? s;
        if (error is DioException) {
          switch (error.type) {
            case DioExceptionType.cancel:
              s = 500;
              break;
            case DioExceptionType.connectionTimeout:
              s = 500;
              break;
            case DioExceptionType.unknown:
              s = 500;
              break;
            case DioExceptionType.receiveTimeout:
              s = 500;
              break;
            case DioExceptionType.badResponse:
              switch (error.response!.statusCode) {
                case 400:
                  s = 400;
                  break;
                case 401:
                  s = 401;
                  break;
                case 403:
                  s = 403;
                  break;
                case 404:
                  s = 404;
                  break;
                case 409:
                  s = 409;
                  break;
                case 422:
                  s = 422;
                  break;
                case 408:
                  s = 408;
                  break;
                case 500:
                  s = 500;
                  break;
                case 503:
                  s = 503;
                  break;
                default:
                  s = 500;
              }
              break;
            case DioExceptionType.sendTimeout:
              s = 500;
              break;
            case DioExceptionType.badCertificate:
              // TODO: Handle this case.
              break;
            case DioExceptionType.connectionError:
              // TODO: Handle this case.
              break;
          }
        } else if (error is SocketException) {
          s = 500;
        } else {
          s = 500;
        }
        return s ?? 500;
      } on FormatException catch (_) {
        return 500;
      } catch (_) {
        return 500;
      }
    } else {
      if (error.toString().contains("is not a subtype of")) {
        return 500;
      } else {
        return 500;
      }
    }
  }
}
