sealed class ApiResult<T> {
  const ApiResult();

  const factory ApiResult.success({required T data}) = Success<T>;
  const factory ApiResult.failure({required String error, int? statusCode}) =
      Failure<T>;

  R when<R>({
    required R Function(T data) success,
    required R Function(String error, int? statusCode) failure,
  }) {
    if (this is Success<T>) {
      return success((this as Success<T>).data);
    } else if (this is Failure<T>) {
      final f = this as Failure<T>;
      return failure(f.error, f.statusCode);
    }
    throw StateError('Unknown ApiResult subtype: $this');
  }

  R maybeWhen<R>({
    R Function(T data)? success,
    R Function(String error, int? statusCode)? failure,
    required R Function() orElse,
  }) {
    if (this is Success<T> && success != null) {
      return success((this as Success<T>).data);
    } else if (this is Failure<T> && failure != null) {
      final f = this as Failure<T>;
      return failure(f.error, f.statusCode);
    }
    return orElse();
  }
}

class Success<T> extends ApiResult<T> {
  final T data;
  const Success({required this.data});
}

class Failure<T> extends ApiResult<T> {
  final String error;
  final int? statusCode;
  const Failure({required this.error, this.statusCode});
}
