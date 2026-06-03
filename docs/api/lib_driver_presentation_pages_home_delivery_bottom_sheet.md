# API Reference: delivery_bottom_sheet

Source file: `lib/driver/presentation/pages/home/delivery_bottom_sheet.dart`

## Classes

### class `DeliverBottomSheetScreen`

## Whitelisted API Endpoints

### `DeliverBottomSheetScreen({super.key, required this.order}); @override State<DeliverBottomSheetScreen> createState() => _DeliverBottomSheetScreenState(); } class _DeliverBottomSheetScreenState extends State<DeliverBottomSheetScreen> { TextEditingController noteCon = TextEditingController(); final formKey = GlobalKey<FormState>(); @override void dispose()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `Align(alignment: Alignment.bottomCenter, child: Consumer( builder: (context, ref, child)`
*No documentation provided (generation failed).*

### `SizedBox(height: ref.watch(homeProvider).isGoUser ? MediaQuery.sizeOf(context).height * 1.8 / 3 : MediaQuery.sizeOf(context).height * 2 / 3, width: double.infinity, child: DraggableScrollableSheet( initialChildSize: 0.2, maxChildSize: 1, minChildSize: 0.16, snap: true, builder: (context, scrollController) => Container( width: MediaQuery.sizeOf(context).width, decoration: BoxDecoration( color: AppStyle.textGrey, borderRadius: BorderRadius.only( topRight: Radius.circular(12.r), topLeft: Radius.circular(12.r), ), boxShadow: [ BoxShadow( color: AppStyle.black.withValues(alpha: 0.25), blurRadius: 40, offset: const Offset(0, -2), ), ], ), child: ListView( controller: scrollController, padding: EdgeInsets.only( top: 8.h, bottom: MediaQuery.paddingOf(context).bottom + 16.h, left: 16.w, right: 16.w, ), children: [ Container( height: 4.h, margin: EdgeInsets.symmetric( horizontal: (MediaQuery.sizeOf(context).width - 100.w) / 2, ), decoration: BoxDecoration( color: AppStyle.dragElement, borderRadius: BorderRadius.circular(40.r), ), ), 24.verticalSpace, OrderItem( order: widget.order, isDeliveryShop: ref.watch(homeProvider).isGoRestaurant, isDeliveryClient: ref.watch(homeProvider).isGoUser, ), 24.verticalSpace, ref.watch(homeProvider).isGoRestaurant ? Column( children: [ CustomButton( title: AppHelpers.getTranslation( TrKeys.orderInformation, ), onPressed: ()`
*No documentation provided (generation failed).*

### `SizedBox(height: 10), CustomButton( title: AppHelpers.getTranslation(TrKeys.cancel), textColor: Colors.white, background: AppStyle.red, onPressed: ()`
*No documentation provided (generation failed).*

### `Container(decoration: BoxDecoration( color: AppStyle.white, borderRadius: BorderRadius.circular(10.r), ), padding: EdgeInsets.symmetric( vertical: 30.h, horizontal: 24.w, ), child: Column( mainAxisSize: MainAxisSize.min, children: [ RichText( textAlign: TextAlign.center, text: TextSpan( text: AppHelpers.getTranslation( TrKeys.areYouSure, ), style: AppStyle.interNormal( size: 16.sp, ), ), ), Form( key: formKey, child: UnderlinedBorderTextField( textController: noteCon, label: 'Note', validator: (p0)`
*No documentation provided (generation failed).*

### `CustomButton(title: AppHelpers.getTranslation( TrKeys.confirmation, ), background: AppStyle.black, textColor: AppStyle.white, borderColor: Colors.transparent, onPressed: ()`
*No documentation provided (generation failed).*
