# API Reference: products_repository

Source file: `lib/manager/infrastructure/repositories/products_repository.dart`

## Classes

### class `ProductsRepository`

## Whitelisted API Endpoints

### `deleteExtrasGroup({int? groupId}) async { final data = { 'ids': [groupId], }; debugPrint('====> delete extras group request ${jsonEncode(data)}'); try { final client = dioHttp.client(requireAuth: true); await client.delete( '/api/v1/dashboard/seller/extra/groups/delete', data: data, ); return const ApiResult.success(data: null); } catch (e)`
*No documentation provided (generation failed).*

### `updateExtrasGroup({ required String title, int? groupId, }) async { final data = { 'title': {LocalStorage.getSystemLanguage()?.locale ?? 'en': title}, 'type': 'text', }; debugPrint('===> update extras group ${jsonEncode(data)}'); try { final client = dioHttp.client(requireAuth: true); final response = await client.put( '/api/v1/dashboard/seller/extra/groups/$groupId', data: data, ); return ApiResult.success( data: SingleExtrasGroupResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `deleteExtrasItem({required int extrasId}) async { final data = { 'ids': [extrasId], }; debugPrint('====> delete extras item request ${jsonEncode(data)}'); try { final client = dioHttp.client(requireAuth: true); await client.delete( '/api/v1/dashboard/seller/extra/values/delete', data: data, ); return const ApiResult.success(data: null); } catch (e)`
*No documentation provided (generation failed).*

### `updateExtrasItem({ required int extrasId, required int groupId, required String title, }) async { final data = {'value': title, 'extra_group_id': groupId}; debugPrint('===> update extras item ${jsonEncode(data)}'); try { final client = dioHttp.client(requireAuth: true); final response = await client.put( '/api/v1/dashboard/seller/extra/values/$extrasId', data: data, ); return ApiResult.success( data: CreateGroupExtrasResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `createExtrasItem({ required int groupId, required String title, }) async { final data = {'value': title, 'extra_group_id': groupId}; debugPrint('===> create extras item ${jsonEncode(data)}'); try { final client = dioHttp.client(requireAuth: true); final response = await client.post( '/api/v1/dashboard/seller/extra/values', data: data, ); return ApiResult.success( data: CreateGroupExtrasResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `createExtrasGroup({ required String title, }) async { final data = { 'title': {LocalStorage.getSystemLanguage()?.locale ?? 'en': title}, 'active': 1, 'type': 'text', }; debugPrint('===> create extras group ${jsonEncode(data)}'); try { final client = dioHttp.client(requireAuth: true); final response = await client.post( '/api/v1/dashboard/seller/extra/groups', data: data, ); return ApiResult.success( data: SingleExtrasGroupResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `getProductsCalculation(List<Stock> stocks, ) async { final data = {'currency_id': LocalStorage.getSelectedCurrency()?.id}; for (int i = 0; i < stocks.length; i++)`
*No documentation provided (generation failed).*

### `getExtras({int? groupId}) async { final data = {'lang': LocalStorage.getLanguage()?.locale}; try { final client = dioHttp.client(requireAuth: true); final response = await client.get( '/api/v1/dashboard/seller/extra/groups/$groupId', queryParameters: data, ); return ApiResult.success( data: GroupExtrasResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `updateStocks({ required List<Stock> stocks, required List<int> deletedStocks, String? uuid, bool isAddon = false, }) async { final List<Map<String, Dyn>> extras = []; for (final stock in stocks)`
*No documentation provided (generation failed).*

### `updateProduct({ required Map<String, List<String>> titlesAndDescriptions, required String tax, required String interval, required String minQty, required String maxQty, required bool active, String? qrcode, int? categoryId, int? unitId, int? kitchenId, List<String>? images, String? uuid, bool needAddons = false, }) async { final data = { 'title': { for (int i = 0; i < titlesAndDescriptions.keys.length; i++) titlesAndDescriptions.keys.toList()[i]: titlesAndDescriptions[titlesAndDescriptions.keys.toList()[i]] ?.first ?? "", }, 'description': { for (String locale in titlesAndDescriptions.keys) locale: titlesAndDescriptions[locale]?.last ?? "", }, 'tax': num.tryParse(tax), 'interval': num.tryParse(interval), 'min_qty': int.tryParse(minQty), 'max_qty': int.tryParse(maxQty), 'active': active ? 1 : 0, if (qrcode != null) 'bar_code': qrcode, if (categoryId != null) 'category_id': categoryId, if (kitchenId != null) 'kitchen_id': kitchenId, if (unitId != null) 'unit_id': unitId, if (images != null) 'images': images, if (needAddons) 'addon': 1, }; debugPrint('===> update product ${jsonEncode(data)}'); try { final client = dioHttp.client(requireAuth: true); final response = await client.put( '/api/v1/dashboard/seller/products/$uuid', data: data, ); return ApiResult.success( data: SingleProductResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `updateExtras({ required List<int> extrasIds, String? productUuid, }) async { final data = {'extras': extrasIds}; debugPrint('===> update extras ${jsonEncode(data)}'); try { final client = dioHttp.client(requireAuth: true); final response = await client.post( '/api/v1/dashboard/seller/products/$productUuid/extras', data: data, ); return ApiResult.success( data: SingleProductResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `getExtrasGroups({ bool needOnlyValid = true, }) async { final data = { 'lang': LocalStorage.getLanguage()?.locale, if (needOnlyValid) 'valid': true, "perPage": 50, }; try { final client = dioHttp.client(requireAuth: true); final response = await client.get( '/api/v1/dashboard/seller/extra/groups', queryParameters: data, ); return ApiResult.success( data: ExtrasGroupsResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `createProduct({ required String title, required String description, required String tax, required String interval, required String minQty, required String maxQty, required String qrcode, required bool active, int? categoryId, int? kitchenId, int? unitId, List<String>? images, bool isAddon = false, String type = 'single', String? uid, }) async { final data = { 'title': {LocalStorage.getSystemLanguage()?.locale ?? 'en': title}, 'description': { LocalStorage.getSystemLanguage()?.locale ?? 'en': description, }, 'tax': num.tryParse(tax), 'interval': num.tryParse(interval), 'min_qty': num.tryParse(minQty), 'max_qty': num.tryParse(maxQty), 'active': active ? 1 : 0, 'type': type, if (qrcode.isNotEmpty) 'sku': qrcode, if (uid != null && uid.isNotEmpty) 'uid': uid, if (kitchenId != null) 'kitchen_id': kitchenId, if (categoryId != null) 'category_id': categoryId, if (unitId != null) 'unit_id': unitId, if (images != null) 'images': images, if (isAddon) 'addon': 1, }; debugPrint('===> create product ${jsonEncode(data)}'); try { final client = dioHttp.client(requireAuth: true); final response = await client.post( '/api/v1/dashboard/seller/products', data: data, ); return ApiResult.success( data: SingleProductResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `getProductDetails(String uuid, ) async { final data = { 'currency_id': LocalStorage.getSelectedCurrency()?.id, 'lang': LocalStorage.getLanguage()?.locale, }; try { final client = dioHttp.client(requireAuth: true); final response = await client.get( '/api/v1/dashboard/seller/products/$uuid', queryParameters: data, ); return ApiResult.success( data: SingleProductResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `getProducts({ int? page, int? categoryId, String? query, ProductStatus? status, bool needAddons = false, bool active = false, String? type, }) async { String? statusText; if (status != null)`
*No documentation provided (generation failed).*
