import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_result.freezed.dart';

@freezed
sealed class ApiResult<T> with _$ApiResult<T> {
  const ApiResult._();

  const factory ApiResult.success({required T data}) = Success<T>;

  const factory ApiResult.failure({required String error}) = Failure<T>;

  R when<R>({
    required R Function(T data) success,
    required R Function(String error) failure,
  }) {
    return switch (this) {
      Success<T>(data: final data) => success(data),
      Failure<T>(error: final error) => failure(error),
    };
  }

  R maybeWhen<R>({
    R Function(T data)? success,
    R Function(String error)? failure,
    required R Function() orElse,
  }) {
    return switch (this) {
      Success<T>(data: final data) => success?.call(data) ?? orElse(),
      Failure<T>(error: final error) => failure?.call(error) ?? orElse(),
    };
  }
}
