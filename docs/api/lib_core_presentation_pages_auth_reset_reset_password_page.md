# API Reference: reset_password_page

Source file: `lib/core/presentation/pages/auth/reset/reset_password_page.dart`

## Classes

### class `ResetPasswordPage`

## Whitelisted API Endpoints

### `ResetPasswordPage({super.key}); @override ConsumerState<ResetPasswordPage> createState() => _ResetPasswordPageState(); } class _ResetPasswordPageState extends ConsumerState<ResetPasswordPage> with SingleTickerProviderStateMixin { final formKey = GlobalKey<FormState>(); late TabController _tabController; @override void initState()`
*No documentation provided (generation failed).*

### `dispose()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `Directionality(textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl, child: AbsorbPointer( absorbing: state.isLoading, child: ThemeWrapper( builder: (colors, theme)`
*No documentation provided (generation failed).*

### `KeyboardDismisser(child: Container( padding: MediaQuery.of(context).viewInsets, decoration: BoxDecoration( color: colors.backgroundColor.withValues(alpha: 0.96), borderRadius: BorderRadius.only( topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r), ), ), width: double.infinity, child: Padding( padding: const EdgeInsets.all(16.0), child: SingleChildScrollView( child: Column( mainAxisAlignment: MainAxisAlignment.spaceBetween, mainAxisSize: MainAxisSize.min, children: [ Form( key: formKey, child: Column( children: [ AppBarBottomSheet( title: AppHelpers.getTranslation( TrKeys.resetPassword, ), ), Text( AppHelpers.getTranslation( TrKeys.resetPasswordText, ), style: AppStyle.interRegular( size: 14, color: colors.textBlack, ), ), 24.verticalSpace, if (AppHelpers.getAuthOption() == SignUpType.both) AuthTabBar( tabController: _tabController, colors: colors, ), SizedBox( height: 76.r, child: AppHelpers.getAuthOption() == SignUpType.both ? TabBarView( physics: const NeverScrollableScrollPhysics(), controller: _tabController, children: [ Directionality( textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl, child: PhoneTextField( onChanged: (phoneNum)`
*No documentation provided (generation failed).*
