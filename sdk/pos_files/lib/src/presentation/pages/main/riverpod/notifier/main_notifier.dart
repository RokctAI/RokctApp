// ignore_for_file: prefer_null_aware_operators

import 'dart:async';
import 'package:admin_desktop/src/core/di/dependency_manager.dart';
import 'package:admin_desktop/src/models/data/order_data.dart';
import 'package:admin_desktop/src/models/response/product_calculate_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:admin_desktop/src/core/constants/constants.dart';
import 'package:admin_desktop/src/core/utils/utils.dart';
import 'package:admin_desktop/src/models/models.dart';
import '../../../../../repository/repository.dart';
import '../state/main_state.dart';

class MainNotifier extends StateNotifier<MainState> {
  final BrandsRepository _brandsRepository;
  final UsersRepository _usersRepository;

  Timer? _searchProductsTimer;
  Timer? _searchCategoriesTimer;
  Timer? _searchBrandsTimer;
  int _page = 0;
  int _comboPage = 0;

  MainNotifier(this._brandsRepository, this._usersRepository)
    : super(const MainState());

  void changeCombo(bool isCombo) {
    state = state.copyWith(isCombo: isCombo);
  }

  Future<void> fetchProducts(BuildContext context, {bool? isRefresh}) async {
    if (isRefresh ?? false) {
      _page = 0;
    } else if (!state.hasMore) {
      return;
    }
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      if (_page == 0) {
        state = state.copyWith(isProductsLoading: true, products: []);
        final response = await productsRepository.getProductsPaginate(
          page: ++_page,
          query: state.query.isEmpty ? null : state.query,
          shopId: state.selectedShop?.id,
          categoryId: state.selectedCategory?.id,
          brandId: state.selectedBrand?.id,
        );
        response.when(
          success: (data) {
            state = state.copyWith(
              products: data.data ?? [],
              isProductsLoading: false,
            );
            if ((data.data?.length ?? 0) < 16) {
              state = state.copyWith(hasMore: false);
            }
          },
          failure: (failure) {
            state = state.copyWith(isProductsLoading: false);
            debugPrint('==> get products failure: $failure');
          },
        );
      } else {
        state = state.copyWith(isMoreProductsLoading: true);
        final response = await productsRepository.getProductsPaginate(
          page: ++_page,
          query: state.query.isEmpty ? null : state.query,
          shopId: state.selectedShop?.id,
          categoryId: state.selectedCategory?.id,
          brandId: state.selectedBrand?.id,
        );
        response.when(
          success: (data) async {
            final List<ProductData> newList = List.from(state.products);
            newList.addAll(data.data ?? []);
            state = state.copyWith(
              products: newList,
              isMoreProductsLoading: false,
            );
            if ((data.data?.length ?? 0) < 12) {
              state = state.copyWith(hasMore: false);
            }
          },
          failure: (failure) {
            state = state.copyWith(isMoreProductsLoading: false);
            debugPrint('==> get products more failure: $failure');
            AppHelpers.showSnackBar(context, failure);
          },
        );
      }
    } else {
      AppHelpers.showSnackBar(
        // ignore: use_build_context_synchronously
        context,
        AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
      );
    }
  }

  Future<void> fetchComboProducts({
    required BuildContext context,
    bool? isRefresh,
  }) async {
    if (isRefresh ?? false) {
      _comboPage = 0;
    } else if (!state.hasMoreCombo) {
      return;
    }
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      if (_comboPage == 0) {
        state = state.copyWith(isProductsLoading: true, products: []);
        final response = await productsRepository.getCombosPaginate(
          page: ++_comboPage,
          query: state.query.isEmpty ? null : state.query,
          shopId: state.selectedShop?.id,
          categoryId: state.selectedCategory?.id,
        );
        response.when(
          success: (data) {
            state = state.copyWith(
              combos: data.data ?? [],
              isComboLoading: false,
            );
            if ((data.data?.length ?? 0) < 16) {
              state = state.copyWith(hasMoreCombo: false);
            }
          },
          failure: (failure) {
            state = state.copyWith(isProductsLoading: false);
            debugPrint('==> get products failure: $failure');
          },
        );
      } else {
        state = state.copyWith(isMoreProductsLoading: true);
        final response = await productsRepository.getProductsPaginate(
          page: ++_page,
          query: state.query.isEmpty ? null : state.query,
          shopId: state.selectedShop?.id,
          categoryId: state.selectedCategory?.id,
          brandId: state.selectedBrand?.id,
        );
        response.when(
          success: (data) async {
            final List<ProductData> newList = List.from(state.products);
            newList.addAll(data.data ?? []);
            state = state.copyWith(
              products: newList,
              isMoreProductsLoading: false,
            );
            if ((data.data?.length ?? 0) < 12) {
              state = state.copyWith(hasMore: false);
            }
          },
          failure: (failure) {
            state = state.copyWith(isMoreProductsLoading: false);
            debugPrint('==> get products more failure: $failure');
            AppHelpers.showSnackBar(context, failure);
          },
        );
      }
    } else {
      AppHelpers.showSnackBar(
        // ignore: use_build_context_synchronously
        context,
        AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
      );
    }
  }

  void changeIndex(int index) {
    state = state.copyWith(selectIndex: index);
  }

  void setOrder(OrderData? order) {
    state = state.copyWith(selectedOrder: order);
  }

  void setPriceDate(PriceDate? priceDate) {
    state = state.copyWith(priceDate: priceDate);
  }

  Future<void> fetchUserDetail(BuildContext context) async {
    final response = await _usersRepository.getProfileDetails(context);
    response.when(
      success: (data) async {
        LocalStorage.setUser(data.data);
      },
      failure: (failure) {
        debugPrint('==> get user detail failure: $failure');
      },
    );
  }

  void setProductsQuery(BuildContext context, String query) {
    if (state.query == query) {
      return;
    }
    state = state.copyWith(query: query.trim());
    if (state.query.isNotEmpty) {
      if (_searchProductsTimer?.isActive ?? false) {
        _searchProductsTimer?.cancel();
      }
      _searchProductsTimer = Timer(const Duration(milliseconds: 500), () {
        state = state.copyWith(hasMore: true, products: []);
        _page = 0;
        fetchProducts(context);
      });
    } else {
      if (_searchProductsTimer?.isActive ?? false) {
        _searchProductsTimer?.cancel();
      }
      _searchProductsTimer = Timer(const Duration(milliseconds: 500), () {
        state = state.copyWith(hasMore: true, products: []);
        _page = 0;
        fetchProducts(context);
      });
    }
  }

  Future<void> fetchCategories({required BuildContext context}) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(
        isCategoriesLoading: true,
        comboCategories: [],
        categories: [],
      );
      final response = await categoriesRepository.searchCategories(
        1,
        query: state.categoryQuery.isEmpty ? null : state.categoryQuery,
      );
      response.when(
        success: (data) async {
          final List<CategoryData> categories = data.data ?? [];
          state = state.copyWith(
            isCategoriesLoading: false,
            categories: categories,
          );
        },
        failure: (failure) {
          state = state.copyWith(isCategoriesLoading: false);
        },
      );

      final res = await categoriesRepository.searchCategories(
        1,
        query: state.categoryQuery.isEmpty ? null : state.categoryQuery,
        type: 'combo',
      );
      res.when(
        success: (data) async {
          final List<CategoryData> categories = data.data ?? [];
          state = state.copyWith(
            isCategoriesLoading: false,
            comboCategories: categories,
          );
        },
        failure: (failure) {
          state = state.copyWith(isCategoriesLoading: false);
        },
      );
    } else {}
  }

  void setCategoriesQuery(BuildContext context, String query) {
    debugPrint('===> set categories query: $query');
    if (state.categoryQuery == query) {
      return;
    }
    state = state.copyWith(categoryQuery: query.trim());
    if (_searchCategoriesTimer?.isActive ?? false) {
      _searchCategoriesTimer?.cancel();
    }
    _searchCategoriesTimer = Timer(const Duration(milliseconds: 500), () {
      state = state.copyWith(categories: [], dropDownCategories: []);
      fetchCategories(context: context);
    });
  }

  void removeSelectedCategory(BuildContext context) {
    state = state.copyWith(selectedCategory: null, hasMore: true);
    _page = 0;
    fetchProducts(context);
  }

  void setProductType(BuildContext context, String type) {
    if (state.productType == type) {
      return;
    }
    state = state.copyWith(productType: type, hasMore: true);
    _page = 0;
    fetchProducts(context);
  }

  Future<void> fetchBrands({VoidCallback? checkYourNetwork}) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(
        isBrandsLoading: true,
        dropDownBrands: [],
        brands: [],
      );
      final response = await _brandsRepository.searchBrands(
        state.brandQuery.isEmpty ? null : state.brandQuery,
      );
      response.when(
        success: (data) async {
          final List<BrandData> brands = data.data ?? [];
          List<DropDownItemData> dropdownBrands = [];
          for (int i = 0; i < brands.length; i++) {
            dropdownBrands.add(
              DropDownItemData(
                index: i,
                title: brands[i].title ?? 'No category title',
              ),
            );
          }
          state = state.copyWith(
            isBrandsLoading: false,
            brands: brands,
            dropDownBrands: dropdownBrands,
          );
        },
        failure: (failure) {
          state = state.copyWith(isBrandsLoading: false);
          debugPrint('==> get brands failure: $failure');
        },
      );
    } else {
      checkYourNetwork?.call();
    }
  }

  void setBrandsQuery(BuildContext context, String query) {
    if (state.brandQuery == query) {
      return;
    }
    state = state.copyWith(brandQuery: query.trim());
    if (_searchBrandsTimer?.isActive ?? false) {
      _searchBrandsTimer?.cancel();
    }
    _searchBrandsTimer = Timer(const Duration(milliseconds: 500), () {
      state = state.copyWith(brands: [], dropDownBrands: []);
      fetchBrands(
        checkYourNetwork: () {
          AppHelpers.showSnackBar(
            context,
            AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
          );
        },
      );
    });
  }

  void setSelectedBrand(BuildContext context, int index) {
    final brand = state.brands[index];
    state = state.copyWith(selectedBrand: brand, hasMore: true);
    _page = 0;
    fetchProducts(context);
    setBrandsQuery(context, '');
  }

  void removeSelectedBrand(BuildContext context) {
    state = state.copyWith(selectedBrand: null, hasMore: true);
    _page = 0;
    fetchProducts(context);
  }

  void setSelectedCategory(BuildContext context, CategoryData? category) {
    if (category == null) {
      state = state.copyWith(selectedCategory: null, hasMore: true);
    } else {
      if (category.id != state.selectedCategory?.id) {
        state = state.copyWith(selectedCategory: category, hasMore: true);
      } else {
        state = state.copyWith(selectedCategory: null, hasMore: true);
      }
    }

    fetchProducts(context, isRefresh: true);
    fetchComboProducts(context: context, isRefresh: true);
    setCategoriesQuery(context, '');
  }

  void setSelectedMainCategory(BuildContext context, CategoryData? category) {
    if (category == null) {
      state = state.copyWith(
        selectedMainCategory: null,
        selectedCategory: null,
      );
    } else {
      state = state.copyWith(
        selectedMainCategory: category,
        selectedCategory: category,
      );
    }

    fetchProducts(context, isRefresh: true);
    fetchComboProducts(context: context, isRefresh: true);
    setCategoriesQuery(context, '');
  }
}
