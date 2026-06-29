import 'package:core_sdk/core_sdk.dart';
import 'package:auth_sdk/auth_sdk.dart';
import '../../models/data/address_new_model.dart';
import '../../models/data/referral_data.dart';
import '../../models/data/career_data.dart';
import '../../models/data/links.dart';
import '../../models/response/wallet_histories_response.dart';
import '../../models/response/pages_response.dart';
import '../../models/response/blog_response.dart';
import '../../models/response/career_response.dart';
import '../../models/request/edit_profile.dart';
import '../../models/data/blog_data.dart';
import '../../models/response/profile_response.dart';

abstract class UserRepositoryFacade {
  Future<ApiResult<ProfileResponse>> getProfileDetails();

  Future<ApiResult<ReferralModel>> getReferralDetails();

  Future<ApiResult<CareerDataResponse>> getCareers();

  Future<ApiResult<CareerData>> getCareerData(int id);

  Future<ApiResult<BlogResponse>> getBlogs();

  Future<ApiResult<BlogData>> getSingleBlog(String uuid);

  Future<ApiResult<dynamic>> saveLocation({required AddressNewModel? address});

  Future<ApiResult<dynamic>> updateLocation({
    required AddressNewModel? address,
    required int? addressId,
  });

  Future<ApiResult<dynamic>> setActiveAddress({required int id});

  Future<ApiResult<dynamic>> deleteAddress({required int id});

  Future<ApiResult<dynamic>> deleteAccount();

  Future<ApiResult<dynamic>> logoutAccount({required String fcm});

  Future<ApiResult<ProfileResponse>> editProfile({required EditProfile? user});

  Future<ApiResult<PagesResponse>> getAbout({required int page});

  Future<ApiResult<ProfileResponse>> updateProfileImage({
    required String firstName,
    required String imageUrl,
  });

  Future<ApiResult<ProfileResponse>> updatePassword({
    required String password,
    required String passwordConfirmation,
  });

  Future<ApiResult<WalletHistoriesResponse>> getWalletHistories(int page);

  Future<ApiResult<void>> updateFirebaseToken(String? token);
}

