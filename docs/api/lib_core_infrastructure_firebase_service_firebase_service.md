# API Reference: firebase_service

Source file: `lib/core/infrastructure/firebase_service/firebase_service.dart`

## Classes

### class `FirebaseService`

## Whitelisted API Endpoints

### `getFcmToken() async { final firebaseM = FirebaseMessaging.instance; firebaseM.requestPermission(sound: true, alert: true, badge: false); return await firebaseM.getToken() ?? ""; } static Future<Either<UserCredential, Dyn>> socialGoogle() async { final GoogleSignIn googleSignIn = GoogleSignIn(); await googleSignIn.disconnect(); try { final GoogleSignInAccount? googleSignInAccount = await googleSignIn .signIn(); if (googleSignInAccount == null)`
*No documentation provided (generation failed).*

### `right('Google sign in was cancelled'); } final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication; final AuthCredential credential = GoogleAuthProvider.credential( accessToken: googleSignInAuthentication.accessToken, idToken: googleSignInAuthentication.idToken, ); final userCredential = await auth.signInWithCredential(credential); return left(userCredential); } catch (e)`
*No documentation provided (generation failed).*

### `right(e.toString()); } } static Future<Either<UserCredential, Dyn>> socialFacebook() async { final fb = FacebookAuth.instance; try { TrackingStatus? status; if (Platform.isIOS)`
*No documentation provided (generation failed).*

### `left(userObj); } catch (e)`
*No documentation provided (generation failed).*

### `right(e.toString()); } } static Future<Either<UserCredential, Dyn>> socialApple() async { try { final credential = await SignInWithApple.getAppleIDCredential( scopes: [ AppleIDAuthorizationScopes.email, AppleIDAuthorizationScopes.fullName, ], ); OAuthProvider oAuthProvider = OAuthProvider("apple.com"); final AuthCredential credentialApple = oAuthProvider.credential( idToken: credential.identityToken, accessToken: credential.authorizationCode, ); final userObj = await auth.signInWithCredential(credentialApple); return left(userObj); } catch (e)`
*No documentation provided (generation failed).*

### `right(e.toString()); } } static Future<void> sendCode({ required String phone, required ValueChanged<String> onSuccess, required ValueChanged<String> onError, }) async { await FirebaseAuth.instance.verifyPhoneNumber( phoneNumber: phone, verificationCompleted: (PhoneAuthCredential credential)`
*No documentation provided (generation failed).*

### `showJoin(BuildContext context, String link)`
*No documentation provided (generation failed).*
