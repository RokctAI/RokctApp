# API Reference: auth_repository_impl

Source file: `lib/driver/infrastructure/repositories/auth_repository_impl.dart`

## Classes

### class `AuthRepositoryImpl`

## Whitelisted API Endpoints

### `login({ required String email, required String password, }) async { final data = { if (AppValidators.isValidEmail(email)) 'email': email, if (!AppValidators.isValidEmail(email)) 'phone': email, 'password': password, }; debugPrint('===> login request $data'); try { final client = dioHttp.client(requireAuth: false); final response = await client.post('/api/v1/auth/login', data: data); return ApiResult.success(data: LoginResponse.fromJson(response.data)); } catch (e)`
*No documentation provided (generation failed).*

### `loginWithSocial({ String? email, String? displayName, String? id, }) async { final data = { if (email != null) 'email': email, if (displayName != null) 'name': displayName, if (id != null) 'id': id, }; debugPrint('===> login request ${jsonEncode(data)}'); try { final client = dioHttp.client(requireAuth: false); final response = await client.post( '/api/v1/auth/google/callback', data: data, ); return ApiResult.success(data: LoginResponse.fromJson(response.data)); } catch (e)`
*No documentation provided (generation failed).*

### `sendOtp({required String phone}) async { final data = {'phone': phone}; try { final client = dioHttp.client(requireAuth: false); final response = await client.post('/api/v1/auth/register', data: data); return ApiResult.success(data: RegisterResponse.fromJson(response.data)); } catch (e)`
*No documentation provided (generation failed).*

### `verifyPhone({ required String verifyId, required String verifyCode, }) async { final data = {'verifyId': verifyId, 'verifyCode': verifyCode}; try { final client = dioHttp.client(requireAuth: false); final response = await client.post( '/api/v1/auth/verify/phone', data: data, ); return ApiResult.success( data: VerifyPhoneResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `forgotPassword({ required String email, }) async { final data = {'email': email}; try { final client = dioHttp.client(requireAuth: false); final response = await client.post( '/api/v1/auth/forgot/email-password', queryParameters: data, ); return ApiResult.success(data: RegisterResponse.fromJson(response.data)); } catch (e)`
*No documentation provided (generation failed).*

### `forgotPasswordConfirm({ required String verifyCode, required String email, }) async { try { final client = dioHttp.client(requireAuth: false); final response = await client.post( '/api/v1/auth/forgot/email-password/$verifyCode?email=$email', ); return ApiResult.success( data: VerifyData.fromJson(response.data["data"]), ); } catch (e)`
*No documentation provided (generation failed).*

### `forgotPasswordConfirmWithPhone({ required String phone, }) async { try { final client = dioHttp.client(requireAuth: false); final response = await client.post( '/api/v1/auth/forgot/password/confirm', data: {"phone": phone, "type": "firebase"}, ); return ApiResult.success( data: VerifyData.fromJson(response.data["data"]), ); } catch (e)`
*No documentation provided (generation failed).*

### `verifyEmail({ required String verifyCode, }) async { try { final client = dioHttp.client(requireAuth: false); final response = await client.get('/api/v1/auth/verify/$verifyCode'); return ApiResult.success( data: VerifyPhoneResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `sigUpWithData({required UserData user}) async { final data = { "firstname": user.firstname, "lastname": user.lastname, "phone": user.phone, "email": user.email, "password": user.password, "password_conformation": user.conPassword, if (user.referral?.isNotEmpty ?? false) 'referral': user.referral, }; try { final client = dioHttp.client(requireAuth: false); var res = await client.post('/api/v1/auth/after-verify', data: data); return ApiResult.success(data: VerifyData.fromJson(res.data["data"])); } catch (e)`
*No documentation provided (generation failed).*

### `sigUpWithPhone({required UserData user}) async { final data = { "firstname": user.firstname, "lastname": user.lastname, "phone": user.phone, "email": user.email, "password": user.password, "password_conformation": user.conPassword, "type": "firebase", if (user.referral?.isNotEmpty ?? false) 'referral': user.referral, }; try { final client = dioHttp.client(requireAuth: false); var res = await client.post('/api/v1/auth/verify/phone', data: data); return ApiResult.success(data: VerifyData.fromJson(res.data["data"])); } catch (e)`
*No documentation provided (generation failed).*

### `signUp({required String email}) async { final data = SignUpRequest(email: email); try { final client = dioHttp.client(requireAuth: false); await client.post( '/api/v1/auth/register', queryParameters: data.toJson(), ); return ApiResult.success(data: null); } catch (e)`
*No documentation provided (generation failed).*

### `checkPhone({required String phone}) async { final data = {'phone': phone}; debugPrint('===> login request $data'); try { final client = dioHttp.client(requireAuth: false); await client.post('/api/v1/auth/check/phone', queryParameters: data); return const ApiResult.success(data: true); } catch (e, s)`
*No documentation provided (generation failed).*
