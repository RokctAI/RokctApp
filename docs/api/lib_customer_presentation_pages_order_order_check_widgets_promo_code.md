# API Reference: promo_code

Source file: `lib/customer/presentation/pages/order/order_check/widgets/promo_code.dart`

## Classes

### class `PromoCodeScreen`

## Whitelisted API Endpoints

### `PromoCodeScreen({super.key, required this.colors}); @override ConsumerState<PromoCodeScreen> createState() => _PromoCodeState(); } class _PromoCodeState extends ConsumerState<PromoCodeScreen> { late PromoCodeNotifier event; late PromoCodeState state; late TextEditingController promoCodeController = TextEditingController(); final _delayed = Delayed(milliseconds: 700); @override void initState()`
*No documentation provided (generation failed).*

### `didChangeDependencies()`
*No documentation provided (generation failed).*

### `dispose()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `Container(margin: MediaQuery.of(context).viewInsets, decoration: BoxDecoration( color: colors.backgroundColor.withValues(alpha: 0.96), borderRadius: BorderRadius.only( topLeft: Radius.circular(12.r), topRight: Radius.circular(12.r), ), ), width: double.infinity, child: SingleChildScrollView( child: Column( children: [ Padding( padding: EdgeInsets.symmetric(horizontal: 16.w), child: Column( mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [ 8.verticalSpace, Center( child: Container( height: 4.h, width: 48.w, decoration: BoxDecoration( color: AppStyle.dragElement, borderRadius: BorderRadius.all(Radius.circular(40.r)), ), ), ), 14.verticalSpace, TitleAndIcon( title: AppHelpers.getTranslation(TrKeys.addPromoCode), paddingHorizontalSize: 0, rightTitle: AppHelpers.getTranslation(TrKeys.clear), rightTitleColor: AppStyle.red, onRightTap: ()`
*No documentation provided (generation failed).*
