# API Reference: draw_repository

Source file: `lib/customer/repository/draw_repository.dart`

## Classes

### class `DrawRepository`

## Whitelisted API Endpoints

### `getRouting({ required LatLng start, required LatLng end, }) async { try { final client = dioHttp.client(requireAuth: false, routing: true); final response = await client.get( '/v2/directions/driving-car', queryParameters: { "api_key": AppConstants.routingKey, "start": "${start.longitude},${start.latitude}", "end": "${end.longitude},${end.latitude}", }, ); return ApiResult.success(data: DrawRouting.fromJson(response.data)); } catch (e)`
*No documentation provided (generation failed).*
