# API Reference: filter_notifier

Source file: `lib/core/application/filter/filter_notifier.dart`

## Classes

### class `FilterNotifier`

## Whitelisted API Endpoints

### `build() => const FilterState(); int shopIndex = 1; int marketRefreshIndex = 1; final _delayed = Delayed(milliseconds: 700); Future<void> setFilterModel( BuildContext context, FilterModel? data, int categoryId, ) async { state = state.copyWith(filterModel: data); final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `clear(BuildContext context, int categoryId)`
*No documentation provided (generation failed).*

### `setCheck(BuildContext context, bool check, bool deal, bool open, int categoryId, ) async { state.filterModel?.isFreeDelivery = check; state.filterModel?.isDeal = deal; state.filterModel?.isOpen = open; state = state.copyWith(freeDelivery: check, deals: deal, open: open); final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `setRange(RangeValues values, BuildContext context, int categoryId)`
*No documentation provided (generation failed).*

### `init(BuildContext context, int categoryId) async { state = state.copyWith(filterModel: FilterModel(), isTagLoading: true); final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `fetchRestaurant(BuildContext context, int categoryId) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `fetchRestaurantPage(BuildContext context, RefreshController shopController, int categoryId, { bool isRefresh = false, }) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*
