# API Reference: edit_profile_modal

Source file: `lib/driver/presentation/pages/profile/widgets/edit_profile_modal.dart`

## Classes

### class `EditProfileModal`

## Whitelisted API Endpoints

### `EditProfileModal({super.key}); @override ConsumerState<EditProfileModal> createState() => _EditProfileModalState(); } class _EditProfileModalState extends ConsumerState<EditProfileModal> { @override void initState()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `Loading(), ) : KeyboardDisable( child: Consumer( builder: (context, ref, child)`
*No documentation provided (generation failed).*

### `ListView(physics: const BouncingScrollPhysics(), padding: EdgeInsets.zero, shrinkWrap: true, children: [ Padding( padding: EdgeInsets.symmetric(horizontal: 16.w), child: Column( children: [ TitleAndIcon( title: AppHelpers.getTranslation( TrKeys.profileSettings, ), ), 24.verticalSpace, Row( children: [ Consumer( builder: (context, ref, child)`
*No documentation provided (generation failed).*

### `Stack(alignment: Alignment.center, children: [ ShopAvatar( radius: 16, imageUrl: imageState.imageUrl, path: imageState.path, size: 50, padding: 6, bgColor: AppStyle.black.withValues( alpha: 0.27, ), ), Container( width: 50.r, height: 50.r, decoration: BoxDecoration( borderRadius: BorderRadius.circular( 16.r, ), color: AppStyle.black.withValues( alpha: 0.27, ), ), ), IconButton( icon: Icon( FlutterRemix.camera_fill, color: AppStyle.white, size: 20.r, ), onPressed: () async { final XFile? pickedFile = await ImagePicker().pickImage( source: ImageSource.gallery, maxWidth: 1000, maxHeight: 1000, imageQuality: 90, ); if (pickedFile != null)`
*No documentation provided (generation failed).*

### `BorderSide(color: AppStyle.border), const BorderSide(color: AppStyle.border), ), ), errorBorder: UnderlineInputBorder( borderSide: BorderSide.merge( const BorderSide(color: AppStyle.border), const BorderSide(color: AppStyle.border), ), ), border: const UnderlineInputBorder(), focusedErrorBorder: const UnderlineInputBorder(), disabledBorder: UnderlineInputBorder( borderSide: BorderSide.merge( const BorderSide(color: AppStyle.border), const BorderSide(color: AppStyle.border), ), ), focusedBorder: const UnderlineInputBorder(), ), ), ), 24.verticalSpace, UnderlinedBorderTextField( label: AppHelpers.getTranslation(TrKeys.email), initialText: editState.email, inputType: TextInputType.emailAddress, readOnly: !editState.isEmailEditable, onChanged: editNotifier.setEmail, ), 24.verticalSpace, UnderlinedBorderTextField( label: AppHelpers.getTranslation(TrKeys.password), obscure: editState.showPassword, onChanged: editNotifier.setPassword, isError: editState.isPasswordError, descriptionText: editState.isPasswordError ? AppHelpers.getTranslation( TrKeys .passwordShouldContainMinimum6Characters, ) : null, suffixIcon: IconButton( splashRadius: 25, icon: Icon( editState.showPassword ? FlutterRemix.eye_line : FlutterRemix.eye_close_line, color: AppStyle.black, size: 20.r, ), onPressed: editNotifier.toggleShowPassword, ), ), 24.verticalSpace, UnderlinedBorderTextField( label: AppHelpers.getTranslation( TrKeys.confirmPassword, ), obscure: editState.showConfirmPassword, onChanged: editNotifier.setConfirmPassword, isError: editState.isConfirmPasswordError, descriptionText: editState.isConfirmPasswordError ? AppHelpers.getTranslation( TrKeys .confirmPasswordDoesntMatchWithNewPassword, ) : null, suffixIcon: IconButton( splashRadius: 25.r, icon: Icon( editState.showConfirmPassword ? FlutterRemix.eye_line : FlutterRemix.eye_close_line, color: AppStyle.black, size: 20.r, ), onPressed: editNotifier.toggleShowConfirmPassword, ), ), ], ), ), 24.verticalSpace, const Divider(), GestureDetector( onTap: ()`
*No documentation provided (generation failed).*

### `EditCar(), isDarkMode: false, isExpanded: true, ); }, child: Container( color: AppStyle.transparent, child: Padding( padding: EdgeInsets.all(16.r), child: Row( children: [ Icon(FlutterRemix.time_fill, size: 20.r), 8.horizontalSpace, Column( crossAxisAlignment: CrossAxisAlignment.start, children: [ Text( AppHelpers.getTranslation( TrKeys.deliveryVehicle, ), style: AppStyle.interNormal( size: 12.sp, color: AppStyle.black, ), ), Text( "${LocalStorage.getDeliveryInfo()?.data?.number ?? ''} â€” ${LocalStorage.getDeliveryInfo()?.data?.model ?? ''}, ${LocalStorage.getDeliveryInfo()?.data?.color ?? ''}", style: AppStyle.interNormal( size: 12.sp, color: AppStyle.black, ), ), ], ), const Spacer(), const Icon(FlutterRemix.arrow_right_s_line), ], ), ), ), ), const Divider(), Padding( padding: EdgeInsets.all(16.r), child: CustomButton( title: AppHelpers.getTranslation(TrKeys.save), isLoading: editState.isLoading, onPressed: ()`
*No documentation provided (generation failed).*
