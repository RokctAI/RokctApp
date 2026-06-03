# API Reference: auth_repository

Source file: `lib/manager/infrastructure/repositories/auth_repository.dart`

## Classes

### class `AuthRepository`

## Whitelisted API Endpoints

### `login({ required String email, required String password, }) async { final data = { if (AppValidators.isValidEmail(email)) 'email': email, if (!AppValidators.isValidEmail(email)) 'phone': email, 'password': password, }; try { final client = dioHttp.client(requireAuth: false); final response = await client.post('/api/v1/auth/login', data: data); return ApiResult.success(data: LoginResponse.fromJson(response.data)); } catch (e)`
*No documentation provided (generation failed).*

### `loginWithGoogle({ required String email, required String displayName, required String id, required String avatar, }) async { final data = { 'email': email, 'name': displayName, 'id': id, "avatar": avatar, }; debugPrint('===> login request $data'); try { final client = dioHttp.client(requireAuth: false); final response = await client.post( '/api/v1/auth/google/callback', queryParameters: data, ); return ApiResult.success(data: LoginResponse.fromJson(response.data)); } catch (e)`
*No documentation provided (generation failed).*

### `sendOtp({required String phone}) async { final data = {'phone': phone.replaceAll('+', "")}; try { final client = dioHttp.client(requireAuth: false); final response = await client.post('/api/v1/auth/register', data: data); return ApiResult.success(data: RegisterResponse.fromJson(response.data)); } catch (e)`
*No documentation provided (generation failed).*

### `verifyEmail({ required String verifyCode, }) async { try { final client = dioHttp.client(requireAuth: false); final response = await client.get('/api/v1/auth/verify/$verifyCode'); return ApiResult.success( data: VerifyPhoneResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `verifyPhone({ required String verifyCode, required String verifyId, }) async { try { final client = dioHttp.client(requireAuth: false); final response = await client.post( '/api/v1/auth/verify/phone', queryParameters: {"verifyId": verifyId, "verifyCode": verifyCode}, ); return ApiResult.success( data: VerifyPhoneResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `forgotPassword({ required String email, }) async { final data = { if (AppValidators.isValidEmail(email)) "email": email, if (!AppValidators.isValidEmail(email)) "phone": email.replaceAll('+', ""), }; try { final client = dioHttp.client(requireAuth: false); final response = await client.post( AppValidators.isValidEmail(email) ? '/api/v1/auth/forgot/email-password' : '/api/v1/auth/forgot/password', queryParameters: data, ); return ApiResult.success(data: RegisterResponse.fromJson(response.data)); } catch (e)`
*No documentation provided (generation failed).*

### `forgotPasswordConfirm({ required String verifyCode, required String email, }) async { try { final client = dioHttp.client(requireAuth: false); final response = await client.post( '/api/v1/auth/forgot/email-password/$verifyCode?email=${email.replaceAll('+', "")}', ); return ApiResult.success( data: VerifyData.fromJson(response.data["data"]), ); } catch (e)`
*No documentation provided (generation failed).*

### `forgotPasswordConfirmWithPhone({ required String phone, }) async { try { final client = dioHttp.client(requireAuth: false); final response = await client.post( '/api/v1/auth/forgot/password/confirm', data: {"phone": phone.replaceAll('+', ""), "type": "firebase"}, ); return ApiResult.success( data: VerifyData.fromJson(response.data["data"]), ); } catch (e)`
*No documentation provided (generation failed).*

### `signUp({required String email}) async { final data = SignUpRequest(email: email); try { final client = dioHttp.client(requireAuth: false); await client.post( '/api/v1/auth/register', queryParameters: data.toJson(), ); return const ApiResult.success(data: null); } catch (e)`
*No documentation provided (generation failed).*

### `sigUpWithData({required UserModel user}) async { try { final client = dioHttp.client(requireAuth: false); var res = await client.post( '/api/v1/auth/after-verify', data: user.toJsonForSignUp(), ); return ApiResult.success(data: VerifyData.fromJson(res.data["data"])); } catch (e)`
*No documentation provided (generation failed).*

### `sigUpWithPhone({ required UserModel user, }) async { try { final client = dioHttp.client(requireAuth: false); var res = await client.post( '/api/v1/auth/verify/phone', data: user.toJsonForSignUp(typeFirebase: true), ); return ApiResult.success(data: VerifyData.fromJson(res.data["data"])); } catch (e)`
*No documentation provided (generation failed).*

### `checkPhone({ required String phone, }) async { final data = {'phone': phone.replaceAll("+", "")}; debugPrint('===> login request $data'); try { final client = dioHttp.client(requireAuth: false); final response = await client.post( '/api/v1/auth/check/phone', queryParameters: data, ); return ApiResult.success( data: CheckPhoneResponse.fromJson(response.data), ); } catch (e, s)`
*No documentation provided (generation failed).*
