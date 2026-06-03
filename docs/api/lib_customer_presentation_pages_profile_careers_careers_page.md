# API Reference: careers_page

Source file: `lib/customer/presentation/pages/profile/careers/careers_page.dart`

## Classes

### class `CareerPage`

## Whitelisted API Endpoints

### `CareerPage({super.key}); @override ConsumerState<CareerPage> createState() => _CareerDataPageState(); } class _CareerDataPageState extends ConsumerState<CareerPage> { @override void initState()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `CustomScaffold(body: (colors) => Column( children: [ CommonAppBar( child: Text( AppHelpers.getTranslation(TrKeys.careers), style: AppStyle.interNoSemi(size: 18), ), ), 20.verticalSpace, state.isLoading ? Column(children: [200.verticalSpace, Loading()]) : ListView.builder( itemCount: state.careers.length, shrinkWrap: true, padding: EdgeInsets.symmetric(horizontal: 20.r), itemBuilder: (context, index)`
*No documentation provided (generation failed).*

### `InkWell(onTap: ()`
*No documentation provided (generation failed).*
