import 'dart:async';
import 'package:admin_desktop/src/models/response/product_calculate_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_dropdown/models/value_item.dart';
import '../../../../../../../core/constants/constants.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../../models/data/edit_shop_data.dart';
import '../../../../../../../models/data/location_data.dart';
import '../../../../../../../models/models.dart';
import '../../../../../../../repository/repository.dart';
import '../../../../../../theme/theme.dart';
import '../state/right_side_state.dart';

class RightSideNotifier extends StateNotifier<RightSideState> {
  final UsersRepository _usersRepository;
  final CurrenciesRepository _currenciesRepository;
  final PaymentsRepository _paymentsRepository;
  final ProductsRepository _productsRepository;
  final OrdersRepository _ordersRepository;
  final ShopsRepository _shopsRepository;
  final GalleryRepositoryFacade _galleryRepository;
  Timer? _searchUsersTimer;

  String _statusNote = '';
  String _title = '';
  String _description = '';
  String _phone = '';
  String _price = '';
  String _minAmount = '';
  String _perKm = '';
  String _from = '';
  String _to = '';
  String _tax = '';
  String _percentage = '';

  RightSideNotifier(
    this._usersRepository,
    this._currenciesRepository,
    this._paymentsRepository,
    this._productsRepository,
    this._ordersRepository,
    this._shopsRepository,
    this._galleryRepository,
  ) : super(const RightSideState());
  Timer? timer;

  void setCoupon(String coupon, BuildContext context) {
    state = state.copyWith(coupon: coupon, isActive: false);
    fetchCarts(
      checkYourNetwork: () {
        AppHelpers.showSnackBar(
          context,
          AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
        );
      },
    );
  }

  setCalculate(String item) {
    if (item == "-1" && state.calculate.isNotEmpty) {
      state = state.copyWith(
        calculate: state.calculate.substring(0, state.calculate.length - 1),
      );
      return;
    } else if (state.calculate.length > 25) {
      return;
    } else if (item == "." && state.calculate.isEmpty) {
      state = state.copyWith(calculate: "${state.calculate}0$item");
      return;
    } else if (item == "." && state.calculate.contains(".")) {
      return;
    } else if (item != "-1") {
      state = state.copyWith(calculate: state.calculate + item);
      return;
    }
  }

  void setCloseDay(int index) {
    EditShopData? closeDays = state.editShopData;
    ShopWorkingDays? workingDays = closeDays?.shopWorkingDays?[index];
    workingDays = workingDays?.copyWith(
      disabled: !(workingDays.disabled ?? false),
    );
    closeDays?.shopWorkingDays?[index] = workingDays ?? ShopWorkingDays();
    state = state.copyWith(editShopData: closeDays);
  }

  void setUpdate() {
    state = state.copyWith(isLogoImageLoading: true);
    state = state.copyWith(isLogoImageLoading: false);
  }

  Future<void> fetchBags() async {
    state = state.copyWith(isBagsLoading: true, bags: []);
    List<BagData> bags = LocalStorage.getBags();
    if (bags.isEmpty) {
      final BagData firstBag = BagData(index: 0, bagProducts: []);
      LocalStorage.setBags([firstBag]);
      bags = [firstBag];
    }
    state = state.copyWith(
      bags: bags,
      isBagsLoading: false,
      selectedUser: bags[0].selectedUser,
      isActive: false,
      isPromoCodeLoading: false,
      coupon: null,
    );
  }

  Future<void> checkPromoCode(BuildContext context, String? promoCode) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isPromoCodeLoading: true, isActive: false);

      final response = await _usersRepository.checkCoupon(
        coupon: promoCode ?? "",
        shopId: LocalStorage.getUser()?.role == TrKeys.waiter
            ? LocalStorage.getUser()?.invite?.shopId ?? 0
            : LocalStorage.getUser()?.shop?.id ?? 0,
      );
      response.when(
        success: (data) {
          state = state.copyWith(isPromoCodeLoading: false, isActive: true);
        },
        failure: (failure) {
          state = state.copyWith(isPromoCodeLoading: false, isActive: false);
        },
      );
    } else {
      if (context.mounted) {
        AppHelpers.showSnackBar(
          context,
          AppHelpers.getTranslation(TrKeys.noInternetConnection),
        );
      }
    }
  }

  void addANewBag() {
    List<BagData> newBags = List.from(state.bags);
    newBags.add(BagData(index: newBags.length, bagProducts: []));
    LocalStorage.setBags(newBags);
    state = state.copyWith(bags: newBags);
  }

  void setSelectedBagIndex(int index) {
    state = state.copyWith(
      selectedBagIndex: index,
      selectedUser: state.bags[index].selectedUser,
    );
  }

  void removeBag(int index) {
    List<BagData> bags = List.from(state.bags);
    List<BagData> newBags = [];
    bags.removeAt(index);
    for (int i = 0; i < bags.length; i++) {
      newBags.add(BagData(index: i, bagProducts: bags[i].bagProducts));
    }
    LocalStorage.setBags(newBags);
    final int selectedIndex = state.selectedBagIndex == index
        ? 0
        : state.selectedBagIndex;
    state = state.copyWith(bags: newBags, selectedBagIndex: selectedIndex);
  }

  void removeOrderedBag(BuildContext context) {
    List<BagData> bags = List.from(state.bags);
    List<BagData> newBags = [];
    bags.removeAt(state.selectedBagIndex);
    if (bags.isEmpty) {
      final BagData firstBag = BagData(index: 0, bagProducts: []);
      newBags = [firstBag];
    } else {
      for (int i = 0; i < bags.length; i++) {
        newBags.add(BagData(index: i, bagProducts: bags[i].bagProducts));
      }
    }
    LocalStorage.setBags(newBags);
    state = state.copyWith(
      bags: newBags,
      selectedBagIndex: 0,
      selectedUser: null,
      selectedAddress: null,
      selectedCurrency: null,
      selectedPayment: null,
      orderType: TrKeys.pickup,
    );
    setInitialBagData(context, newBags[0]);
  }

  Future<void> fetchUsers({VoidCallback? checkYourNetwork}) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(
        isUsersLoading: true,
        dropdownUsers: [],
        users: [],
      );
      final response = await _usersRepository.searchUsers(
        query: state.usersQuery.isEmpty ? null : state.usersQuery,
      );
      response.when(
        success: (data) async {
          final List<UserData> users = data.users ?? [];
          List<DropDownItemData> dropdownUsers = [];
          for (int i = 0; i < users.length; i++) {
            dropdownUsers.add(
              DropDownItemData(
                index: i,
                title: '${users[i].firstname} ${users[i].lastname ?? ""}',
              ),
            );
          }
          state = state.copyWith(
            isUsersLoading: false,
            users: users,
            dropdownUsers: dropdownUsers,
          );
        },
        failure: (failure) {
          state = state.copyWith(isUsersLoading: false);
          debugPrint('==> get users failure: $failure');
        },
      );
    } else {
      checkYourNetwork?.call();
    }
  }

  void setStatusNote(String value) {
    _statusNote = value.trim();
  }

  void setPhone(String value) {
    _phone = value.trim();
  }

  void setDescription(String value) {
    _description = value.trim();
  }

  void setTitle(String value) {
    _title = value.trim();
  }

  void setPrice(String value) {
    _price = value.trim();
  }

  void setAmount(String value) {
    _minAmount = value.trim();
  }

  void setPerKm(String value) {
    _perKm = value.trim();
  }

  void setFrom(String value) {
    _from = value.trim();
  }

  void setTo(String value) {
    _to = value.trim();
  }

  void setTax(String value) {
    _tax = value.trim();
  }

  void setPercentage(String value) {
    _percentage = value.trim();
  }

  Future<void> fetchShopData({
    VoidCallback? checkYourNetwork,
    VoidCallback? onSuccess,
  }) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isEditShopData: true);
      final response = await _shopsRepository.getShopData();
      await fetchShopTag();
      await fetchShopCategory();
      response.when(
        success: (data) async {
          onSuccess?.call();
          state = state.copyWith(
            isEditShopData: false,
            editShopData: data,
            isUpdate: false,
          );
        },
        failure: (failure) {
          state = state.copyWith(isEditShopData: false);
          debugPrint('==> get editShopData failure: $failure');
        },
      );
    } else {
      checkYourNetwork?.call();
    }
  }

  Future<void> fetchShopCategory({VoidCallback? checkYourNetwork}) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      final response = await _shopsRepository.getShopCategory();
      response.when(
        success: (data) async {
          state = state.copyWith(categories: data);
        },
        failure: (failure) {
          debugPrint('==> get editShopCategory failure: $failure');
        },
      );
    } else {
      checkYourNetwork?.call();
    }
  }

  Future<void> fetchShopTag({VoidCallback? checkYourNetwork}) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      final response = await _shopsRepository.getShopTag();
      response.when(
        success: (data) async {
          state = state.copyWith(tag: data);
        },
        failure: (failure) {
          debugPrint('==> get editShopTag failure: $failure');
        },
      );
    } else {
      checkYourNetwork?.call();
    }
  }

  Future<void> updateShopData({
    required VoidCallback onSuccess,
    required LocationData? location,
    String? displayName,
    List<ValueItem>? category,
    List<ValueItem>? tag,
    List<ValueItem>? type,
  }) async {
    state = state.copyWith(isSave: true);
    final response = await _shopsRepository.updateShopData(
      displayName: displayName,
      category: category,
      tag: tag,
      type: type,
      editShopData: EditShopData(
        location: Location(
          longitude: location?.longitude.toString(),
          latitude: location?.latitude.toString(),
        ),
        status: state.editShopData?.status,
        statusNote: _statusNote.isNotEmpty
            ? _statusNote
            : state.editShopData?.statusNote,
        translation: Translation(
          title: _title.isNotEmpty
              ? _title
              : state.editShopData?.translation?.title,
          description: _description.isNotEmpty
              ? _description
              : state.editShopData?.translation?.description,
        ),
        phone: _phone.isNotEmpty ? _phone : state.editShopData?.phone,
        price: _price.isNotEmpty
            ? num.tryParse(_price)
            : state.editShopData?.price,
        minAmount: _minAmount.isNotEmpty
            ? num.tryParse(_minAmount)
            : state.editShopData?.minAmount,
        perKm: _perKm.isNotEmpty
            ? num.tryParse(_perKm)
            : state.editShopData?.perKm,
        deliveryTime: DeliveryTime(
          from: _from.isNotEmpty
              ? _from
              : state.editShopData?.deliveryTime?.from,
          to: _to.isNotEmpty ? _to : state.editShopData?.deliveryTime?.to,
        ),
        tax: _tax.isNotEmpty ? num.tryParse(_tax) : state.editShopData?.tax,
        percentage: _percentage.isNotEmpty
            ? num.tryParse(_percentage)
            : state.editShopData?.percentage,
      ),
      logoImg: state.logoImageUrl,
      backImg: state.backImageUrl,
    );
    response.when(
      success: (data) {
        state = state.copyWith(isSave: false, isUpdate: true);
        onSuccess.call();
      },
      failure: (fail) {
        state = state.copyWith(isSave: false);
        debugPrint('===> update delivery zone failed $fail');
      },
    );
  }

  Future<void> updateWorkingDays({
    required List<ShopWorkingDays>? days,
    required String shopUuid,
  }) async {
    state = state.copyWith(isSave: true);
    final response = await _shopsRepository.updateShopWorkingDays(
      workingDays: days ?? [],
      uuid: shopUuid,
    );
    response.when(
      success: (data) {
        state = state.copyWith(isSave: true);
      },
      failure: (failure) {
        state = state.copyWith(isSave: false);
        debugPrint('==> error update working days $failure');
      },
    );
  }

  Future<void> getPhoto({
    bool isLogoImage = false,
    required BuildContext context,
  }) async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: image.path,
        aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Image Cropper',
            toolbarColor: AppColors.white,
            toolbarWidgetColor: AppColors.black,
            initAspectRatio: CropAspectRatioPreset.original,
          ),
          IOSUiSettings(title: 'Image Cropper', minimumAspectRatio: 1),
        ],
      );
      // ignore: use_build_context_synchronously
      await updateShopImage(context, croppedFile?.path ?? "", isLogoImage);
      state = isLogoImage
          ? state.copyWith(logoImagePath: croppedFile?.path ?? "")
          : state.copyWith(backImagePath: croppedFile?.path ?? "");
    }
  }

  Future<void> updateShopImage(
    BuildContext context,
    String path,
    bool isLogoImage,
  ) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = isLogoImage
          ? state.copyWith(isLogoImageLoading: true)
          : state.copyWith(isBackImageLoading: true);
      String? url;
      final imageResponse = await _galleryRepository.uploadImage(
        path,
        UploadType.users,
      );
      imageResponse.when(
        success: (data) {
          url = data.imageData?.title;
          state = isLogoImage
              ? state.copyWith(
                  logoImageUrl: url ?? "",
                  isLogoImageLoading: false,
                )
              : state.copyWith(
                  backImageUrl: url ?? "",
                  isBackImageLoading: false,
                );
        },
        failure: (failure) {
          state = isLogoImage
              ? state.copyWith(isLogoImageLoading: false)
              : state.copyWith(isBackImageLoading: false);
          debugPrint('==> upload edit shop image failure: $failure');
          AppHelpers.showSnackBar(
            context,
            AppHelpers.getTranslation(failure.toString()),
          );
        },
      );
    } else {
      if (context.mounted) {
        AppHelpers.showSnackBar(
          context,
          AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
        );
      }
    }
  }

  void setUsersQuery(BuildContext context, String query) {
    if (state.usersQuery == query) {
      return;
    }
    state = state.copyWith(usersQuery: query.trim());

    if (_searchUsersTimer?.isActive ?? false) {
      _searchUsersTimer?.cancel();
    }
    _searchUsersTimer = Timer(const Duration(milliseconds: 500), () {
      state = state.copyWith(users: [], dropdownUsers: []);
      fetchUsers(
        checkYourNetwork: () {
          AppHelpers.showSnackBar(
            context,
            AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
          );
        },
      );
    });
  }

  void setSelectedUser(BuildContext context, int index) {
    final user = state.users[index];
    final bags = LocalStorage.getBags();
    final bag = bags[state.selectedBagIndex].copyWith(selectedUser: user);
    bags[state.selectedBagIndex] = bag;
    LocalStorage.setBags(bags);
    state = state.copyWith(bags: bags, selectedUser: user);
    fetchUserDetails(
      checkYourNetwork: () {
        AppHelpers.showSnackBar(
          context,
          AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
        );
      },
    );
    setUsersQuery(context, '');
  }

  void removeSelectedUser() {
    final List<BagData> bags = List.from(LocalStorage.getBags());
    final BagData bag = bags[state.selectedBagIndex].copyWith(
      selectedUser: null,
      selectedAddress: null,
    );
    bags[state.selectedBagIndex] = bag;
    LocalStorage.setBags(bags);
    state = state.copyWith(bags: bags, selectedUser: null);
  }

  Future<void> fetchUserDetails({VoidCallback? checkYourNetwork}) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isUserDetailsLoading: true);
      final response = await _usersRepository.getUserDetails(
        state.selectedUser?.uuid ?? '',
      );
      response.when(
        success: (data) async {
          state = state.copyWith(
            isUserDetailsLoading: false,
            selectedUser: data.data,
          );
        },
        failure: (failure) {
          state = state.copyWith(isUserDetailsLoading: false);
          debugPrint('==> get users details failure: $failure');
        },
      );
    } else {
      checkYourNetwork?.call();
    }
  }

  void setSelectedOrderType(String? type) {
    state = state.copyWith(orderType: type ?? state.orderType);
  }

  void setSelectedAddress({AddressData? address}) {
    final List<BagData> bags = List.from(LocalStorage.getBags());

    final user = bags[state.selectedBagIndex].selectedUser;
    final BagData bag = bags[state.selectedBagIndex].copyWith(
      selectedAddress: address,
      selectedUser: user,
    );
    bags[state.selectedBagIndex] = bag;
    LocalStorage.setBags(bags);
    state = state.copyWith(bags: bags, selectedAddress: address);
  }

  void setInitialBagData(BuildContext context, BagData bag) {
    state = state.copyWith(
      selectedAddress: bag.selectedAddress,
      selectedUser: bag.selectedUser,
      selectedCurrency: bag.selectedCurrency,
      selectedPayment: bag.selectedPayment,
      orderType: state.orderType.isEmpty ? TrKeys.pickup : state.orderType,
    );
    if (bag.selectedUser != null) {
      fetchUserDetails(
        checkYourNetwork: () {
          AppHelpers.showSnackBar(
            context,
            AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
          );
        },
      );
    }
    fetchCarts(
      checkYourNetwork: () {
        AppHelpers.showSnackBar(
          context,
          AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
        );
      },
    );
  }

  Future<void> fetchCurrencies({VoidCallback? checkYourNetwork}) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isCurrenciesLoading: true, currencies: []);
      final response = await _currenciesRepository.getCurrencies();
      response.when(
        success: (data) async {
          state = state.copyWith(
            isCurrenciesLoading: false,
            currencies: data.data ?? [],
          );
        },
        failure: (failure) {
          state = state.copyWith(isCurrenciesLoading: false);
          debugPrint('==> get currencies failure: $failure');
        },
      );
    } else {
      checkYourNetwork?.call();
    }
  }

  void setSelectedCurrency(int? currencyId) {
    final List<BagData> bags = List.from(LocalStorage.getBags());
    final user = bags[state.selectedBagIndex].selectedUser;
    final address = bags[state.selectedBagIndex].selectedAddress;
    CurrencyData? currencyData;
    for (final currency in state.currencies) {
      if (currencyId == currency.id) {
        currencyData = currency;
        break;
      }
    }
    final BagData bag = bags[state.selectedBagIndex].copyWith(
      selectedAddress: address,
      selectedUser: user,
      selectedCurrency: currencyData,
    );
    bags[state.selectedBagIndex] = bag;
    LocalStorage.setBags(bags);
    state = state.copyWith(bags: bags, selectedCurrency: currencyData);
    fetchCarts(checkYourNetwork: () {}, isNotLoading: true);
  }

  Future<void> fetchPayments({VoidCallback? checkYourNetwork}) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isPaymentsLoading: true, payments: []);
      final response = await _paymentsRepository.getPayments();
      response.when(
        success: (data) async {
          final List<PaymentData> payments = data.data ?? [];
          List<PaymentData> filteredPayments = [];
          for (final payment in payments) {
            if (payment.tag == 'cash' || payment.tag == 'wallet') {
              filteredPayments.add(payment);
            }
          }
          state = state.copyWith(
            isPaymentsLoading: false,
            payments: filteredPayments,
          );
        },
        failure: (failure) {
          state = state.copyWith(isPaymentsLoading: false);
          debugPrint('==> get payments failure: $failure');
        },
      );
    } else {
      checkYourNetwork?.call();
    }
  }

  void setSelectedPayment(int? paymentId) {
    final List<BagData> bags = List.from(LocalStorage.getBags());
    final user = bags[state.selectedBagIndex].selectedUser;
    final address = bags[state.selectedBagIndex].selectedAddress;
    PaymentData? paymentData;
    for (final payment in state.payments) {
      if (paymentId == payment.id) {
        paymentData = payment;
        break;
      }
    }
    final BagData bag = bags[state.selectedBagIndex].copyWith(
      selectedAddress: address,
      selectedUser: user,
      selectedPayment: paymentData,
    );
    bags[state.selectedBagIndex] = bag;
    LocalStorage.setBags(bags);
    state = state.copyWith(bags: bags, selectedPayment: paymentData);
  }

  Future<void> fetchCarts({
    VoidCallback? checkYourNetwork,
    bool isNotLoading = false,
  }) async {
    final connected = await AppConnectivity.connectivity();

    if (connected) {
      if (isNotLoading) {
        state = state.copyWith(isButtonLoading: true);
      } else {
        state = state.copyWith(
          isProductCalculateLoading: true,
          paginateResponse: null,
          bags: LocalStorage.getBags(),
        );
      }

      final List<BagProductData> bagProducts =
          LocalStorage.getBags()[state.selectedBagIndex].bagProducts ?? [];
      if (bagProducts.isNotEmpty) {
        final response = await _productsRepository.getAllCalculations(
          bagProducts,
          state.orderType,
          coupon: state.coupon,
        );
        response.when(
          success: (data) async {
            state = state.copyWith(
              isButtonLoading: false,
              isProductCalculateLoading: false,
              paginateResponse: data.data?.data,
            );
          },
          failure: (failure) {
            state = state.copyWith(
              isProductCalculateLoading: false,
              isButtonLoading: false,
            );
            debugPrint('==> get product calculate failure: $failure');
          },
        );
      }
      state = state.copyWith(
        isButtonLoading: false,
        isProductCalculateLoading: false,
      );
    } else {
      checkYourNetwork?.call();
    }
  }

  void setDate(DateTime date) {
    state = state.copyWith(orderDate: date);
  }

  void setTime(TimeOfDay time) {
    state = state.copyWith(orderTime: time);
  }

  void clearBag(BuildContext context) {
    var newPagination = state.paginateResponse?.copyWith(stocks: []);
    state = state.copyWith(paginateResponse: newPagination);
    List<BagData> bags = List.from(LocalStorage.getBags());
    bags[state.selectedBagIndex] = bags[state.selectedBagIndex].copyWith(
      bagProducts: [],
    );
    LocalStorage.setBags(bags);
  }

  void deleteProductFromBag(BuildContext context, BagProductData bagProduct) {
    final List<BagProductData> bagProducts = List.from(
      LocalStorage.getBags()[state.selectedBagIndex].bagProducts ?? [],
    );
    int index = 0;
    for (int i = 0; i < bagProducts.length; i++) {
      if (bagProducts[i].stockId == bagProduct.stockId) {
        index = i;
        break;
      }
    }
    bagProducts.removeAt(index);
    List<BagData> bags = List.from(LocalStorage.getBags());
    bags[state.selectedBagIndex] = bags[state.selectedBagIndex].copyWith(
      bagProducts: bagProducts,
    );
    LocalStorage.setBags(bags);
    fetchCarts(
      checkYourNetwork: () {
        AppHelpers.showSnackBar(
          context,
          AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
        );
      },
    );
  }

  void deleteProductCount({
    required BagProductData? bagProductData,
    required int productIndex,
  }) {
    List<ProductData>? listOfProduct = state.paginateResponse?.stocks;
    listOfProduct?.removeAt(productIndex);
    PriceDate? data = state.paginateResponse;
    PriceDate? newData = data?.copyWith(stocks: listOfProduct);
    state = state.copyWith(paginateResponse: newData);
    final List<BagProductData> bagProducts =
        LocalStorage.getBags()[state.selectedBagIndex].bagProducts ?? [];
    bagProducts.removeAt(productIndex);

    List<BagData> bags = List.from(LocalStorage.getBags());
    bags[state.selectedBagIndex] = bags[state.selectedBagIndex].copyWith(
      bagProducts: bagProducts,
    );
    LocalStorage.setBags(bags);

    fetchCarts(isNotLoading: true);
  }

  void decreaseProductCount({required int productIndex}) {
    timer?.cancel();
    ProductData? product = state.paginateResponse?.stocks?[productIndex];
    if ((product?.quantity ?? 1) > 1) {
      ProductData? newProduct = product?.copyWith(
        quantity: ((product.quantity ?? 0) - 1),
      );
      List<ProductData>? listOfProduct = state.paginateResponse?.stocks;
      listOfProduct?.removeAt(productIndex);
      listOfProduct?.insert(productIndex, newProduct ?? ProductData());
      PriceDate? data = state.paginateResponse;
      PriceDate? newData = data?.copyWith(stocks: listOfProduct);
      state = state.copyWith(paginateResponse: newData);
      final List<BagProductData> bagProducts =
          LocalStorage.getBags()[state.selectedBagIndex].bagProducts ?? [];
      for (int i = 0; i < bagProducts.length; i++) {
        if (bagProducts[i].stockId == product?.stock?.id) {
          BagProductData newProductData = bagProducts[i].copyWith(
            quantity: (bagProducts[i].quantity ?? 0) - 1,
          );
          bagProducts.removeAt(i);
          bagProducts.insert(i, newProductData);
          break;
        }
      }

      List<BagData> bags = List.from(LocalStorage.getBags());
      bags[state.selectedBagIndex] = bags[state.selectedBagIndex].copyWith(
        bagProducts: bagProducts,
      );
      LocalStorage.setBags(bags);
    } else {
      List<ProductData>? listOfProduct = state.paginateResponse?.stocks;
      listOfProduct?.removeAt(productIndex);
      PriceDate? data = state.paginateResponse;
      PriceDate? newData = data?.copyWith(stocks: listOfProduct);
      state = state.copyWith(paginateResponse: newData);
      final List<BagProductData> bagProducts =
          LocalStorage.getBags()[state.selectedBagIndex].bagProducts ?? [];
      for (int i = 0; i < bagProducts.length; i++) {
        if (bagProducts[i].stockId == product?.stock?.id) {
          bagProducts.removeAt(i);
          break;
        }
      }

      List<BagData> bags = List.from(LocalStorage.getBags());
      bags[state.selectedBagIndex] = bags[state.selectedBagIndex].copyWith(
        bagProducts: bagProducts,
      );
      LocalStorage.setBags(bags);
    }
    timer = Timer(
      const Duration(milliseconds: 500),
      () => fetchCarts(isNotLoading: true),
    );
  }

  void increaseProductCount({required int productIndex}) {
    timer?.cancel();
    ProductData? product = state.paginateResponse?.stocks?[productIndex];
    ProductData? newProduct = product?.copyWith(
      quantity: ((product.quantity ?? 0) + 1),
    );
    List<ProductData>? listOfProduct = state.paginateResponse?.stocks;
    listOfProduct?.removeAt(productIndex);
    listOfProduct?.insert(productIndex, newProduct ?? ProductData());
    PriceDate? data = state.paginateResponse;
    PriceDate? newData = data?.copyWith(stocks: listOfProduct);
    state = state.copyWith(paginateResponse: newData);
    final List<BagProductData> bagProducts =
        LocalStorage.getBags()[state.selectedBagIndex].bagProducts ?? [];

    for (int i = 0; i < bagProducts.length; i++) {
      if (bagProducts[i].stockId == product?.stock?.id) {
        BagProductData newProductData = bagProducts[i].copyWith(
          quantity: (bagProducts[i].quantity ?? 0) + 1,
        );
        bagProducts.removeAt(i);
        bagProducts.insert(i, newProductData);
        break;
      }
    }

    List<BagData> bags = List.from(LocalStorage.getBags());
    bags[state.selectedBagIndex] = bags[state.selectedBagIndex].copyWith(
      bagProducts: bagProducts,
    );
    LocalStorage.setBags(bags);
    timer = Timer(
      const Duration(milliseconds: 500),
      () => fetchCarts(isNotLoading: true),
    );
  }

  Future<void> placeOrder({
    VoidCallback? checkYourNetwork,
    VoidCallback? openSelectDeliveriesDrawer,
  }) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      if (state.orderType != TrKeys.delivery) {
        openSelectDeliveriesDrawer?.call();
      } else {
        if (state.selectedUser == null) {
          state = state.copyWith(selectUserError: TrKeys.selectUser);
          return;
        }
        if (state.selectedAddress == null &&
            (state.orderType == TrKeys.delivery)) {
          state = state.copyWith(
            selectAddressError: TrKeys.selectAddress,
            selectUserError: null,
          );
          return;
        }
        if (state.selectedCurrency == null) {
          state = state.copyWith(
            selectCurrencyError: TrKeys.selectCurrency,
            selectUserError: null,
            selectAddressError: null,
          );
          return;
        }
        if (state.selectedPayment == null) {
          state = state.copyWith(
            selectPaymentError: TrKeys.selectPayment,
            selectUserError: null,
            selectAddressError: null,
            selectCurrencyError: null,
          );
          return;
        }
        state = state.copyWith(
          selectPaymentError: null,
          selectUserError: null,
          selectAddressError: null,
          selectCurrencyError: null,
        );
        if (state.selectedUser?.phone?.isEmpty ?? true) {
          state = state.copyWith(
            selectedUser: state.selectedUser?.copyWith(phone: _phone),
          );
        }
        openSelectDeliveriesDrawer?.call();
      }
    } else {
      checkYourNetwork?.call();
    }
  }

  setNote(String note) {
    state = state.copyWith(comment: note);
  }

  Future createOrder(
    BuildContext context,
    OrderBodyData data, {
    VoidCallback? onSuccess,
  }) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isOrderLoading: true);
      final num wallet = state.selectedUser?.wallet?.price ?? 0;
      if (data.bagData.selectedPayment?.tag == "wallet" &&
          wallet < (state.paginateResponse?.totalPrice ?? 0)) {
        if (context.mounted) {
          AppHelpers.showSnackBar(
            context,
            AppHelpers.getTranslation(TrKeys.notEnoughMoney),
          );
        }

        state = state.copyWith(isOrderLoading: false);
        return;
      }
      final response = await _ordersRepository.createOrder(data);
      response.when(
        success: (res) async {
          state = state.copyWith(isOrderLoading: false);
          onSuccess?.call();
          removeOrderedBag(context);
          switch (data.bagData.selectedPayment?.tag) {
            case 'cash':
              _paymentsRepository.createTransaction(
                orderId: res.data?.id ?? 0,
                paymentId: data.bagData.selectedPayment?.id ?? 0,
              );
              break;
            case 'wallet':
              _paymentsRepository.createTransaction(
                orderId: res.data?.id ?? 0,
                paymentId: data.bagData.selectedPayment?.id ?? 0,
              );
              break;
            default:
              _paymentsRepository.createTransaction(
                orderId: res.data?.id ?? 0,
                paymentId: data.bagData.selectedPayment?.id ?? 0,
              );
              break;
          }
        },
        failure: (activeFailure) {
          state = state.copyWith(isOrderLoading: false);
          if (mounted) {
            AppHelpers.showSnackBar(
              context,
              AppHelpers.getTranslation(500.toString()),
            );
          }
        },
      );
    } else {
      if (context.mounted) {
        AppHelpers.showSnackBar(
          context,
          AppHelpers.getTranslation(TrKeys.noInternetConnection),
        );
      }
    }
  }
}
