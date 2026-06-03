# API Reference: table_notifier

Source file: `lib/manager/application/order/shipping/table/table_notifier.dart`

## Classes

### class `TableNotifier`

## Whitelisted API Endpoints

### `clearSelectTableInfo()`
*No documentation provided (generation failed).*

### `setSelectTable(int index)`
*No documentation provided (generation failed).*

### `setQuery({ RefreshController? refreshController, required String text, required int? sectionId, })`
*No documentation provided (generation failed).*

### `Duration(milliseconds: 300), ()`
*No documentation provided (generation failed).*

### `fetchMoreTables({ RefreshController? refreshController, required int? sectionId, }) async { if (!_hasMore)`
*No documentation provided (generation failed).*

### `refreshTables({ RefreshController? refreshController, required int? sectionId, }) async { debugPrint('===> refresh tables function called'); _page = 0; final response = await managerTableRepository.getTables( query: _query.isEmpty ? null : _query.trim(), page: ++_page, shopSectionId: sectionId, ); response.when( success: (data)`
*No documentation provided (generation failed).*

### `initialFetchTables({ RefreshController? refreshController, int? sectionId, }) async { _query = ''; if (state.tables.isNotEmpty)`
*No documentation provided (generation failed).*
