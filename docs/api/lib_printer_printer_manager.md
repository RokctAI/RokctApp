# API Reference: printer_manager

Source file: `lib/printer/printer_manager.dart`

## Classes

### class `PrinterManager`

## Whitelisted API Endpoints

### `PrinterManager() => _instance; PrinterManager._internal(); final BluetoothConnector _bluetooth = BluetoothConnector(); final TcpConnector _tcp = TcpConnector(); final UsbConnector _usb = UsbConnector(); final PrinterDiscovery _discovery = PrinterDiscovery(); PrinterType _activeType = PrinterType.unknown; bool get isConnected { switch (_activeType)`
*No documentation provided (generation failed).*

### `checkPermission() => _bluetooth.checkPermission(); Future<List<PrinterDevice>> discoverPrinters() => _discovery.discoverAll(); Future<PrinterResponse> connect(String address) async { bool success = false; String error = 'Failed to connect to printer'; if (address.startsWith('usb://'))`
*No documentation provided (generation failed).*

### `disconnect() async { bool success = true; switch (_activeType)`
*No documentation provided (generation failed).*

### `printText(String text) async { if (!isConnected) return PrinterResponse.failure('Printer not connected'); await _sendBytes(text.codeUnits); return PrinterResponse.success(); } Future<PrinterResponse> printReceipt(PrintReceiptRequest request) async { if (!isConnected) return PrinterResponse.failure('Printer not connected'); List<int> bytes = []; bytes += EscPos.init; bytes += EscPos.alignCenter; bytes += EscPos.boldOn; bytes += EscPos.textLarge; bytes += _textToBytes(request.shopName); bytes += EscPos.lineFeed; bytes += EscPos.textNormal; bytes += EscPos.boldOff; if (request.address1.isNotEmpty)`
*No documentation provided (generation failed).*
