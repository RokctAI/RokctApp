# API Reference: become_seller

Source file: `lib/manager/presentation/pages/become_seller/become_seller.dart`

## Classes

### class `ManagerCreateShopPage`

## Whitelisted API Endpoints

### `ManagerCreateShopPage({super.key}); @override ConsumerState<ManagerCreateShopPage> createState() => _CreateShopPageState(); } class _CreateShopPageState extends ConsumerState<ManagerCreateShopPage> { late ProfileNotifier event; late TextEditingController shopName; late TextEditingController descName; late TextEditingController phoneName; late TextEditingController tax; late TextEditingController deliveryTimeFrom; late TextEditingController deliveryTimeTo; late TextEditingController startPrice; late TextEditingController pricePerKm; final GlobalKey<FormState> form = GlobalKey<FormState>(); Dyn addressData; final List<String> deliveryTypes = ["minute", "day", "month"]; String selectedDeliveryType = "minute"; @override void initState()`
*No documentation provided (generation failed).*

### `didChangeDependencies()`
*No documentation provided (generation failed).*

### `dispose()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `KeyboardDisable(child: Scaffold( body: Column( children: [ CustomAppBar( bottomPadding: 16, child: Text( AppHelpers.getTranslation(TrKeys.becomeSeller), style: AppStyle.interSemi(size: 18, color: AppStyle.black), ), ), Expanded( child: state.isLoading ? const Loading() : _buildContent(state), ), ], ), ), ); } Widget _buildContent(ProfileState state)`
*No documentation provided (generation failed).*

### `ProcessingView(); } else { return _buildShopForm(state, categoryId: 1, isRetry: true); } } Widget _buildShopForm( ProfileState state, { required int categoryId, bool isRetry = false, })`
*No documentation provided (generation failed).*

### `Form(key: form, child: ListView( physics: const BouncingScrollPhysics(), padding: REdgeInsets.only(top: 12, left: 16, right: 16), shrinkWrap: true, children: [ if (isRetry) ...[ Container( padding: EdgeInsets.all(16.r), decoration: BoxDecoration( color: AppStyle.red.withOpacity(0.1), borderRadius: BorderRadius.circular(12.r), border: Border.all( color: AppStyle.red.withOpacity(0.3), width: 1, ), ), child: Row( children: [ Icon( FlutterRemix.error_warning_line, color: AppStyle.red, size: 24.r, ), 12.horizontalSpace, Expanded( child: Text( AppHelpers.getTranslation(TrKeys.pleaseTryAgain), style: AppStyle.interSemi(size: 14, color: AppStyle.red), ), ), ], ), ), 24.verticalSpace, ], BackgroundImagePicker(bgImage: state.bgImage, event: event), 24.verticalSpace, LogoAndNameSection( logoImage: state.logoImage, shopNameController: shopName, event: event, validation: AppValidators.emptyCheck, ), 24.verticalSpace, ShopFormFields( descController: descName, phoneController: phoneName, taxController: tax, deliveryTimeFromController: deliveryTimeFrom, deliveryTimeToController: deliveryTimeTo, startPriceController: startPrice, pricePerKmController: pricePerKm, selectedDeliveryType: selectedDeliveryType, deliveryTypeList: deliveryTypes, isSpecificNumberEnabled: AppConstants.isSpecificNumberEnabled, onDeliveryTypeChanged: (value)`
*No documentation provided (generation failed).*
