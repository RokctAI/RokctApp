# API Reference: table_repository

Source file: `lib/manager/infrastructure/repositories/table_repository.dart`

## Classes

### class `TableRepository`

## Whitelisted API Endpoints

### `createNewSection({ required String name, required num area, }) async { try { final client = dioHttp.client(requireAuth: true); final response = await client.post( '/api/v1/dashboard/${LocalStorage.getUser()?.role}/shop-sections', queryParameters: { "area": area, "images": [], "title": {LocalStorage.getLanguage()?.locale ?? 'en': name}, }, ); return ApiResult.success( data: ShopSection.fromJson(response.data["data"]), ); } catch (e)`
*No documentation provided (generation failed).*

### `getSection({ int? page, String? query, }) async { final data = { if (page != null) 'page': page, if (query != null) 'search': query, 'perPage': 14, 'lang': LocalStorage.getLanguage()?.locale ?? 'en', }; try { final client = dioHttp.client(requireAuth: true); final response = await client.get( '/api/v1/dashboard/${LocalStorage.getUser()?.role}/shop-sections', queryParameters: data, ); return ApiResult.success( data: ShopSectionResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `createNewTable({ required TableModel tableModel, }) async { try { final client = dioHttp.client(requireAuth: true); await client.post( '/api/v1/dashboard/${LocalStorage.getUser()?.role}/tables', queryParameters: tableModel.toJson(), ); return const ApiResult.success(data: null); } catch (e)`
*No documentation provided (generation failed).*

### `getTables({ int? page, String? query, int? shopSectionId, String? type, DateTime? from, DateTime? to, }) async { from ??= from ?? DateTime.now(); to ??= to ?? DateTime.now(); to = to.add(const Duration(days: 1)); final data = { if (page != null) 'page': page, 'perPage': 14, 'lang': LocalStorage.getLanguage()?.locale ?? 'en', if (query != null) 'search': query, 'status': TrKeys.available, if (shopSectionId != null) "shop_section_id": shopSectionId, if (type != null) "date_from": TimeService.dateFormatYMDHm(from), if (type != null) "date_to": TimeService.dateFormatYMDHm(to), }; try { final client = dioHttp.client(requireAuth: true); final response = await client.get( '/api/v1/dashboard/${LocalStorage.getUser()?.role}/tables', queryParameters: data, ); return ApiResult.success(data: TableResponse.fromJson(response.data)); } catch (e)`
*No documentation provided (generation failed).*

### `getTableOrders({ int? page, int? id, String? type, DateTime? from, DateTime? to, }) async { to = to != null ? to.add(const Duration(days: 1)) : from; final data = { if (page != null) 'page': page, 'lang': LocalStorage.getLanguage()?.locale ?? 'en', if (type != null) 'status': type, if (from != null) "start_from": from.toString().substring( 0, from.toString().indexOf(" "), ), if (to != null) "start_to": to.toString().substring(0, to.toString().indexOf(" ")), }; try { final client = dioHttp.client(requireAuth: true); final response = await client.get( '/api/v1/dashboard/${LocalStorage.getUser()?.role}/user-bookings', queryParameters: data, ); return ApiResult.success( data: TableBookingResponse.fromJson(response.data), ); } catch (e, s)`
*No documentation provided (generation failed).*

### `deleteSection(int id) async { try { final client = dioHttp.client(requireAuth: true); final response = await client.delete( '/api/v1/dashboard/${LocalStorage.getUser()?.role}/shop-sections/delete', queryParameters: {"ids[0]": id}, ); return ApiResult.success(data: TableResponse.fromJson(response.data)); } catch (e)`
*No documentation provided (generation failed).*

### `deleteTable(int id) async { try { final client = dioHttp.client(requireAuth: true); final response = await client.delete( '/api/v1/dashboard/${LocalStorage.getUser()?.role}/tables/delete', queryParameters: {"ids[0]": id}, ); return ApiResult.success(data: TableResponse.fromJson(response.data)); } catch (e)`
*No documentation provided (generation failed).*

### `disableDates({ required DateTime dateTime, required int? id, }) async { try { final client = dioHttp.client(requireAuth: true); final response = await client.get( '/api/v1/dashboard/${LocalStorage.getUser()?.role}/disable-dates/table/$id', queryParameters: { 'lang': LocalStorage.getLanguage()?.locale ?? 'en', "date_from": DateFormat("yyyy-MM-dd").format(dateTime), }, ); return ApiResult.success(data: disableDatesFromJson(response.data)); } catch (e)`
*No documentation provided (generation failed).*

### `getBookings({int? page}) async { try { final client = dioHttp.client(requireAuth: true); final response = await client.get( '/api/v1/dashboard/${LocalStorage.getUser()?.role}/bookings', queryParameters: { 'lang': LocalStorage.getLanguage()?.locale ?? 'en', 'page': page, 'perPage': 100, }, ); return ApiResult.success(data: BookingsResponse.fromJson(response.data)); } catch (e)`
*No documentation provided (generation failed).*

### `setBookings({ int? bookingId, int? tableId, DateTime? startDate, DateTime? endDate, }) async { try { final client = dioHttp.client(requireAuth: true); await client.post( '/api/v1/dashboard/${LocalStorage.getUser()?.role}/user-bookings', data: { 'booking_id': bookingId, 'end_date': TimeService.dateFormatYMDHm(endDate ?? DateTime.now()), 'start_date': TimeService.dateFormatYMDHm( startDate ?? DateTime.now(), ), "table_id": tableId, }, ); return const ApiResult.success(data: null); } catch (e)`
*No documentation provided (generation failed).*

### `getWorkingDay() async { try { final client = dioHttp.client(requireAuth: true); final response = await client.get( '/api/v1/dashboard/${LocalStorage.getUser()?.role}/booking/shop-working-days/${LocalStorage.getUser()?.shop?.uuid}', queryParameters: {'lang': LocalStorage.getLanguage()?.locale ?? 'en'}, ); return ApiResult.success( data: WorkingDayResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `getCloseDay() async { try { final client = dioHttp.client(requireAuth: true); final response = await client.get( '/api/v1/dashboard/${LocalStorage.getUser()?.role}/booking/shop-closed-dates/${LocalStorage.getUser()?.shop?.uuid}', queryParameters: {'lang': LocalStorage.getLanguage()?.locale ?? 'en'}, ); return ApiResult.success(data: CloseDayResponse.fromJson(response.data)); } catch (e)`
*No documentation provided (generation failed).*

### `getTableInfo(int id) async { try { final client = dioHttp.client(requireAuth: true); final response = await client.get( '/api/v1/dashboard/${LocalStorage.getUser()?.role}/user-bookings/$id', queryParameters: {'lang': LocalStorage.getLanguage()?.locale ?? 'en'}, ); return ApiResult.success(data: TableInfoResponse.fromJson(response.data)); } catch (e)`
*No documentation provided (generation failed).*

### `changeOrderStatus({ required String status, required int id, }) async { try { final client = dioHttp.client(requireAuth: true); await client.post( '/api/v1/dashboard/${LocalStorage.getUser()?.role}/user-booking/status/$id', queryParameters: {'status': status}, ); return const ApiResult.success(data: null); } catch (e)`
*No documentation provided (generation failed).*

### `getStatistic({ DateTime? from, DateTime? to, }) async { from ??= from ?? DateTime.now(); to ??= to ?? DateTime.now(); to = to.add(const Duration(days: 1)); try { final client = dioHttp.client(requireAuth: true); final response = await client.get( '/api/v1/dashboard/${LocalStorage.getUser()?.role}/table/statistic', queryParameters: { "date_from": TimeService.dateFormatYMDHm(from), "date_to": TimeService.dateFormatYMDHm(to), }, ); return ApiResult.success( data: TableStatisticResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*
