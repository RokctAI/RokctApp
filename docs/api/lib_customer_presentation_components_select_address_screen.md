# API Reference: select_address_screen

Source file: `lib/customer/presentation/components/select_address_screen.dart`

## Classes

### class `SelectAddressScreen`

## Whitelisted API Endpoints

### `SelectAddressScreen({super.key, required this.addAddress}); @override ConsumerState<SelectAddressScreen> createState() => _SelectAddressScreenState(); } class _SelectAddressScreenState extends ConsumerState<SelectAddressScreen> { @override void initState()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `Directionality(textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl, child: ThemeWrapper( builder: (colors, theme)`
*No documentation provided (generation failed).*

### `KeyboardDismisser(child: Container( decoration: BoxDecoration( color: colors.backgroundColor.withValues(alpha: 0.96), borderRadius: BorderRadius.only( topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r), ), ), width: double.infinity, child: SingleChildScrollView( child: Padding( padding: EdgeInsets.symmetric(horizontal: 16.w), child: Column( mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [ 8.verticalSpace, Center( child: Container( height: 4.h, width: 48.w, decoration: BoxDecoration( color: AppStyle.dragElement, borderRadius: BorderRadius.all( Radius.circular(40.r), ), ), ), ), 24.verticalSpace, TitleAndIcon( title: AppHelpers.getTranslation(TrKeys.selectAddress), paddingHorizontalSize: 0, titleSize: 18, ), 24.verticalSpace, ListView.builder( padding: EdgeInsets.zero, physics: const NeverScrollableScrollPhysics(), shrinkWrap: true, itemCount: ref .watch(profileProvider) .userData ?.addresses ?.length ?? 0, itemBuilder: (context, index)`
*No documentation provided (generation failed).*

### `SelectAddressItem(onTap: ()`
*No documentation provided (generation failed).*
