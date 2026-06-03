# API Reference: printer_manager

Source file: `lib/printer/printer_manager.dart`

## Classes

### class `PrinterManager`

## Whitelisted API Endpoints

### `PrinterManager() => _instance; PrinterManager._internal(); final BluetoothConnector _bluetooth = BluetoothConnector(); final PrinterDiscovery _discovery = PrinterDiscovery(); bool get isConnected => _bluetooth.isConnected; Future<bool> checkPermission() => _bluetooth.checkPermission(); Future<List<PrinterDevice>> discoverPrinters() => _discovery.discoverAll(); Future<PrinterResponse> connect(String macAddress) async { final success = await _bluetooth.connect(macAddress); return success ? PrinterResponse.success() : PrinterResponse.failure('Failed to connect to Bluetooth printer'); } Future<PrinterResponse> disconnect() async { final success = await _bluetooth.disconnect(); return success ? PrinterResponse.success() : PrinterResponse.failure('Failed to disconnect'); } Future<PrinterResponse> printText(String text) async { if (!isConnected) return PrinterResponse.failure('Printer not connected'); await _bluetooth.sendBytes(text.codeUnits); return PrinterResponse.success(); } Future<PrinterResponse> printReceipt(PrintReceiptRequest request) async { if (!isConnected) return PrinterResponse.failure('Printer not connected'); List<int> bytes = []; bytes += EscPos.init; bytes += EscPos.alignCenter; bytes += EscPos.boldOn; bytes += EscPos.textLarge; bytes += _textToBytes(request.shopName); bytes += EscPos.lineFeed; bytes += EscPos.textNormal; bytes += EscPos.boldOff; if (request.address1.isNotEmpty)`
*No documentation provided (generation failed).*
