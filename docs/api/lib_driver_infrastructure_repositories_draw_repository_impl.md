# API Reference: draw_repository_impl

Source file: `lib/driver/infrastructure/repositories/draw_repository_impl.dart`

## Classes

### class `DrawRepositoryImpl`

## Whitelisted API Endpoints

### `getRouting({ required LatLng start, required LatLng end, }) async { try { final client = dioHttp.client(requireAuth: false, routing: true); final response = await client.get( '/v2/directions/driving-car?api_key=${AppConstants.routingKey}&start=${start.longitude},${start.latitude}&end=${end.longitude},${end.latitude}', ); return ApiResult.success(data: DrawRouting.fromJson(response.data)); } catch (e)`
*No documentation provided (generation failed).*
