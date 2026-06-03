# API Reference: address_list

Source file: `lib/customer/presentation/pages/profile/address_list.dart`

## Classes

### class `AddressListPage`

## Whitelisted API Endpoints

### `AddressListPage({super.key}); @override State<AddressListPage> createState() => _AddressListPageState(); } class _AddressListPageState extends State<AddressListPage> { final bool isLtr = LocalStorage.getLangLtr(); @override void initState()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child)`
*No documentation provided (generation failed).*

### `Directionality(textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl, child: CustomScaffold( body: (colors) => Column( children: [ CommonAppBar( child: Text( AppHelpers.getTranslation(TrKeys.deliveryAddress), style: AppStyle.interNoSemi( size: 18, color: colors.textBlack, ), ), ), Expanded( child: ListView.builder( padding: EdgeInsets.only( left: 18.r, right: 18.r, bottom: 72.r, top: 24.r, ), itemCount: state.length, itemBuilder: (context, index)`
*No documentation provided (generation failed).*

### `SelectAddressItem(onTap: ()`
*No documentation provided (generation failed).*

### `Padding(padding: EdgeInsets.symmetric(horizontal: 16.w), child: Row( children: [ PopButton( onTap: ()`
*No documentation provided (generation failed).*
