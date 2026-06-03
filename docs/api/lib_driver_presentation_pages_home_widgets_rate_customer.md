# API Reference: rate_customer

Source file: `lib/driver/presentation/pages/home/widgets/rate_customer.dart`

## Classes

### class `RateCustomer`

## Whitelisted API Endpoints

### `RateCustomer({super.key, this.order, this.parcel}); @override State<RateCustomer> createState() => _RateCustomerState(); } class _RateCustomerState extends State<RateCustomer> { double rate = 0; String note = ""; @override Widget build(BuildContext context)`
*No documentation provided (generation failed).*

### `Padding(padding: EdgeInsets.symmetric(horizontal: 16.w), child: Column( crossAxisAlignment: CrossAxisAlignment.start, children: [ TitleAndIcon(title: AppHelpers.getTranslation(TrKeys.evaluation)), Text( AppHelpers.getTranslation(TrKeys.yourFeedbackService), style: AppStyle.interNormal(size: 14.sp), ), 24.verticalSpace, Text( AppHelpers.getTranslation(TrKeys.rateTheCustomer), style: AppStyle.interSemi(size: 16.sp), ), 14.verticalSpace, Container( width: double.infinity, decoration: BoxDecoration( color: AppStyle.white, borderRadius: BorderRadius.circular(10.r), ), padding: EdgeInsets.all(16.r), child: RatingBar.builder( itemBuilder: (context, index) => Icon(FlutterRemix.star_fill, color: AppStyle.primary), itemCount: 5, itemPadding: EdgeInsets.symmetric(horizontal: 11.r), direction: Axis.horizontal, onRatingUpdate: (double value)`
*No documentation provided (generation failed).*

### `CustomButton(title: AppHelpers.getTranslation(TrKeys.send), onPressed: ()`
*No documentation provided (generation failed).*

### `GestureDetector(onTap: ()`
*No documentation provided (generation failed).*
