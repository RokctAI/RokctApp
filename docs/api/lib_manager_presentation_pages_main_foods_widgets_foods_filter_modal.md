# API Reference: foods_filter_modal

Source file: `lib/manager/presentation/pages/main/foods/widgets/foods_filter_modal.dart`

## Classes

### class `FoodsFilterModal`

## Whitelisted API Endpoints

### `dispose()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `Directionality(textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl, child: Container( decoration: BoxDecoration( color: AppStyle.textGrey, borderRadius: BorderRadius.only( topLeft: Radius.circular(12.r), topRight: Radius.circular(12.r), ), ), width: double.infinity, child: Padding( padding: REdgeInsets.all(16), child: ListView( primary: false, children: [ 18.verticalSpace, TitleAndIcon( title: '${AppHelpers.getTranslation(TrKeys.filter)} (${!state.isLoading ? state.shopCount : AppHelpers.getTranslation(TrKeys.loading)})', rightTitleColor: AppStyle.red, rightTitle: AppHelpers.getTranslation(TrKeys.clearAll), onRightTap: event.clear, ), state.isTagLoading ? Padding( padding: REdgeInsets.only(top: 56), child: const Loading(), ) : Column( children: [ 8.verticalSpace, 8.verticalSpace, FoodsFilterItem( title: AppHelpers.getTranslation(TrKeys.rating), list: rating, isRating: true, onTap: (s)`
*No documentation provided (generation failed).*
