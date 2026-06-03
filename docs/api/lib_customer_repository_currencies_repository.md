# API Reference: currencies_repository

Source file: `lib/customer/repository/currencies_repository.dart`

## Classes

### class `CurrenciesRepository`

## Whitelisted API Endpoints

### `getCurrencies() async { try { final client = dioHttp.client(requireAuth: false); final response = await client.get('/api/v1/rest/currencies/active'); return ApiResult.success( data: CurrenciesResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*
