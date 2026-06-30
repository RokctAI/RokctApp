import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:core_sdk/src/models/models.dart';

part 'home_state.freezed.dart';

@freezed
sealed class HomeState with _$HomeState {
  const factory HomeState({
    @Default(true) bool isCategoryLoading,
    @Default(true) bool isBannerLoading,
    @Default(true) bool isShopLoading,
    @Default(true) bool isRestaurantLoading,
    @Default(true) bool isRestaurantNewLoading,
    @Default(true) bool isStoryLoading,
    @Default(true) bool isShopRecommendLoading,
    @Default(-1) int totalShops,
    @Default(-1) int selectIndexCategory,
    @Default(-1) int selectIndexSubCategory,
    @Default(0) int isSelectCategoryLoading,
    @Default(null) AddressNewModel? addressData,
    @Default([]) List<CategoryData> categories,
    @Default([]) List<BannerData> banners,
    @Default([]) List<BannerData> ads,
    @Default(null) BannerData? banner,
    @Default([]) List<MerchantData> shops,
    @Default([]) List<MerchantData> restaurant,
    @Default([]) List<MerchantData> newRestaurant,
    @Default([]) List<List<StoryModel?>?>? story,
    @Default([]) List<MerchantData> shopsRecommend,
    @Default([]) List<MerchantData> filterShops,
    @Default([]) List<MerchantData> filterMarket,
  }) = _HomeState;

  const HomeState._();
}

