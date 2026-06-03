# API Reference: edit_profile_page

Source file: `lib/customer/presentation/pages/profile/edit_profile_page.dart`

## Classes

### class `EditProfileScreen`

## Whitelisted API Endpoints

### `EditProfileScreen({super.key, required this.controller}); @override ConsumerState<EditProfileScreen> createState() => _EditProfileScreenState(); } class _EditProfileScreenState extends ConsumerState<EditProfileScreen> { final formKey = GlobalKey<FormState>(); late TextEditingController birthDay; @override void initState()`
*No documentation provided (generation failed).*

### `dispose()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `Directionality(textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl, child: KeyboardDismisser( child: ThemeWrapper( builder: (colors, theme)`
*No documentation provided (generation failed).*

### `Container(margin: MediaQuery.of(context).viewInsets, decoration: BoxDecoration( color: colors.backgroundColor.withValues(alpha: 0.96), borderRadius: BorderRadius.only( topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r), ), ), width: double.infinity, child: state.isLoading ? const Loading() : Padding( padding: EdgeInsets.symmetric(horizontal: 16.w), child: SingleChildScrollView( controller: widget.controller, child: Form( key: formKey, child: Column( mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [ Column( mainAxisSize: MainAxisSize.max, crossAxisAlignment: CrossAxisAlignment.start, children: [ 8.verticalSpace, Center( child: Container( height: 4.h, width: 48.w, decoration: BoxDecoration( color: AppStyle.dragElement, borderRadius: BorderRadius.all( Radius.circular(40.r), ), ), ), ), 24.verticalSpace, TitleAndIcon( title: AppHelpers.getTranslation( TrKeys.profileSettings, ), paddingHorizontalSize: 0, titleSize: 18, ), 24.verticalSpace, Stack( children: [ Container( decoration: BoxDecoration( borderRadius: BorderRadius.circular( 42.r, ), color: AppStyle.shimmerBase, ), child: ClipRRect( borderRadius: BorderRadius.circular( 42.r, ), child: ((user?.img?.isNotEmpty ?? false) && state.imagePath.isEmpty) ? CustomNetworkImage( profile: true, url: user!.img ?? "", height: 84.r, width: 84.r, radius: 42.r, ) : state.imagePath.isNotEmpty ? Image.file( File(state.imagePath), width: 84.r, height: 84.r, ) : CustomNetworkImage( profile: true, url: state.url, height: 84.r, width: 84.r, radius: 42.r, ), ), ), Padding( padding: EdgeInsets.only( top: 56.h, left: 50.w, ), child: GestureDetector( onTap: ()`
*No documentation provided (generation failed).*

### `Icon(FlutterRemix.pencil_line, ), ), ), ), ], ), 24.verticalSpace, OutlinedBorderTextField( readOnly: AppValidators.isValidEmail( user?.email ?? '', ), label: AppHelpers.getTranslation( TrKeys.email, ).toUpperCase(), initialText: user?.email ?? "", validation: AppValidators.emailCheck, onChanged: event.setEmail, ), 34.verticalSpace, Row( mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [ SizedBox( width: (MediaQuery.sizeOf(context).width - 40) / 2, child: OutlinedBorderTextField( label: AppHelpers.getTranslation( TrKeys.firstname, ).toUpperCase(), initialText: user?.firstname ?? "", validation: AppValidators.isNotEmptyValidator, onChanged: (s)`
*No documentation provided (generation failed).*

### `PhoneVerify(), isDarkMode: false, paddingTop: MediaQuery.paddingOf( context, ).top, ); }, ), 34.verticalSpace, OutlinedBorderTextField( onTap: ()`
*No documentation provided (generation failed).*
