# API Reference: background_sync_service

Source file: `lib/core/infrastructure/utils/background_sync_service.dart`

## Classes

### class `BackgroundSyncService`

### class `SyncResult`

## Whitelisted API Endpoints

### `Failure(4xx): ${result.error}'; await database.abandonSyncRequest(request, error: errorMsg); final currentCount = LocalStorage.getSyncErrorCount(); await LocalStorage.setSyncErrorCount(currentCount + 1); await LocalStorage.setLastSyncError(errorMsg); } else { await database.incrementSyncRetry(request.id, error: result.error); continue; } } } finally { _isProcessing = false; } } Future<SyncResult> _sendRequestWithStatus(SyncQueueEntity request) async { try { final client = httpService.client(requireAuth: true); client.options.connectTimeout = const Duration(seconds: 30); client.options.receiveTimeout = const Duration(seconds: 30); final data = jsonDecode(request.payload); final options = Options( method: request.method, headers: {'X-Idempotency-Key': request.id}, ); final response = await client.request( request.url, data: data, options: options, ); final statusCode = response.statusCode ?? 0; if (statusCode >= 200 && statusCode < 300)`
*No documentation provided (generation failed).*
