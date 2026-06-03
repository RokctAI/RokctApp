# API Reference: section_notifier

Source file: `lib/manager/application/order/shipping/section/section_notifier.dart`

## Classes

### class `SectionNotifier`

## Whitelisted API Endpoints

### `clearSelectSectionInfo()`
*No documentation provided (generation failed).*

### `setSelectSection(int index)`
*No documentation provided (generation failed).*

### `setQuery({RefreshController? refreshController, required String text})`
*No documentation provided (generation failed).*

### `Duration(milliseconds: 300), ()`
*No documentation provided (generation failed).*

### `fetchMoreSections({RefreshController? refreshController}) async { if (!_hasMore)`
*No documentation provided (generation failed).*

### `refreshSections({RefreshController? refreshController}) async { debugPrint('===> refresh sections function called'); _page = 0; final response = await managerTableRepository.getSection( query: _query.isEmpty ? null : _query.trim(), page: ++_page, ); response.when( success: (data)`
*No documentation provided (generation failed).*

### `initialFetchSections({ RefreshController? refreshController, }) async { _query = ''; if (state.sections.isNotEmpty)`
*No documentation provided (generation failed).*
