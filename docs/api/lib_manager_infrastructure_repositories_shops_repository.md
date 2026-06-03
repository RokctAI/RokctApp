# API Reference: shops_repository

Source file: `lib/manager/infrastructure/repositories/shops_repository.dart`

## Classes

### class `ShopsRepository`

## Whitelisted API Endpoints

### `createShop({ required double tax, required List<String> documents, required double deliveryTo, required double deliveryFrom, required String deliveryType, required String phone, required String name, required num category, required String description, required double startPrice, required double perKm, required AddressData address, String? logoImage, String? backgroundImage, }) async { final data = { "price_per_km": perKm, 'tax': tax, 'documents': documents, 'delivery_time_type': deliveryType, 'location': address.location?.toJson(), 'phone': phone.replaceAll('+', ""), 'delivery_time_from': deliveryFrom, 'delivery_time_to': deliveryTo, 'title': {LocalStorage.getLanguage()?.locale ?? "": name}, 'description': {LocalStorage.getLanguage()?.locale ?? "": description}, 'price': startPrice, 'address': { LocalStorage.getLanguage()?.locale ?? "": "${address.title}, ${address.address}", }, if (logoImage != null) 'images': [logoImage, backgroundImage], }; try { final client = dioHttp.client(requireAuth: true); await client.post('/api/v1/dashboard/user/shops', data: data); return const ApiResult.success(data: null); } catch (e)`
*No documentation provided (generation failed).*
