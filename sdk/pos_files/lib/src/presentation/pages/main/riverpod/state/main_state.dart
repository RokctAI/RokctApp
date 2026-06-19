import 'package:admin_desktop/src/models/data/order_data.dart';
import 'package:admin_desktop/src/models/response/product_calculate_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:admin_desktop/src/models/models.dart';

part 'main_state.freezed.dart';

@freezed
abstract class MainState with _$MainState {
  const factory MainState({
    @Default(false) bool isProductsLoading,
    @Default(false) bool isMoreProductsLoading,
    @Default(false) bool isShopsLoading,
    @Default(false) bool isCombo,
    @Default(false) bool isComboLoading,
    @Default(false) bool isMoreComboLoading,
    @Default(false) bool isBrandsLoading,
    @Default(false) bool isCategoriesLoading,
    @Default(true) bool hasMore,
    @Default(true) bool hasMoreCombo,
    @Default(0) int selectIndex,
    @Default([]) List<ProductData> products,
    @Default([]) List<ProductData> combos,
    @Default([]) List<CategoryData> categories,
    @Default([]) List<CategoryData> comboCategories,
    @Default([]) List<ShopData> shops,
    @Default([]) List<BrandData> brands,
    @Default([]) List<DropDownItemData> dropDownShops,
    @Default([]) List<DropDownItemData> dropDownCategories,
    @Default([]) List<DropDownItemData> dropDownBrands,
    @Default('') String query,
    @Default('') String shopQuery,
    @Default('') String categoryQuery,
    @Default('') String brandQuery,
    @Default('single') String productType,
    ShopData? selectedShop,
    CategoryData? selectedCategory,
    CategoryData? selectedMainCategory,
    BrandData? selectedBrand,
    OrderData? selectedOrder,
    PriceDate? priceDate,
  }) = _MainState;

  const MainState._();
}
