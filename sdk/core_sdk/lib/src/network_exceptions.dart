import 'dart:io';
import 'package:dio/dio.dart';

sealed class NetworkExceptions {
  const NetworkExceptions();

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
              return const NetworkExceptions.requestCancelled();
            case DioExceptionType.connectionTimeout:
              return const NetworkExceptions.requestTimeout();
            case DioExceptionType.unknown:
              return const NetworkExceptions.unexpectedError();
            case DioExceptionType.receiveTimeout:
              return const NetworkExceptions.requestTimeout();
            case DioExceptionType.badResponse:
              switch (error.response!.statusCode) {
                case 400:
                  return const NetworkExceptions.badRequest();
                case 401:
                  return const NetworkExceptions.unauthorisedRequest();
                case 403:
                  return const NetworkExceptions.unauthorisedRequest();
                case 404:
                  return const NetworkExceptions.notFound("Not Found");
                case 409:
                  return const NetworkExceptions.conflict();
                case 408:
                  return const NetworkExceptions.requestTimeout();
                case 500:
                  return const NetworkExceptions.internalServerError();
                case 503:
                  return const NetworkExceptions.serviceUnavailable();
                default:
                  return const NetworkExceptions.unexpectedError();
              }
            case DioExceptionType.sendTimeout:
              return const NetworkExceptions.sendTimeout();
            case DioExceptionType.badCertificate:
              return const NetworkExceptions.unauthorisedRequest();
            case DioExceptionType.connectionError:
              return const NetworkExceptions.noInternetConnection();
          }
        } else if (error is SocketException) {
          return const NetworkExceptions.noInternetConnection();
        }
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
        int? status;
        if (error is DioException) {
          switch (error.type) {
            case DioExceptionType.cancel:
              status = 500;
              break;
            case DioExceptionType.connectionTimeout:
              status = 500;
              break;
            case DioExceptionType.unknown:
              status = 500;
              break;
            case DioExceptionType.receiveTimeout:
              status = 500;
              break;
            case DioExceptionType.badResponse:
              switch (error.response!.statusCode) {
                case 400:
                  status = 400;
                  break;
                case 401:
                  status = 401;
                  break;
                case 403:
                  status = 403;
                  break;
                case 404:
                  status = 404;
                  break;
                case 409:
                  status = 409;
                  break;
                case 422:
                  status = 422;
                  break;
                case 408:
                  status = 408;
                  break;
                case 500:
                  status = 500;
                  break;
                case 503:
                  status = 503;
                  break;
                default:
                  status = 500;
              }
              break;
            case DioExceptionType.sendTimeout:
              status = 500;
              break;
            case DioExceptionType.badCertificate:
              status = 401;
              break;
            case DioExceptionType.connectionError:
              status = 503;
              break;
          }
        } else if (error is SocketException) {
          status = 500;
        } else {
          status = 500;
        }
        return status ?? 500;
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

  static String getErrorMessage(dynamic e) {
    try {
      return (e.runtimeType == DioException)
          ? ((e as DioException).response?.data["message"] == "Bad request."
                ? (e.response?.data["params"] as Map).values.first[0]
                : e.response?.data["message"])
          : e.toString();
    } catch (s) {
      try {
        return (e.runtimeType == DioException)
            ? ((e as DioException).response?.data.toString().substring(
                (e.response?.data.toString().indexOf("<title>") ?? 0) + 7,
                e.response?.data.toString().indexOf("</title") ?? 0,
              )).toString()
            : e.toString();
      } catch (r) {
        try {
          return (e.runtimeType == DioException)
              ? ((e as DioException).response?.data["error"]["message"])
                    .toString()
              : e.toString();
        } catch (f) {
          return e.toString();
        }
      }
    }
  }
}

class RequestCancelled extends NetworkExceptions {
  const RequestCancelled();
}

class UnauthorisedRequest extends NetworkExceptions {
  const UnauthorisedRequest();
}

class BadRequest extends NetworkExceptions {
  const BadRequest();
}

class NotFound extends NetworkExceptions {
  final String reason;
  const NotFound(this.reason);
}

class MethodNotAllowed extends NetworkExceptions {
  const MethodNotAllowed();
}

class NotAcceptable extends NetworkExceptions {
  const NotAcceptable();
}

class RequestTimeout extends NetworkExceptions {
  const RequestTimeout();
}

class SendTimeout extends NetworkExceptions {
  const SendTimeout();
}

class Conflict extends NetworkExceptions {
  const Conflict();
}

class InternalServerError extends NetworkExceptions {
  const InternalServerError();
}

class NotImplemented extends NetworkExceptions {
  const NotImplemented();
}

class ServiceUnavailable extends NetworkExceptions {
  const ServiceUnavailable();
}

class NoInternetConnection extends NetworkExceptions {
  const NoInternetConnection();
}

class FormatException extends NetworkExceptions {
  const FormatException();
}

class UnableToProcess extends NetworkExceptions {
  const UnableToProcess();
}

class DefaultError extends NetworkExceptions {
  final String error;
  const DefaultError(this.error);
}

class UnexpectedError extends NetworkExceptions {
  const UnexpectedError();
}
