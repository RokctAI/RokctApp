# API Reference: profile_notifier

Source file: `lib/customer/application/profile/profile_notifier.dart`

## Classes

### class `ProfileNotifier`

## Whitelisted API Endpoints

### `build() => const ProfileState(); int page = 1; Future<void> getTerm({required BuildContext context}) async { state = state.copyWith(isTermLoading: state.term == null); final res = await settingsRepository.getTerm(); res.when( success: (l)`
*No documentation provided (generation failed).*

### `getPolicy({required BuildContext context}) async { state = state.copyWith(isPolicyLoading: state.policy == null); final res = await settingsRepository.getPolicy(); res.when( success: (l)`
*No documentation provided (generation failed).*

### `resetShopData()`
*No documentation provided (generation failed).*

### `findSelectIndex()`
*No documentation provided (generation failed).*

### `change(int index)`
*No documentation provided (generation failed).*

### `setAddress(dynamic data)`
*No documentation provided (generation failed).*

### `setActiveAddress({int? id, required int index}) async { List<AddressNewModel> list = List.from(state.userData?.addresses ?? []); for (var element in list)`
*No documentation provided (generation failed).*

### `deleteAddress({int? id, required int index}) async { List<AddressNewModel> list = List.from(state.userData?.addresses ?? []); list.removeAt(index); ProfileData newUser = state.userData!.copyWith(addresses: list); state = state.copyWith(userData: newUser); userRepository.deleteAddress(id: id ?? 0); } void setBgImage(String bgImage)`
*No documentation provided (generation failed).*

### `setFile(String file)`
*No documentation provided (generation failed).*

### `deleteFile(String value)`
*No documentation provided (generation failed).*

### `setLogoImage(String logoImage)`
*No documentation provided (generation failed).*

### `fetchUser(BuildContext context, { RefreshController? refreshController, VoidCallback? onSuccess, }) async { if (LocalStorage.getToken().isNotEmpty)`
*No documentation provided (generation failed).*

### `AddressNewModel(); }, ) .toAddress(), ); } state = state.copyWith(isLoading: false, userData: data.data); refreshController?.refreshCompleted(); onSuccess?.call(); findSelectIndex(); }, failure: (failure, status)`
*No documentation provided (generation failed).*

### `LoginRoute()); } AppHelpers.showCheckTopSnackBar(context, failure); }, ); } else { if (context.mounted)`
*No documentation provided (generation failed).*

### `fetchReferral(BuildContext context, { RefreshController? refreshController, }) async { if (LocalStorage.getToken().isNotEmpty)`
*No documentation provided (generation failed).*

### `logOut() async { final fcm = await FirebaseMessaging.instance.getToken(); userRepository.logoutAccount(fcm: fcm ?? ""); } Future<void> deleteAccount(BuildContext context) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `LoginRoute()); }, failure: (failure, status)`
*No documentation provided (generation failed).*

### `setUser(ProfileData user) async { state = state.copyWith(userData: user); } void getWallet( BuildContext context, { RefreshController? refreshController, }) async { page = 1; if (LocalStorage.getToken().isNotEmpty)`
*No documentation provided (generation failed).*

### `getWalletPage(BuildContext context, RefreshController refreshController, ) async { if (LocalStorage.getToken().isNotEmpty)`
*No documentation provided (generation failed).*

### `changeIndex(int index)`
*No documentation provided (generation failed).*

### `createShop({ required BuildContext context, required String tax, required String deliveryTo, required String deliveryFrom, required String phone, required String startPrice, required String name, required String desc, required String perKm, required AddressNewModel address, required String deliveryType, required num categoryId, }) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `getCareers() async { state = state.copyWith(isLoading: true); final response = await userRepository.getCareers(); response.when( success: (data)`
*No documentation provided (generation failed).*

### `getCareerData(int id) async { state = state.copyWith(isLoading: true); final response = await userRepository.getCareerData(id); response.when( success: (data)`
*No documentation provided (generation failed).*

### `getAbout() async { state = state.copyWith(isLoading: true); final response = await userRepository.getAbout(page: ++page); response.when( success: (data)`
*No documentation provided (generation failed).*

### `getBlogs() async { state = state.copyWith(isLoading: true); final response = await userRepository.getBlogs(); response.when( success: (data)`
*No documentation provided (generation failed).*

### `getSelectBlog(String uuid) async { state = state.copyWith(isLoading: true); final response = await userRepository.getSingleBlog(uuid); response.when( success: (data)`
*No documentation provided (generation failed).*
