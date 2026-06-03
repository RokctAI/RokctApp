# API Reference: about_page

Source file: `lib/customer/presentation/pages/profile/about_page.dart`

## Classes

### class `AboutPage`

## Whitelisted API Endpoints

### `AboutPage({super.key}); @override ConsumerState<AboutPage> createState() => _AboutPageState(); } class _AboutPageState extends ConsumerState<AboutPage> { @override void initState()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `CustomScaffold(body: (colors) => ListView( children: [ CommonAppBar( child: Text( AppHelpers.getTranslation(TrKeys.about), style: AppStyle.interNoSemi(size: 18, color: colors.textBlack), ), ), 12.verticalSpace, state.isLoading ? Column(children: [200.verticalSpace, Loading()]) : ListView.builder( shrinkWrap: true, padding: EdgeInsets.symmetric(horizontal: 20.r), physics: const NeverScrollableScrollPhysics(), itemCount: state.about.length, itemBuilder: (context, index)`
*No documentation provided (generation failed).*
