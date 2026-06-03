# API Reference: statistics_notifier

Source file: `lib/driver/application/statistics/statistics_notifier.dart`

## Classes

### class `StatisticsNotifier`

## Whitelisted API Endpoints

### `StatisticsState()); Future<void> fetchStatistics({ required DateTime endTime, required DateTime startTime, }) async { if (state.countData == null)`
*No documentation provided (generation failed).*

### `fetchStatisticsOrder({ DateTime? endTime, DateTime? startTime, }) async { page = 1; state = state.copyWith(isLoading: true, isRefresh: true); final response = await _userRepository.getStatisticsOrder( startTime: startTime, endTime: endTime, page: 1, ); response.when( success: (data)`
*No documentation provided (generation failed).*

### `fetchStatisticsOrderByDay({ DateTime? endTime, DateTime? startTime, }) async { page = 1; state = state.copyWith(isLoading: true, isRefresh: false); final response = await _userRepository.getStatisticsOrder( startTime: startTime, endTime: endTime, page: 1, perPage: 100, ); response.when( success: (data)`
*No documentation provided (generation failed).*

### `fetchStatisticsOrderPage({ DateTime? endTime, DateTime? startTime, RefreshController? refreshController, }) async { final response = await _userRepository.getStatisticsOrder( startTime: startTime, endTime: endTime, page: ++page, ); response.when( success: (data)`
*No documentation provided (generation failed).*

### `addListInfo()`
*No documentation provided (generation failed).*
