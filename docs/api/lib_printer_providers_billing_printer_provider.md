# API Reference: billing_printer_provider

Source file: `lib/printer/providers/billing_printer_provider.dart`

## Classes

### class `BillingPrinterNotifier`

## Whitelisted API Endpoints

### `BillingPrinterState())`
*No documentation provided (generation failed).*

### `init()`
*No documentation provided (generation failed).*

### `connect(String mac, String name) async { state = state.copyWith( status: PrinterStatus.connecting, errorMessage: null, ); final response = await _printerManager.connect(mac); if (response.isSuccess)`
*No documentation provided (generation failed).*

### `disconnect() async { final response = await _printerManager.disconnect(); if (response.isSuccess)`
*No documentation provided (generation failed).*

### `printReceipt({ required String shopName, required String address1, required String address2, required String phone, required List<Map<String, Dyn>> items, required double total, required String footer, }) async { if (!_printerManager.isConnected) return; await _printerManager.printReceipt( PrintReceiptRequest( shopName: shopName, address1: address1, address2: address2, phone: phone, items: items, total: total, footer: footer, ), ); } } final billingPrinterProvider = StateNotifierProvider<BillingPrinterNotifier, BillingPrinterState>((ref)`
*No documentation provided (generation failed).*
