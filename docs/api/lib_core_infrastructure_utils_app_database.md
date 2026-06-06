# API Reference: app_database

Source file: `lib/core/infrastructure/utils/app_database.dart`

## Classes

### class `AppDatabase`

## Whitelisted API Endpoints

### `select(productsTable).get(); for (final product in products)`
*No documentation provided (generation failed).*

### `jsonDecode(dataString) as Map<String, Dyn>; }).toList(); } /// Delete an item by key. Future<void> deleteItem(String boxName, String key) async { final table = getTable(boxName); await (delete(table)..where((tbl)`
*No documentation provided (generation failed).*

### `into(syncQueueTable).insert(request); } Future<int> enqueueSyncRequest({ required String url, required String method, required Map<String, Dyn> payload, })`
*No documentation provided (generation failed).*

### `insertSyncRequest(SyncQueueTableCompanion.insert( id: Value(const Uuid().v4()), url: url, method: method, payload: jsonEncode(payload), createdAt: DateTime.now(), ), ); } Future<List<SyncQueueEntity>> getPendingSyncRequests()`
*No documentation provided (generation failed).*

### `abandonSyncRequest(SyncQueueEntity request, { String? error, }) async { await transaction(() async { await into(abandonedSyncQueueTable).insert( AbandonedSyncQueueTableCompanion.insert( id: request.id, url: request.url, method: request.method, payload: request.payload, createdAt: request.createdAt, abandonedAt: DateTime.now(), lastError: Value(error), ), ); await removeSyncRequest(request.id); }); } Future<List<SyncQueueEntity>> getSyncRequestsByMethod(String method)`
*No documentation provided (generation failed).*

### `incrementSyncRetry(String id, {String? error}) async { final query = select(syncQueueTable)..where((t) => t.id.equals(id)); final request = await query.getSingleOrNull(); if (request != null)`
*No documentation provided (generation failed).*

### `searchProducts({ String? query, String? categoryId, }) async { final search = select(productsTable); if (query != null && query.isNotEmpty)`
Search products locally using flattened columns

### `upsertProduct(Map<String, Dyn> json) async { final id = json['uuid'] ?? json['id']?.toString() ?? ''; if (id.isEmpty) return; await into(productsTable).insertOnConflictUpdate( ProductsTableCompanion.insert( id: Value(id), title: Value(json['translation']?['title'] ?? json['title']), barcode: Value(json['bar_code'] ?? json['barcode']), categoryId: Value(json['category_id']?.toString()), active: Value(json['active'] == 1 || json['active'] == true), img: Value(json['img']), unitId: Value(json['unit_id']?.toString()), data: jsonEncode(json), ), ); } Future<void> upsertCategory(Map<String, Dyn> json) async { final id = json['name'] ?? json['id']?.toString() ?? ''; if (id.isEmpty) return; await putItem('categories', id, json); } Future<List<Map<String, Dyn>>> getCategoriesLocally() async { return getAll('categories'); } Future<void> upsertShop(Map<String, Dyn> json) async { final id = json['id']?.toString() ?? json['uuid'] ?? ''; if (id.isEmpty) return; await putItem('shop', id, json); } Future<List<Map<String, Dyn>>> getShopsLocally({String? categoryId}) async { final allShops = await getAll('shop'); if (categoryId != null)`
High-quality upsert that flattens data on the fly

### `into(orderItemsTable).insertOnConflictUpdate( OrderItemsTableCompanion.insert( id: Value(itemId), orderId: id, productId: Value(item['product_id']?.toString()), stockId: Value(item['stock_id']?.toString()), quantity: Value(item['quantity'] as int?), price: Value((item['price'] as num?)?.toDouble()), costPrice: Value((item['cost_price'] as num?)?.toDouble()), ), ); } } Insertable<Dyn> _createInsertable(String boxName, String id, String data)`
*No documentation provided (generation failed).*
