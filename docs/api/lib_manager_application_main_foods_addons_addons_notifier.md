# API Reference: addons_notifier

Source file: `lib/manager/application/main/foods/addons/addons_notifier.dart`

## Classes

### class `AddonsNotifier`

## Whitelisted API Endpoints

### `AddonsState()); Future<void> _search() async { _hasMore = true; _page = 0; state = state.copyWith(isLoading: true); final response = await _productsRepository.getProducts( page: ++_page, query: _query.isEmpty ? null : _query.trim(), needAddons: true, ); response.when( success: (data)`
*No documentation provided (generation failed).*

### `fetchMoreAddons({RefreshController? refreshController}) async { if (!_hasMore)`
*No documentation provided (generation failed).*

### `initialFetchAddons() async { if (state.addons.isNotEmpty)`
*No documentation provided (generation failed).*

### `refreshAddons({RefreshController? refreshController}) async { refreshController?.resetNoData(); _hasMore = true; _page = 0; final response = await _productsRepository.getProducts( page: ++_page, query: _query.isEmpty ? null : _query.trim(), needAddons: true, ); response.when( success: (data)`
*No documentation provided (generation failed).*

### `setQuery(String text)`
*No documentation provided (generation failed).*

### `Duration(milliseconds: 500), () => _search()); } else { if (_timer?.isActive ?? false)`
*No documentation provided (generation failed).*
