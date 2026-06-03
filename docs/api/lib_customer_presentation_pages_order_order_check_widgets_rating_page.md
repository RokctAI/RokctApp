# API Reference: rating_page

Source file: `lib/customer/presentation/pages/order/order_check/widgets/rating_page.dart`

## Classes

### class `RatingPage`

## Whitelisted API Endpoints

### `RatingPage({super.key, this.parcel = false, required this.totalPrice}); @override ConsumerState<RatingPage> createState() => _RatingPageState(); } class _RatingPageState extends ConsumerState<RatingPage> { late TextEditingController textEditingController; late TextEditingController priceController; double rating = 0; double price = 0; List<num> tips = [5, 10, 15, -1]; @override void initState()`
*No documentation provided (generation failed).*

### `dispose()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `ThemeWrapper(builder: (colors, theme) => Container( margin: MediaQuery.of(context).viewInsets, decoration: BoxDecoration( color: AppStyle.bgGrey.withValues(alpha: 0.96), borderRadius: BorderRadius.only( topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r), ), ), padding: EdgeInsets.symmetric(horizontal: 16.w), width: double.infinity, child: SingleChildScrollView( child: Column( mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [ 8.verticalSpace, Center( child: Container( height: 4.h, width: 48.w, decoration: BoxDecoration( color: AppStyle.dragElement, borderRadius: BorderRadius.circular(40.r), ), ), ), 24.verticalSpace, TitleAndIcon( title: AppHelpers.getTranslation(TrKeys.ratingCourier), paddingHorizontalSize: 0, titleSize: 16, ), 12.verticalSpace, OutlinedBorderTextField( textController: textEditingController, label: AppHelpers.getTranslation(TrKeys.comment).toUpperCase(), ), 24.verticalSpace, RatingBar.builder( itemBuilder: (context, index) => Icon(FlutterRemix.star_smile_fill, color: colors.primary), itemCount: 5, itemPadding: EdgeInsets.symmetric(horizontal: 14.h), direction: Axis.horizontal, onRatingUpdate: (double value)`
*No documentation provided (generation failed).*

### `GestureDetector(onTap: ()`
*No documentation provided (generation failed).*

### `CustomButton(isLoading: widget.parcel ? ref.watch(parcelProvider).isButtonLoading : ref.watch(orderProvider).isButtonLoading, title: AppHelpers.getTranslation(TrKeys.save), onPressed: ()`
*No documentation provided (generation failed).*

### `WebViewPage(url: s), ), ).whenComplete(()`
*No documentation provided (generation failed).*

### `OrdersListRoute(), ); } }); }, onSuccess: ()`
*No documentation provided (generation failed).*
