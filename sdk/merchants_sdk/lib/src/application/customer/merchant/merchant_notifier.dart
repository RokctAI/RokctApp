import 'package:flutter/material.dart';
import 'package:core_sdk/core_sdk.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:core_sdk/core_sdk.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:core_sdk/src/models/models.dart';
import 'package:share_plus/share_plus.dart';
import 'package:core_sdk/core_sdk.dart';
import 'package:core_sdk/src/infrastructure/app_links/app_links_service.dart';
import 'package:core_sdk/src/models/data/translation.dart';
import 'package:core_sdk/core_sdk.dart';
import 'package:merchants_sdk/src/application/customer/merchant/merchant_state.dart';

class MerchantNotifier extends Notifier<MerchantState> {
  @override
  MerchantState build() => const MerchantState();

  int page = 1;
  List<String> _list = [];
  String? shareLink;

  void showWeekTime() {
    state = state.copyWith(showWeekTime: !state.showWeekTime);
  }

  void showBranch() {
    state = state.copyWith(showBranch: !state.showBranch);
  }

  void enableSearch() {
    state = state.copyWith(isSearchEnabled: !state.isSearchEnabled);
  }

  void enableNestedScroll({bool? val}) {
    state = state.copyWith(
      isNestedScrollDisabled: val ?? !state.isNestedScrollDisabled,
    );
  }

  Future<void> getRoutingAll({
    required BuildContext context,
    required LatLng start,
    required LatLng end,
  }) async {
    if (await AppConnectivity.connectivity()) {
      state = state.copyWith(polylineCoordinates: []);
      final response = await drawRepository.getRouting(start: start, end: end);
      response.when(
        success: (data) {
          List<LatLng> list = [];
          List ls = data.features[0].geometry.coordinates;
          for (int i = 0; i < ls.length; i++) {
            list.add(LatLng(ls[i][1], ls[i][0]));
          }
          state = state.copyWith(polylineCoordinates: list);
        },
        failure: (failure, status) {
          state = state.copyWith(polylineCoordinates: []);
        },
      );
    } else {
      if (context.mounted) {
        AppHelpers.showNoConnectionSnackBar(context);
      }
    }
  }

  Future<void> changeMap({required LatLng merchantLocation}) async {
    state = state.copyWith(isMapLoading: true);
    final ImageCropperForMarker image = ImageCropperForMarker();
    Set<Marker> markers = {};
    markers.addAll({
      Marker(
        markerId: const MarkerId("merchant"),
        position: merchantLocation,
        icon: await image.resizeAndCircle(state.merchantData?.logoImg ?? "", 120),
      ),
      Marker(
        markerId: const MarkerId("user"),
        position: LatLng(
          LocalStorage.getAddressSelected()?.location?.latitude ??
              AppConstants.demoLatitude,
          LocalStorage.getAddressSelected()?.location?.longitude ??
              AppConstants.demoLongitude,
        ),
        icon: await image.resizeAndCircle(LocalStorage.getUser()?.img, 120),
      ),
    });
    state = state.copyWith(isMapLoading: false, merchantMarkers: markers);
  }

  Future<void> getMarker() async {
    state = state.copyWith(
      isMapLoading: true,
      showBranch: false,
      showWeekTime: false,
    );
    final ImageCropperForMarker image = ImageCropperForMarker();
    Set<Marker> markers = {};
    markers.addAll({
      Marker(
        markerId: const MarkerId("merchant"),
        position: LatLng(
          state.merchantData?.location?.latitude ?? AppConstants.demoLatitude,
          state.merchantData?.location?.longitude ?? AppConstants.demoLongitude,
        ),
        icon: await image.resizeAndCircle(state.merchantData?.logoImg ?? "", 120),
      ),
      Marker(
        markerId: const MarkerId("user"),
        position: LatLng(
          LocalStorage.getAddressSelected()?.location?.latitude ??
              AppConstants.demoLatitude,
          LocalStorage.getAddressSelected()?.location?.longitude ??
              AppConstants.demoLongitude,
        ),
        icon: await image.resizeAndCircle(LocalStorage.getUser()?.img, 120),
      ),
    });
    state = state.copyWith(merchantMarkers: markers, isMapLoading: false);
    final res = await merchantsRepository.getMerchantBranch(
      uuid: state.merchantData?.id ?? "",
    );
    res.when(
      success: (data) {
        state = state.copyWith(branches: data.data);
      },
      failure: (t, e) {},
    );
  }

  void onLike() {
    if (state.isLike) {
      for (int i = 0; i < _list.length; i++) {
        if (_list[i] == state.merchantData?.id) {
          _list.removeAt(i);
          break;
        }
      }
    } else {
      _list.add(state.merchantData?.id ?? "");
    }
    state = state.copyWith(isLike: !state.isLike);
    LocalStorage.setSavedMerchantsList(_list);
  }

  void changeIndex(int index) {
    state = state.copyWith(currentIndex: index);
  }

  void changeSearchText(String text) {
    state = state.copyWith(searchText: text);
  }

  void changeSubIndex(int index) {
    state = state.copyWith(subCategoryIndex: index);
  }

  void checkWorkingDay() {
    int todayWeekIndex = 0;
    for (int i = 0; i < state.merchantData!.merchantWorkingDays!.length; i++) {
      if (state.merchantData!.merchantWorkingDays![i].day ==
              TimeService.dateFormatEE(DateTime.now()).toLowerCase() &&
          !(state.merchantData!.merchantWorkingDays![i].disabled ?? true)) {
        state = state.copyWith(isTodayWorkingDay: true);
        todayWeekIndex = i;
        break;
      } else {
        state = state.copyWith(isTodayWorkingDay: false);
      }
    }

    if (state.isTodayWorkingDay) {
      for (int i = 0; i < state.merchantData!.merchantClosedDate!.length; i++) {
        if (DateTime.now().year ==
                state.merchantData!.merchantClosedDate![i].day!.year &&
            DateTime.now().month ==
                state.merchantData!.merchantClosedDate![i].day!.month &&
            DateTime.now().day == state.merchantData!.merchantClosedDate![i].day!.day) {
          state = state.copyWith(isTodayWorkingDay: false);
          break;
        } else {
          state = state.copyWith(isTodayWorkingDay: true);
        }
      }
      if (state.isTodayWorkingDay) {
        TimeOfDay startTimeOfDay = TimeOfDay(
          hour:
              int.tryParse(
                state.merchantData!.merchantWorkingDays?[todayWeekIndex].from
                        ?.substring(
                          0,
                          state.merchantData!.merchantWorkingDays?[todayWeekIndex].from
                                  ?.indexOf("-") ??
                              0,
                        ) ??
                    "",
              ) ??
              0,
          minute:
              int.tryParse(
                state.merchantData!.merchantWorkingDays?[todayWeekIndex].from
                        ?.substring(
                          (state.merchantData!.merchantWorkingDays?[todayWeekIndex].from
                                      ?.indexOf("-") ??
                                  0) +
                              1,
                        ) ??
                    "",
              ) ??
              0,
        );
        TimeOfDay endTimeOfDay = TimeOfDay(
          hour:
              int.tryParse(
                state.merchantData!.merchantWorkingDays?[todayWeekIndex].to?.substring(
                      0,
                      state.merchantData!.merchantWorkingDays?[todayWeekIndex].to
                              ?.indexOf("-") ??
                          0,
                    ) ??
                    "",
              ) ??
              0,
          minute:
              int.tryParse(
                state.merchantData!.merchantWorkingDays?[todayWeekIndex].to?.substring(
                      (state.merchantData!.merchantWorkingDays?[todayWeekIndex].to
                                  ?.indexOf("-") ??
                              0) +
                          1,
                    ) ??
                    "",
              ) ??
              0,
        );
        state = state.copyWith(
          startTodayTime: startTimeOfDay,
          endTodayTime: endTimeOfDay,
        );
      }
    }
  }

  Future<void> setMerchant(MerchantData merchant) async {
    _list = LocalStorage.getSavedMerchantsList();
    for (String e in _list) {
      if (e == merchant.id) {
        state = state.copyWith(isLike: true);
        break;
      }
    }
    state = state.copyWith(merchantData: merchant);
    generateShareLink();
    checkWorkingDay();
    final response = await merchantsRepository.getSingleMerchant(
      uuid: (merchant.id ?? "").toString(),
    );
    response.when(
      success: (data) async {
        _list = LocalStorage.getSavedMerchantsList();
        for (String e in _list) {
          if (e == data.data?.id) {
            state = state.copyWith(isLike: true);
            break;
          }
        }
        state = state.copyWith(merchantData: data.data);
        checkWorkingDay();
      },
      failure: (failure, status) {},
    );
  }

  void leaveGroup() {
    state = state.copyWith(userUuid: "", isGroupOrder: false);
  }

  Future<void> joinOrder(
    BuildContext context,
    String merchantId,
    String cartId,
    String name,
    VoidCallback onSuccess,
  ) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isJoinOrder: true);
      final response = await merchantsRepository.joinOrder(
        merchantId: merchantId,
        name: name,
        cartId: cartId,
      );
      response.when(
        success: (data) async {
          state = state.copyWith(
            isJoinOrder: false,
            isGroupOrder: true,
            userUuid: data,
          );
          onSuccess();
        },
        failure: (failure, status) {
          state = state.copyWith(
            isJoinOrder: false,
            userUuid: "",
            isGroupOrder: false,
          );
        },
      );
    } else {
      if (context.mounted) {
        AppHelpers.showNoConnectionSnackBar(context);
      }
    }
  }

  Future<void> fetchMerchant(BuildContext context, String uuid) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isLoading: true);
      final response = await merchantsRepository.getSingleMerchant(uuid: uuid);
      response.when(
        success: (data) async {
          _list = LocalStorage.getSavedMerchantsList();
          for (String e in _list) {
            if (e == data.data?.id) {
              state = state.copyWith(isLike: true);
              break;
            }
          }
          state = state.copyWith(isLoading: false, merchantData: data.data);
          generateShareLink();
          checkWorkingDay();
        },
        failure: (failure, status) {
          state = state.copyWith(isLoading: false);
          AppHelpers.showCheckTopSnackBar(context, failure);
        },
      );
    } else {
      if (context.mounted) {
        AppHelpers.showNoConnectionSnackBar(context);
      }
    }
  }

  Future<bool> fetchCategory(BuildContext context, String merchantId) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isCategoryLoading: true);
      final response = await categoriesRepository.getCategoriesByMerchant(
        merchantId: merchantId,
      );
      response.when(
        success: (data) async {
          state = state.copyWith(category: data.data, isCategoryLoading: false);
          return true;
        },
        failure: (failure, status) {
          state = state.copyWith(isCategoryLoading: false);
          AppHelpers.showCheckTopSnackBar(context, failure);
          return false;
        },
      );
      return false;
    } else {
      if (context.mounted) {
        AppHelpers.showNoConnectionSnackBar(context);
      }
      return false;
    }
  }

  Future<void> fetchProducts(
    BuildContext context,
    String merchantId,
    ValueChanged<int> onSuccess,
  ) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      page = 1;
      state = state.copyWith(isProductLoading: true, isCategoryLoading: true);
      final response = await productsRepository.getAllProducts(merchantId: merchantId);
      response.when(
        success: (data) {
          List<All> allList = data.data?.all ?? [];
          for (int i = 0; i < allList.length; i++) {
            allList[i] = allList[i].copyWith(key: GlobalKey());
          }
          if (data.data?.recommended?.isNotEmpty ?? false) {
            allList.insert(
              0,
              All(
                translation: Translation(
                  title: AppHelpers.getTranslation(TrKeys.popular),
                ),
                key: GlobalKey(),
                products: data.data?.recommended ?? [],
              ),
            );
          }
          state = state.copyWith(allData: allList);
          onSuccess.call(allList.length);
        },
        failure: (failure, status) {
          AppHelpers.showCheckTopSnackBar(context, failure);
        },
      );
    } else {
      if (context.mounted) {
        AppHelpers.showNoConnectionSnackBar(context);
      }
    }
    state = state.copyWith(isProductLoading: false, isCategoryLoading: false);
  }

  Future<void> checkProductsPopular(BuildContext context, String merchantId) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      page = 1;
      final response = await productsRepository.getProductsPopularPaginate(
        page: 1,
        merchantId: merchantId,
      );
      response.when(
        success: (data) {
          state = state.copyWith(
            isPopularProduct: (data.data ?? []).isNotEmpty,
          );
        },
        failure: (failure, status) {
          AppHelpers.showCheckTopSnackBar(context, failure);
        },
      );
    } else {
      if (context.mounted) {
        AppHelpers.showNoConnectionSnackBar(context);
      }
    }
  }

  // Future<void> fetchProductsPopular(BuildContext context, String merchantId) async {
  //   final connected = await AppConnectivity.connectivity();
  //   if (connected) {
  //     page = 1;
  //     state = state.copyWith(
  //       isProductLoading: true,
  //     );
  //     final response = await productsRepository.getProductsPopularPaginate(
  //         page: 1, merchantId: merchantId);
  //     response.when(
  //       success: (data) {
  //         state = state.copyWith(
  //             popularProducts: data.data
  //                     ?.map((e) => ProductData.fromJson(e.toJson()))
  //                     .toList() ??
  //                 [],
  //             isProductLoading: false,
  //             isPopularProduct: (data.data ?? []).isNotEmpty);
  //       },
  //       failure: (failure, status) {
  //         state = state.copyWith(isProductLoading: false);
  //         AppHelpers.showCheckTopSnackBar(
  //           context,
  //           failure,
  //         );
  //       },
  //     );
  //   } else {
  //     if (context.mounted) {
  //       AppHelpers.showNoConnectionSnackBar(
  //         context,
  //       );
  //     }
  //   }
  // }

  Future<void> fetchProductsByCategory(
    BuildContext context,
    String merchantId,
    String categoryId,
  ) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isProductCategoryLoading: true);
      page = 1;
      final response = await productsRepository
          .getProductsMerchantByCategoryPaginate(
            page: 1,
            merchantId: merchantId,
            categoryId: categoryId,
            sortIndex: state.sortIndex,
            brands: state.brandIds.map((id) => id.toString()).toList(),
          );
      response.when(
        success: (data) {
          state = state.copyWith(
            categoryProducts: data.data ?? [],
            isProductCategoryLoading: false,
          );
        },
        failure: (failure, status) {
          state = state.copyWith(isProductCategoryLoading: false);
          AppHelpers.showCheckTopSnackBar(context, failure);
        },
      );
    } else {
      if (context.mounted) {
        AppHelpers.showNoConnectionSnackBar(context);
      }
    }
  }

  Future<void> fetchProductsByCategoryPage(
    BuildContext context,
    String merchantId,
    String categoryId, {
    RefreshController? controller,
  }) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      final response = await productsRepository
          .getProductsMerchantByCategoryPaginate(
            page: ++page,
            merchantId: merchantId,
            categoryId: categoryId,
          );
      response.when(
        success: (data) {
          List<ProductData> list = List.from(state.categoryProducts);
          list.addAll(data.data!.toList());
          state = state.copyWith(categoryProducts: list);
          if (data.data?.isEmpty ?? true) {
            controller?.loadNoData();
            return;
          }
          controller?.loadComplete();
        },
        failure: (failure, status) {
          controller?.loadComplete();

          AppHelpers.showCheckTopSnackBar(context, failure);
        },
      );
    } else {
      if (context.mounted) {
        AppHelpers.showNoConnectionSnackBar(context);
      }
    }
  }

  // Future<void> fetchProductsPage(BuildContext context, String merchantId,
  //     {RefreshController? controller}) async {
  //   final connected = await AppConnectivity.connectivity();
  //   if (connected) {
  //     final response = await productsRepository.getProductsPaginate(
  //         page: ++page, merchantId: merchantId);
  //     response.when(
  //       success: (data) {
  //         List<ProductData> list = List.from(state.products);
  //         list.addAll(data.data!.toList());
  //         state = state.copyWith(
  //           products:
  //               list.map((e) => ProductData.fromJson(e.toJson())).toList(),
  //         );
  //         if (data.data?.isEmpty ?? true) {
  //           controller?.loadNoData();
  //           return;
  //         }
  //
  //         controller?.loadComplete();
  //       },
  //       failure: (failure, status) {
  //         controller?.loadComplete();
  //         AppHelpers.showCheckTopSnackBar(
  //           context,
  //           failure,
  //         );
  //       },
  //     );
  //   } else {
  //     if (context.mounted) {
  //       AppHelpers.showNoConnectionSnackBar(
  //         context,
  //       );
  //     }
  //   }
  // }

  // Future<void> fetchProductsPopularPage(BuildContext context, String merchantId,
  //     {RefreshController? controller}) async {
  //   final connected = await AppConnectivity.connectivity();
  //   if (connected) {
  //     final response = await productsRepository.getProductsPopularPaginate(
  //         page: ++page, merchantId: merchantId);
  //     response.when(
  //       success: (data) {
  //         List<ProductData> list = List.from(state.products);
  //         list.addAll(data.data ?? []);
  //         state = state.copyWith(products: list);
  //         if (data.data?.isEmpty ?? true) {
  //           controller?.loadNoData();
  //           return;
  //         }
  //
  //         controller?.loadComplete();
  //       },
  //       failure: (failure, status) {
  //         controller?.loadComplete();
  //         AppHelpers.showCheckTopSnackBar(
  //           context,
  //           failure,
  //         );
  //       },
  //     );
  //   } else {
  //     if (context.mounted) {
  //       AppHelpers.showNoConnectionSnackBar(
  //         context,
  //       );
  //     }
  //   }
  // }

  Future<void> fetchBrands(BuildContext context, int categoryId) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      final response = await brandsRepository.getAllBrands(
        categoryId: categoryId,
      );
      response.when(
        success: (data) {
          state = state.copyWith(brands: data.data);
        },
        failure: (failure, status) {
          AppHelpers.showCheckTopSnackBar(context, failure);
        },
      );
    } else {
      if (context.mounted) {
        AppHelpers.showNoConnectionSnackBar(context);
      }
    }
  }

  void setBrands({required int id}) {
    List<int> list = List.from(state.brandIds);
    if (list.contains(id)) {
      list.remove(id);
    } else {
      list.add(id);
    }
    state = state.copyWith(brandIds: list);
  }

  void clear() {
    state = state.copyWith(brandIds: [], sortIndex: 0);
  }

  void changeSort(int index) {
    state = state.copyWith(sortIndex: index);
  }

  Future<void> generateShareLink() async {
    shareLink = AppLinksService.createDeepLink(
      path: 'merchant/${state.merchantData?.id}',
      parameters: {'merchant_id': state.merchantData?.id?.toString() ?? ''},
    );
    debugPrint("share link: merchant_notifier $shareLink");
  }

  Future<void> onShare() async {
    SharePlus.instance.share(
      ShareParams(
        text: shareLink,
        sharePositionOrigin: Rect.fromLTWH(0, 0, 100, 100),
      ),
    );
  }
}

