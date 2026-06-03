# API Reference: refund_screen

Source file: `lib/customer/presentation/pages/order/order_check/widgets/refund_screen.dart`

## Classes

### class `RefundScreen`

## Whitelisted API Endpoints

### `RefundScreen({super.key}); @override State<RefundScreen> createState() => _RefundScreenState(); } class _RefundScreenState extends State<RefundScreen> { late TextEditingController textEditingController; @override void initState()`
*No documentation provided (generation failed).*

### `dispose()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `Container(margin: MediaQuery.of(context).viewInsets, decoration: BoxDecoration( color: AppStyle.bgGrey.withValues(alpha: 0.96), borderRadius: BorderRadius.only( topLeft: Radius.circular(12.r), topRight: Radius.circular(12.r), ), ), width: double.infinity, child: SingleChildScrollView( child: Column( children: [ Padding( padding: EdgeInsets.symmetric(horizontal: 16.w), child: Column( mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [ 8.verticalSpace, Center( child: Container( height: 4.h, width: 48.w, decoration: BoxDecoration( color: AppStyle.dragElement, borderRadius: BorderRadius.all(Radius.circular(40.r)), ), ), ), 14.verticalSpace, TitleAndIcon( title: AppHelpers.getTranslation(TrKeys.reFound), paddingHorizontalSize: 0, ), 24.verticalSpace, OutlinedBorderTextField( textController: textEditingController, label: AppHelpers.getTranslation( TrKeys.whyDoYouWant, ).toUpperCase(), ), 146.verticalSpace, Padding( padding: EdgeInsets.only( bottom: MediaQuery.paddingOf(context).bottom + 24.h, ), child: Consumer( builder: (context, ref, child)`
*No documentation provided (generation failed).*

### `CustomButton(isLoading: ref.watch(orderProvider).isButtonLoading, title: AppHelpers.getTranslation(TrKeys.send), onPressed: ()`
*No documentation provided (generation failed).*
