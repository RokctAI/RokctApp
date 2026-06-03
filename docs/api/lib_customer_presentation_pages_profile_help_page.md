# API Reference: help_page

Source file: `lib/customer/presentation/pages/profile/help_page.dart`

## Classes

### class `HelpPage`

## Whitelisted API Endpoints

### `HelpPage({super.key}); @override ConsumerState<HelpPage> createState() => _HelpPageState(); } class _HelpPageState extends ConsumerState<HelpPage> { final bool isLtr = LocalStorage.getLangLtr(); @override void initState()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `Directionality(textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl, child: ThemeWrapper( builder: (colors, theme) => Scaffold( backgroundColor: colors.backgroundColor, body: state.isLoading ? const Loading() : Column( children: [ CommonAppBar( child: Text( AppHelpers.getTranslation(TrKeys.help), style: AppStyle.interNoSemi( size: 18, color: colors.textBlack, ), ), ), Expanded( child: ListView.builder( shrinkWrap: true, padding: EdgeInsets.only( top: 24.h, right: 16.w, left: 16.w, bottom: MediaQuery.paddingOf(context).bottom + 72.h, ), itemCount: (state.data?.data?.length ?? 0) + 1, itemBuilder: (context, index)`
*No documentation provided (generation failed).*
