# API Reference: filter_page

Source file: `lib/customer/presentation/pages/home/filter/filter_page.dart`

## Classes

### class `FilterPage`

## Whitelisted API Endpoints

### `FilterPage({ super.key, required this.categoryId, required this.controller, }); @override ConsumerState<ConsumerStatefulWidget> createState() => _FilterPageState(); } class _FilterPageState extends ConsumerState<FilterPage> { List rating = ["2.5 - 3.5", "3.5 - 4.5", "4.5 - 5.0", "5.0"]; List sorts = [ AppHelpers.getTranslation(TrKeys.trustYou), AppHelpers.getTranslation(TrKeys.bestSale), AppHelpers.getTranslation(TrKeys.highlyRated), AppHelpers.getTranslation(TrKeys.lowSale), AppHelpers.getTranslation(TrKeys.lowRating), ]; final _freeDeliveryController = ValueNotifier<bool>(false); final _dealsController = ValueNotifier<bool>(false); final _openController = ValueNotifier<bool>(true); @override void initState()`
*No documentation provided (generation failed).*

### `dispose()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `Directionality(textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl, child: Container( decoration: BoxDecoration( color: AppStyle.bgGrey, borderRadius: BorderRadius.only( topLeft: Radius.circular(12.r), topRight: Radius.circular(12.r), ), ), width: double.infinity, child: Padding( padding: const EdgeInsets.all(16.0), child: ListView( controller: widget.controller, children: [ 8.verticalSpace, Center( child: Container( height: 4.h, width: 48.w, decoration: BoxDecoration( color: AppStyle.dragElement, borderRadius: BorderRadius.circular(40.r), ), ), ), 18.verticalSpace, TitleAndIcon( title: "${AppHelpers.getTranslation(TrKeys.filter)} (${!state.isLoading ? state.shopCount : AppHelpers.getTranslation(TrKeys.loading)})", rightTitleColor: AppStyle.red, rightTitle: AppHelpers.getTranslation(TrKeys.clearAll), onRightTap: ()`
*No documentation provided (generation failed).*

### `Loading(), ) : Column( children: [ 8.verticalSpace, state.endPrice > 1 ? _priceRange(state, event) : const SizedBox.shrink(), 8.verticalSpace, FilterItem( title: AppHelpers.getTranslation(TrKeys.rating), list: rating, isRating: true, currentItem: state.filterModel?.rating, onTap: (s)`
*No documentation provided (generation failed).*

### `Container(width: double.infinity, padding: EdgeInsets.only( left: 10.w, right: 10.w, top: 18.h, bottom: 10.h, ), decoration: BoxDecoration( color: AppStyle.white.withValues(alpha: 0.9), borderRadius: BorderRadius.circular(10.r), ), child: Column( children: [ Text( AppHelpers.getTranslation(TrKeys.priceRange), style: AppStyle.interNoSemi(size: 16, color: AppStyle.black), ), 18.verticalSpace, Row( crossAxisAlignment: CrossAxisAlignment.end, children: [ Padding( padding: EdgeInsets.only(bottom: 2.h), child: SizedBox( width: 64.w, child: Text( AppHelpers.numberFormat(state.rangeValues.start), style: AppStyle.interNormal( size: 14, color: AppStyle.black, ), ), ), ), Expanded( child: Column( children: [ Padding( padding: EdgeInsets.only(right: 22.r), child: Row( crossAxisAlignment: CrossAxisAlignment.end, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [ for (int i = 0; i < state.prices.length; i++) Container( width: 8.w, height: 100.h / state.prices[i], decoration: BoxDecoration( color: ((state.rangeValues.start / (state.endPrice / 20)) .round() <= i) && ((state.rangeValues.end / (state.endPrice / 20)) .round() >= i) ? AppStyle.primary : AppStyle.bgGrey, borderRadius: BorderRadius.circular(48.r), ), ), ], ), ), 8.verticalSpace, Padding( padding: EdgeInsets.only(right: 24.r), child: RangeSlider( activeColor: AppStyle.primary, inactiveColor: AppStyle.bgGrey, min: state.startPrice, max: state.endPrice, values: state.rangeValues, onChanged: (value)`
*No documentation provided (generation failed).*
