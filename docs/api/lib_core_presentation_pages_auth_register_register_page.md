# API Reference: register_page

Source file: `lib/core/presentation/pages/auth/register/register_page.dart`

## Classes

### class `RegisterPage`

## Whitelisted API Endpoints

### `RegisterPage({super.key, required this.isOnlyEmail}); @override ConsumerState<RegisterPage> createState() => _RegisterPageState(); } class _RegisterPageState extends ConsumerState<RegisterPage> with SingleTickerProviderStateMixin { final phoneNumKey = GlobalKey<FormState>(); final formKey = GlobalKey<FormState>(); late TabController _tabController; @override void initState()`
*No documentation provided (generation failed).*

### `dispose()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `Directionality(textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl, child: KeyboardDismisser( child: ThemeWrapper( builder: (colors, theme)`
*No documentation provided (generation failed).*

### `Container(margin: MediaQuery.of(context).viewInsets, decoration: BoxDecoration( color: colors.backgroundColor.withValues(alpha: 0.96), borderRadius: BorderRadius.only( topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r), ), ), width: double.infinity, child: Padding( padding: const EdgeInsets.all(16.0), child: SingleChildScrollView( child: Column( mainAxisAlignment: MainAxisAlignment.spaceBetween, mainAxisSize: MainAxisSize.min, children: [ Form( key: formKey, child: Column( children: [ AppBarBottomSheet( title: AppHelpers.getTranslation(TrKeys.register), ), 16.verticalSpace, if (widget.isOnlyEmail && AppHelpers.getAuthOption() == SignUpType.both) AuthTabBar( tabController: _tabController, colors: colors, ), if (widget.isOnlyEmail) SizedBox( height: 76.r, child: AppHelpers.getAuthOption() == SignUpType.both ? TabBarView( physics: const NeverScrollableScrollPhysics(), controller: _tabController, children: [ Directionality( textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl, child: PhoneTextField( onChanged: (phoneNum)`
*No documentation provided (generation failed).*

### `SocialButton(colors: colors, iconData: e, onPressed: ()`
*No documentation provided (generation failed).*
