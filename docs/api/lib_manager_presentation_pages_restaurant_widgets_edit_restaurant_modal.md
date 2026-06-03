# API Reference: edit_restaurant_modal

Source file: `lib/manager/presentation/pages/restaurant/widgets/edit_restaurant_modal.dart`

## Classes

### class `EditRestaurantModal`

## Whitelisted API Endpoints

### `EditRestaurantModal({super.key}); @override ConsumerState<EditRestaurantModal> createState() => _EditRestaurantModalState(); } class _EditRestaurantModalState extends ConsumerState<EditRestaurantModal> { final _formKey = GlobalKey<FormState>(); @override Widget build(BuildContext context)`
*No documentation provided (generation failed).*

### `KeyboardDisable(child: ModalWrap( body: Consumer( builder: (context, ref, child)`
*No documentation provided (generation failed).*

### `BouncingScrollPhysics(), child: Form( key: _formKey, child: Column( children: [ Padding( padding: REdgeInsets.symmetric(horizontal: 16), child: Column( children: [ const ModalDrag(), TitleAndIcon( title: AppHelpers.getTranslation( TrKeys.restaurantSettings, ), ), 24.verticalSpace, HorizontalImagePicker( onImageChange: event.setBackgroundImageFile, onDelete: () => event.setBackgroundImageFile(null), imageFilePath: state.backgroundImageFile, imageUrl: state.shop?.backgroundImg, ), 24.verticalSpace, Row( children: [ ButtonsBouncingEffect( child: GestureDetector( onTap: () async { XFile? file; try { file = await ImagePicker() .pickImage( source: ImageSource.gallery, ); } catch (ex)`
*No documentation provided (generation failed).*

### `BorderSide(color: AppStyle.differBorder, ), const BorderSide( color: AppStyle.differBorder, ), ), ), errorBorder: UnderlineInputBorder( borderSide: BorderSide.merge( const BorderSide( color: AppStyle.differBorder, ), const BorderSide( color: AppStyle.differBorder, ), ), ), border: const UnderlineInputBorder(), focusedErrorBorder: const UnderlineInputBorder(), disabledBorder: UnderlineInputBorder( borderSide: BorderSide.merge( const BorderSide( color: AppStyle.differBorder, ), const BorderSide( color: AppStyle.differBorder, ), ), ), focusedBorder: const UnderlineInputBorder(), ), ), if (!AppConstants.isSpecificNumberEnabled) UnderlinedTextField( initialText: state.shop?.phone, label: AppHelpers.getTranslation( TrKeys.phoneNumber, ), onChanged: event.setPhone, validator: AppValidators.emptyCheck, ), 24.verticalSpace, ], ), ), Row( children: [ 16.horizontalSpace, Text( AppHelpers.getTranslation(TrKeys.orderPayment), style: AppStyle.interNormal(), ), 18.horizontalSpace, Expanded( child: DropdownButton( value: state.orderPayment, borderRadius: BorderRadius.circular(10.r), items: [ DropdownMenuItem( value: "before", child: Text( AppHelpers.getTranslation( TrKeys.before, ), ), ), DropdownMenuItem( value: "after", child: Text( AppHelpers.getTranslation(TrKeys.after), ), ), ], onChanged: (s)`
*No documentation provided (generation failed).*

### `Divider(), GestureDetector( onTap: ()`
*No documentation provided (generation failed).*

### `WorkingTimeModal(), isDarkMode: false, ); }, child: Container( color: AppStyle.transparent, child: Padding( padding: REdgeInsets.all(16), child: Row( children: [ Icon( FlutterRemix.time_fill, size: 18.r, color: AppStyle.blackColor, ), 8.horizontalSpace, Column( crossAxisAlignment: CrossAxisAlignment.start, children: [ Text( AppHelpers.getTranslation( TrKeys.workingHours, ), style: AppStyle.interNormal( size: 12, color: AppStyle.blackColor, ), ), 4.verticalSpace, Row( mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [ ...(state.shop?.shopWorkingDays ?? []) .map( (ShopWorkingDays day) => Padding( padding: REdgeInsets.only( right: 4, ), child: SmallWeekdayItem( isSelected: !(day.disabled ?? false), day: day, size: 30, fontSize: 11, borderRadius: 6, ), ), ), ], ), ], ), const Spacer(), Icon( FlutterRemix.arrow_right_s_line, size: 24.r, color: AppStyle.blackColor, ), ], ), ), ), ), const Divider(), GestureDetector( onTap: () => context.pushRoute( const ManagerDeliveryZoneRoute(), ), child: Container( color: AppStyle.transparent, child: Padding( padding: REdgeInsets.all(16), child: Row( children: [ Icon( FlutterRemix.navigation_fill, size: 20.r, ), 8.horizontalSpace, Text( AppHelpers.getTranslation( TrKeys.deliveryZone, ), style: AppStyle.interNormal( size: 12, color: AppStyle.blackColor, ), ), const Spacer(), Icon( FlutterRemix.arrow_right_s_line, size: 24.r, color: AppStyle.blackColor, ), ], ), ), ), ), const Divider(), 24.verticalSpace, Padding( padding: REdgeInsets.all(16), child: CustomButton( title: AppHelpers.getTranslation(TrKeys.save), isLoading: state.isLoading, onPressed: ()`
*No documentation provided (generation failed).*
