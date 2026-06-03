# API Reference: login_page

Source file: `lib/core/presentation/pages/auth/login/login_page.dart`

## Classes

### class `LoginPage`

## Whitelisted API Endpoints

### `LoginPage({super.key}); @override ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState(); } class _LoginPageState extends ConsumerState<LoginPage> { @override void initState()`
*No documentation provided (generation failed).*

### `selectLanguage()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `Directionality(textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl, child: ThemeWrapper( builder: (colors, theme)`
*No documentation provided (generation failed).*

### `CustomScaffold(body: (colors) => Container( decoration: const BoxDecoration( image: DecorationImage( image: AssetImage(Assets.imageSplash), fit: BoxFit.fill, ), ), child: SafeArea( child: Padding( padding: REdgeInsets.symmetric(horizontal: 16.w), child: Column( mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [ Row( children: [ Expanded( child: Text( AppHelpers.getAppName() ?? "", style: AppStyle.interSemi(color: AppStyle.white), ), ), 8.horizontalSpace, const Spacer(), if (AppConstants.flavor == AppFlavor.customer) TextButton( onPressed: ()`
*No documentation provided (generation failed).*
