import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rokctapp/customer/models/models.dart';

import 'package:rokctapp/customer/models/data/translation.dart';

import 'package:rokctapp/customer/models/data/career_data.dart';
import 'package:rokctapp/customer/models/response/pages_response.dart';

part 'profile_state.freezed.dart';

@freezed
sealed class ProfileState with _$ProfileState {
  const factory ProfileState({
    @Default(false) bool isLoading,
    @Default(true) bool isReferralLoading,
    @Default(false) bool isSaveLoading,
    @Default(true) bool isLoadingHistory,
    @Default(0) int typeIndex,
    @Default(0) int selectAddress,
    @Default("") String bgImage,
    @Default("") String logoImage,
    @Default(null) AddressNewModel? addressModel,
    @Default(null) ProfileData? userData,
    @Default(null) ReferralModel? referralData,
    @Default([]) List<WalletData>? walletHistory,
    @Default(false) bool isTermLoading,
    @Default(false) bool isPolicyLoading,
    @Default(null) Translation? policy,
    @Default(null) Translation? term,
    @Default([]) List<String> filepath,
    @Default([]) List<CareerData> careers,
    @Default(null) CareerData? selectedCareer,
    @Default([]) List<BlogData> blogs,
    @Default(null) BlogData? selectBlog,
    @Default([]) List<PageData> about,
  }) = _ProfileState;

  const ProfileState._();
}
