# API Reference: login_screen

Source file: `lib/core/presentation/pages/auth/login/login_screen.dart`

## Classes

### class `LoginScreen`

## Whitelisted API Endpoints

### `LoginScreen({super.key, required this.colors}); @override ConsumerState<LoginScreen> createState() => _LoginScreenState(); } class _LoginScreenState extends ConsumerState<LoginScreen> with SingleTickerProviderStateMixin { final GlobalKey<FormState> key = GlobalKey<FormState>(); late TabController _tabController; final TextEditingController emailController = TextEditingController(); final TextEditingController passwordController = TextEditingController(); @override void initState()`
*No documentation provided (generation failed).*

### `dispose()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `Directionality(textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl, child: KeyboardDismisser( child: Container( margin: MediaQuery.viewInsetsOf(context), decoration: BoxDecoration( color: colors.backgroundColor.withValues(alpha: 0.96), borderRadius: BorderRadius.only( topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r), ), ), width: double.infinity, child: Padding( padding: const EdgeInsets.all(16.0), child: SingleChildScrollView( child: Column( mainAxisSize: MainAxisSize.min, children: [ Form( key: key, child: Column( mainAxisSize: MainAxisSize.min, children: [ AppBarBottomSheet( title: AppHelpers.getTranslation(TrKeys.login), ), 16.verticalSpace, if (AppHelpers.getAuthOption() == SignUpType.both) AuthTabBar( tabController: _tabController, colors: colors, ), SizedBox( height: 76.r, child: TabBarView( physics: NeverScrollableScrollPhysics(), controller: _tabController, children: [ Directionality( textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl, child: PhoneTextField( onChanged: (phoneNum)`
*No documentation provided (generation failed).*

### `ResetPasswordPage(), isDarkMode: isDarkMode, ); }, ), ], ), 8.verticalSpace, KeepLoggedCheckbox( value: state.isAgreedToTerms, onChanged: (value)`
*No documentation provided (generation failed).*

### `SocialButton(colors: colors, iconData: e, onPressed: ()`
*No documentation provided (generation failed).*
