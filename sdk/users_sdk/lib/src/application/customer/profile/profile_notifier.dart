import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:core_sdk/core_sdk.dart';
import 'package:auth_sdk/auth_sdk.dart';

import 'package:users_sdk/users_sdk.dart';
import '../../domain/interface/user_repository_facade.dart';
import '../../models/data/address_new_model.dart';
import '../../models/data/links.dart';
import '../../models/response/wallet_histories_response.dart';
import '../../models/response/blog_response.dart';
import '../../models/data/blog_data.dart';
import '../users_providers.dart';
import 'profile_state.dart';

class ProfileNotifier extends Notifier<ProfileState> {
  @override
  ProfileState build() => const ProfileState();

  int page = 1;

  Future<void> getTerm({required BuildContext context}) async {
    state = state.copyWith(isTermLoading: state.term == null);
    final res = await ref.read(settingsRepositoryProvider).getTerm();
    res.when(
      success: (l) {
        state = state.copyWith(isTermLoading: false, term: l);
      },
      failure: (r, status) {
        state = state.copyWith(isTermLoading: false);
        ref.read(snackBarProvider).call(context, r.toString());
      },
    );
  }

  Future<void> getPolicy({required BuildContext context}) async {
    state = state.copyWith(isPolicyLoading: state.policy == null);
    final res = await ref.read(settingsRepositoryProvider).getPolicy();
    res.when(
      success: (l) {
        state = state.copyWith(isPolicyLoading: false, policy: l);
      },
      failure: (r, status) {
        state = state.copyWith(isPolicyLoading: false);
        ref.read(snackBarProvider).call(context, r.toString());
      },
    );
  }

  void resetShopData() {
    state = state.copyWith(
      bgImage: "",
      logoImage: "",
      addressModel: null,
      isSaveLoading: false,
    );
  }

  void findSelectIndex() {
    for (int i = 0; i < (state.userData?.addresses?.length ?? 0); i++) {
      if (state.userData?.addresses?[i].active ?? false) {
        state = state.copyWith(selectAddress: i);
        break;
      }
    }
  }

  void change(int index) {
    state = state.copyWith(selectAddress: index);
  }

  void setAddress(dynamic data) {
    state = state.copyWith(addressModel: data);
  }

  Future<void> setActiveAddress({int? id, required int index}) async {
    List<AddressNewModel> list = (state.userData?.addresses ?? [])
        .map((e) => e is AddressNewModel ? e : AddressNewModel.fromJson(e))
        .toList();
    for (var element in list) {
      element.active = false;
    }
    list[index].active = true;
    ProfileData newUser = state.userData!.copyWith(addresses: list);
    state = state.copyWith(userData: newUser);
    ref.read(userRepositoryProvider).setActiveAddress(id: id ?? 0);
  }

  Future<void> deleteAddress({int? id, required int index}) async {
    List<AddressNewModel> list = (state.userData?.addresses ?? [])
        .map((e) => e is AddressNewModel ? e : AddressNewModel.fromJson(e))
        .toList();
    list.removeAt(index);
    ProfileData newUser = state.userData!.copyWith(addresses: list);
    state = state.copyWith(userData: newUser);
    ref.read(userRepositoryProvider).deleteAddress(id: id ?? 0);
  }

  void setBgImage(String bgImage) {
    state = state.copyWith(bgImage: bgImage);
  }

  void setFile(String file) {
    List<String> list = List.from(state.filepath);
    list.add(file);
    state = state.copyWith(filepath: list);
  }

  void deleteFile(String value) {
    List<String> list = List.from(state.filepath);
    list.remove(value);
    state = state.copyWith(filepath: list);
  }

  void setLogoImage(String logoImage) {
    state = state.copyWith(logoImage: logoImage);
  }

  Future<void> fetchUser(
    BuildContext context, {
    RefreshController? refreshController,
    VoidCallback? onSuccess,
  }) async {
    if (ref.read(getTokenProvider).call().isNotEmpty) {
      final connected = await ref.read(connectivityProvider).call();
      if (connected) {
        if (refreshController == null) {
          state = state.copyWith(isLoading: true);
        }
        final response = await ref
            .read(userRepositoryProvider)
            .getProfileDetails();
        response.when(
          success: (data) async {
            await ref.read(setWalletDataProvider).call(data.data?.wallet);
            await ref.read(setUserProvider).call(data.data);
            if ((data.data?.addresses?.isNotEmpty ?? false) &&
                (data.data?.addresses?.first.location?.length == 2)) {
              final activeModel = (data.data!.addresses!
                  .map(
                    (e) =>
                        e is AddressNewModel ? e : AddressNewModel.fromJson(e),
                  )
                  .firstWhere(
                    (element) => element.active ?? false,
                    orElse: () => AddressNewModel(),
                  ));
              if (activeModel.id != null) {
                await ref
                    .read(setAddressSelectedProvider)
                    .call(activeModel.toAddress());
              }
            }
            state = state.copyWith(isLoading: false, userData: data.data);
            refreshController?.refreshCompleted();
            onSuccess?.call();
            findSelectIndex();
          },
          failure: (failure, status) {
            if (refreshController == null) {
              state = state.copyWith(isLoading: false);
            }
            if (status == 401) {
              ref.read(logoutNavigationProvider).call(context);
            }
            ref.read(snackBarProvider).call(context, failure);
          },
        );
      } else {
        if (context.mounted) {
          ref.read(noConnectionSnackBarProvider).call(context);
        }
      }
    }
  }

  Future<void> fetchReferral(
    BuildContext context, {
    RefreshController? refreshController,
  }) async {
    if (ref.read(getTokenProvider).call().isNotEmpty) {
      final connected = await ref.read(connectivityProvider).call();
      if (connected) {
        if (refreshController == null) {
          state = state.copyWith(isReferralLoading: true);
        }
        final response = await ref
            .read(userRepositoryProvider)
            .getReferralDetails();
        response.when(
          success: (data) async {
            if (refreshController == null) {
              state = state.copyWith(
                isReferralLoading: false,
                referralData: data,
              );
            } else {
              state = state.copyWith(referralData: data);
            }
            refreshController?.refreshCompleted();
          },
          failure: (failure, status) {
            if (refreshController == null) {
              state = state.copyWith(isReferralLoading: false);
            }
            // ref.read(snackBarProvider).call(context, failure);
          },
        );
      } else {
        if (context.mounted) {
          ref.read(noConnectionSnackBarProvider).call(context);
        }
      }
    }
  }

  Future<void> logOut() async {
    final fcm = await ref.read(firebaseGetFcmTokenProvider).call();
    ref.read(userRepositoryProvider).logoutAccount(fcm: fcm ?? "");
  }

  Future<void> deleteAccount(BuildContext context) async {
    final connected = await ref.read(connectivityProvider).call();
    if (connected) {
      state = state.copyWith(isLoading: true);
      final response = await ref.read(userRepositoryProvider).deleteAccount();
      response.when(
        success: (data) async {
          ref.read(logoutNavigationProvider).call(context);
        },
        failure: (failure, status) {
          state = state.copyWith(isLoading: false);
          ref.read(snackBarProvider).call(context, failure);
        },
      );
    } else {
      if (context.mounted) {
        ref.read(noConnectionSnackBarProvider).call(context);
      }
    }
  }

  void setUser(ProfileData user) async {
    state = state.copyWith(userData: user);
  }

  void getWallet(
    BuildContext context, {
    RefreshController? refreshController,
  }) async {
    page = 1;
    if (ref.read(getTokenProvider).call().isNotEmpty) {
      final connected = await ref.read(connectivityProvider).call();
      if (connected) {
        if (refreshController == null) {
          state = state.copyWith(isLoadingHistory: true);
        }
        final response = await ref
            .read(userRepositoryProvider)
            .getWalletHistories(1);
        response.when(
          success: (data) async {
            if (refreshController == null) {
              state = state.copyWith(
                isLoadingHistory: false,
                walletHistory: data.data,
              );
            } else {
              state = state.copyWith(walletHistory: data.data);
            }
            refreshController?.refreshCompleted();
          },
          failure: (failure, status) {
            if (refreshController == null) {
              state = state.copyWith(isLoadingHistory: false);
            }
            ref.read(snackBarProvider).call(context, failure);
          },
        );
      } else {
        if (context.mounted) {
          ref.read(noConnectionSnackBarProvider).call(context);
        }
      }
    }
  }

  void getWalletPage(
    BuildContext context,
    RefreshController refreshController,
  ) async {
    if (ref.read(getTokenProvider).call().isNotEmpty) {
      final connected = await ref.read(connectivityProvider).call();
      if (connected) {
        final response = await ref
            .read(userRepositoryProvider)
            .getWalletHistories(++page);
        response.when(
          success: (data) async {
            List<WalletData> list = List.from(state.walletHistory ?? []);
            list.addAll(data.data ?? []);
            state = state.copyWith(walletHistory: list);
            refreshController.loadComplete();
            if (data.data?.isEmpty ?? true) {
              refreshController.loadNoData();
            } else {
              refreshController.loadComplete();
            }
          },
          failure: (failure, status) {
            refreshController.loadNoData();
            --page;
            ref.read(snackBarProvider).call(context, failure);
          },
        );
      } else {
        if (context.mounted) {
          ref.read(noConnectionSnackBarProvider).call(context);
        }
      }
    }
  }

  void changeIndex(int index) {
    state = state.copyWith(typeIndex: index);
  }

  Future<void> createShop({
    required BuildContext context,
    required String tax,
    required String deliveryTo,
    required String deliveryFrom,
    required String phone,
    required String startPrice,
    required String name,
    required String desc,
    required String perKm,
    required AddressNewModel address,
    required String deliveryType,
    required String categoryId,
  }) async {
    final connected = await ref.read(connectivityProvider).call();
    if (connected) {
      state = state.copyWith(isSaveLoading: true);

      String? logoImage;
      String? backgroundImage;
      List<String>? files;
      final logoResponse = await ref
          .read(galleryRepositoryProvider)
          .uploadImage(state.logoImage, UploadType.shopsLogo);
      logoResponse.when(
        success: (data) {
          logoImage = data.imageData?.title;
        },
        failure: (failure, status) {
          debugPrint('===> upload logo image failure: $failure');
          ref.read(snackBarProvider).call(context, failure);
        },
      );
      final backgroundResponse = await ref
          .read(galleryRepositoryProvider)
          .uploadImage(state.bgImage, UploadType.shopsBack);
      backgroundResponse.when(
        success: (data) {
          backgroundImage = data.imageData?.title;
        },
        failure: (failure, status) {
          debugPrint('===> upload background image failure: $failure');
          ref.read(snackBarProvider).call(context, failure);
        },
      );
      final fileResponse = await ref
          .read(galleryRepositoryProvider)
          .uploadMultiImage(state.filepath, UploadType.shopsBack);
      fileResponse.when(
        success: (data) {
          files = data.data?.title;
        },
        failure: (failure, status) {
          debugPrint('===> upload document failure: $failure');
          ref.read(snackBarProvider).call(context, failure);
        },
      );
      final response = await ref
          .read(shopsRepositoryProvider)
          .createShop(
            logoImage: logoImage,
            documents: files ?? [],
            backgroundImage: backgroundImage,
            tax: double.tryParse(tax) ?? 0,
            deliveryTo: double.tryParse(deliveryTo) ?? 0,
            deliveryFrom: double.tryParse(deliveryFrom) ?? 0,
            deliveryType: deliveryType,
            phone: phone,
            name: name,
            description: desc,
            startPrice: double.tryParse(startPrice) ?? 0,
            perKm: double.tryParse(perKm) ?? 0,
            address: address,
            category: categoryId,
          );
      response.when(
        success: (data) {
          state = state.copyWith(isSaveLoading: false);
          fetchUser(context, refreshController: RefreshController());
          if (context.mounted) {
            Navigator.pop(context);
          }
        },
        failure: (failure, status) {
          state = state.copyWith(isSaveLoading: false);
          ref.read(snackBarProvider).call(context, failure);
          debugPrint('==> create shop failure: $failure');
        },
      );
    } else {
      if (context.mounted) {
        ref
            .read(snackBarProvider)
            .call(
              context,
              ref
                  .read(translationProvider)
                  .call(TrKeys.checkYourNetworkConnection),
            );
      }
    }
  }

  void getCareers() async {
    state = state.copyWith(isLoading: true);
    final response = await ref.read(userRepositoryProvider).getCareers();
    response.when(
      success: (data) {
        state = state.copyWith(isLoading: false, careers: data.data ?? []);
      },
      failure: (failure, status) {
        state = state.copyWith(isLoading: false);
      },
    );
  }

  void getCareerData(int id) async {
    state = state.copyWith(isLoading: true);
    final response = await ref.read(userRepositoryProvider).getCareerData(id);
    response.when(
      success: (data) {
        state = state.copyWith(isLoading: false, selectedCareer: data);
      },
      failure: (failure, status) {
        state = state.copyWith(isLoading: false);
      },
    );
  }

  void getAbout() async {
    state = state.copyWith(isLoading: true);

    final response = await ref
        .read(userRepositoryProvider)
        .getAbout(page: ++page);
    response.when(
      success: (data) {
        state = state.copyWith(isLoading: false, about: data.data);
      },
      failure: (e, status) {
        state = state.copyWith(isLoading: false);
      },
    );
  }

  void getBlogs() async {
    state = state.copyWith(isLoading: true);

    final response = await ref.read(userRepositoryProvider).getBlogs();
    response.when(
      success: (data) {
        state = state.copyWith(isLoading: false, blogs: data.data);
      },
      failure: (e, status) {
        state = state.copyWith(isLoading: false);
      },
    );
  }

  Future<void> getSelectBlog(String uuid) async {
    state = state.copyWith(isLoading: true);

    final response = await ref.read(userRepositoryProvider).getSingleBlog(uuid);
    response.when(
      success: (data) {
        state = state.copyWith(isLoading: false, selectBlog: data);
      },
      failure: (e, status) {
        state = state.copyWith(isLoading: false);
      },
    );
  }
}
