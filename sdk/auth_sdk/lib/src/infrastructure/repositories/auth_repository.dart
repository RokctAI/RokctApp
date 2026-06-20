import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:users_sdk/src/models/data/user.dart';
import 'package:auth_sdk/src/models/request/sign_up_request.dart';
import 'package:core_sdk/core_sdk.dart';
import 'package:auth_sdk/src/domain/interface/auth_repository_facade.dart';
import 'package:auth_sdk/auth_sdk.dart';

class AuthRepository implements AuthRepositoryFacade {
  final Dio _dio;
  AuthRepository(this._dio);
  @override
  Future<ApiResult<LoginResponse>> login({
    required String email,
    required String phone,
    required String password,
  }) async {
    final data = {
      if (email.isNotEmpty) 'email': email,
      if (phone.isNotEmpty) 'phone': phone.replaceAll('+', ""),
      'password': password,
    };
    try {
      final client = _dio;
      final response = await client.post('/api/v1/auth/login', data: data);
      return ApiResult.success(data: LoginResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> login failure: $e');
      return ApiResult.failure(
        error: NetworkExceptions.getErrorMessage(NetworkExceptions.getDioException(e)),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<LoginResponse>> loginWithSocial({
    required String id,
    String? email,
    String? displayName,
    String? avatar,
  }) async {
    final data = {
      'email': email,
      'name': displayName,
      'id': id,
      "avatar": avatar,
    };
    debugPrint('===> login request $data');
    try {
      final client = _dio;
      final response = await client.post(
        '/api/v1/auth/google/callback',
        queryParameters: data,
      );
      return ApiResult.success(data: LoginResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> login with social failure: $e');
      return ApiResult.failure(
        error: NetworkExceptions.getErrorMessage(NetworkExceptions.getDioException(e)),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<LoginResponse>> loginWithGoogle({
    required String email,
    required String displayName,
    required String id,
    required String avatar,
  }) async {
    final data = {
      'email': email,
      'name': displayName,
      'id': id,
      "avatar": avatar,
    };
    debugPrint('===> login request $data');
    try {
      final client = _dio;
      final response = await client.post(
        '/api/v1/auth/google/callback',
        queryParameters: data,
      );
      return ApiResult.success(data: LoginResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> login with google failure: $e');
      return ApiResult.failure(
        error: NetworkExceptions.getErrorMessage(NetworkExceptions.getDioException(e)),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<RegisterResponse>> sendOtp({required String phone}) async {
    final data = {'phone': phone.replaceAll('+', "")};
    try {
      final client = _dio;
      final response = await client.post('/api/v1/auth/register', data: data);
      return ApiResult.success(data: RegisterResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> send otp failure: $e');
      return ApiResult.failure(
        error: NetworkExceptions.getErrorMessage(NetworkExceptions.getDioException(e)),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<VerifyPhoneResponse>> verifyEmail({
    required String verifyCode,
  }) async {
    try {
      final client = _dio;
      final response = await client.get('/api/v1/auth/verify/$verifyCode');
      return ApiResult.success(
        data: VerifyPhoneResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> verify email failure: $e');
      return ApiResult.failure(
        error: NetworkExceptions.getErrorMessage(NetworkExceptions.getDioException(e)),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<VerifyPhoneResponse>> verifyPhone({
    required String verifyCode,
    required String verifyId,
  }) async {
    try {
      final client = _dio;
      final response = await client.post(
        '/api/v1/auth/verify/phone',
        queryParameters: {"verifyId": verifyId, "verifyCode": verifyCode},
      );
      return ApiResult.success(
        data: VerifyPhoneResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> verify email failure: $e');
      return ApiResult.failure(
        error: NetworkExceptions.getErrorMessage(NetworkExceptions.getDioException(e)),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<RegisterResponse>> forgotPassword({
    required String email,
  }) async {
    final data = {
      if (CoreValidators.isValidEmail(email)) "email": email,
      if (!CoreValidators.isValidEmail(email))
        "phone": email.replaceAll('+', ""),
    };
    try {
      final client = _dio;
      final response = await client.post(
        CoreValidators.isValidEmail(email)
            ? '/api/v1/auth/forgot/email-password'
            : '/api/v1/auth/forgot/password',
        queryParameters: data,
      );
      return ApiResult.success(data: RegisterResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> forgot password failure: $e'); // environment
      return ApiResult.failure(
        error: NetworkExceptions.getErrorMessage(NetworkExceptions.getDioException(e)),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<VerifyData>> forgotPasswordConfirm({
    required String verifyCode,
    required String email,
  }) async {
    try {
      final client = _dio;
      final response = await client.post(
        '/api/v1/auth/forgot/email-password/$verifyCode?email=${email.replaceAll('+', "")}', // environment
      );

      return ApiResult.success(
        data: VerifyData.fromJson(response.data["data"]),
      );
    } catch (e) {
      debugPrint('==> forgot password confirm failure: $e'); // environment
      return ApiResult.failure(
        error: NetworkExceptions.getErrorMessage(NetworkExceptions.getDioException(e)),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<VerifyData>> forgotPasswordConfirmWithPhone({
    required String phone,
  }) async {
    try {
      final client = _dio;
      final response = await client.post(
        '/api/v1/auth/forgot/password/confirm',
        data: {"phone": phone.replaceAll('+', ""), "type": "firebase"},
      );

      return ApiResult.success(
        data: VerifyData.fromJson(response.data["data"]),
      );
    } catch (e) {
      debugPrint('==> forgot password confirm failure: $e'); // environment
      return ApiResult.failure(
        error: NetworkExceptions.getErrorMessage(NetworkExceptions.getDioException(e)),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<Dyn>> sigUp({required String email}) async {
    final data = SignUpRequest(email: email.replaceAll('+', ""));
    try {
      final client = _dio;
      await client.post(
        '/api/v1/auth/register',
        queryParameters: data.toJson(),
      );
      return const ApiResult.success(data: null);
    } catch (e) {
      return ApiResult.failure(
        error: NetworkExceptions.getErrorMessage(NetworkExceptions.getDioException(e)),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<VerifyData>> sigUpWithData({required UserModel user}) async {
    try {
      final client = _dio;
      var res = await client.post(
        '/api/v1/auth/after-verify',
        data: user.toJsonForSignUp(),
      );
      return ApiResult.success(data: VerifyData.fromJson(res.data["data"]));
    } catch (e) {
      return ApiResult.failure(
        error: NetworkExceptions.getErrorMessage(NetworkExceptions.getDioException(e)),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<VerifyData>> sigUpWithPhone({
    required UserModel user,
  }) async {
    try {
      final client = _dio;
      var res = await client.post(
        '/api/v1/auth/verify/phone',
        data: user.toJsonForSignUp(typeFirebase: true),
      );
      return ApiResult.success(data: VerifyData.fromJson(res.data["data"]));
    } catch (e) {
      return ApiResult.failure(
        error: NetworkExceptions.getErrorMessage(NetworkExceptions.getDioException(e)),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }
}

typedef Dyn = dynamic;
