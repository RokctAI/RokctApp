# API Reference: view_map_modal

Source file: `lib/customer/presentation/pages/view_map/view_map_modal.dart`

## Classes

### class `ViewMapModal`

## Whitelisted API Endpoints

### `ViewMapModal({ super.key, required this.controller, required this.address, required this.latLng, required this.isShopLocation, required this.onSearch, required this.colors, }); @override ConsumerState<ViewMapModal> createState() => _ViewMapModalState(); } class _ViewMapModalState extends ConsumerState<ViewMapModal> { late TextEditingController office; late TextEditingController house; late TextEditingController floor; final GlobalKey<FormState> fromKey = GlobalKey<FormState>(); @override void initState()`
*No documentation provided (generation failed).*

### `dispose()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `Container(margin: MediaQuery.viewInsetsOf(context), padding: EdgeInsets.symmetric(horizontal: 16.r), decoration: BoxDecoration( color: widget.colors.backgroundColor, borderRadius: BorderRadius.only( topRight: Radius.circular(16.r), topLeft: Radius.circular(16.r), ), ), child: Column( mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.center, children: [ 8.verticalSpace, Container( width: 49.w, height: 3.h, decoration: BoxDecoration( borderRadius: BorderRadius.circular(40.r), color: AppStyle.dragElement, ), ), 16.verticalSpace, Align( alignment: Alignment.centerLeft, child: Text( AppHelpers.getTranslation(TrKeys.enterADeliveryAddress), style: AppStyle.interNoSemi( size: 18, color: widget.colors.textBlack, ), ), ), 24.verticalSpace, SearchTextField( isRead: true, isBorder: true, textEditingController: widget.controller, onTap: () async { }, ), 24.verticalSpace, Form( key: fromKey, child: Column( mainAxisSize: MainAxisSize.min, children: [ OutlinedBorderTextField( textController: office, label: AppHelpers.getTranslation(TrKeys.title).toUpperCase(), validation: (s)`
*No documentation provided (generation failed).*
