# API Reference: usb

Source file: `lib/printer/connectors/usb.dart`

## Classes

### class `UsbConnector`

## Whitelisted API Endpoints

### `UsbConnector() => _instance; UsbConnector._internal(); static const MethodChannel _channel = MethodChannel( 'com.rokctapp.printer/usb', ); bool _isConnected = false; bool get isConnected => _isConnected; Future<List<PrinterDevice>> getDevices() async { if (!Platform.isAndroid) return []; try { final List<Dyn>? result = await _channel.invokeMethod('getDevices'); if (result == null) return []; return result.map((e)`
*No documentation provided (generation failed).*

### `PrinterDevice(name: map['name'] ?? 'USB Printer', vendorId: vId, productId: pId, address: 'usb://${vId}_$pId', type: PrinterType.usb, ); }).toList(); } catch (e)`
*No documentation provided (generation failed).*

### `connect(String vendorId, String productId) async { if (!Platform.isAndroid) return false; try { final int? vId = int.tryParse(vendorId); final int? pId = int.tryParse(productId); if (vId == null || pId == null) return false; final bool? result = await _channel.invokeMethod('connect', { 'vendorId': vId, 'productId': pId, }); _isConnected = result ?? false; return _isConnected; } catch (e)`
*No documentation provided (generation failed).*

### `disconnect() async { if (!Platform.isAndroid || !_isConnected) return; try { await _channel.invokeMethod('disconnect'); _isConnected = false; } catch (e)`
*No documentation provided (generation failed).*

### `sendBytes(List<int> bytes) async { if (!Platform.isAndroid || !_isConnected) return; try { await _channel.invokeMethod('sendBytes', { 'bytes': Uint8List.fromList(bytes), }); } catch (e)`
*No documentation provided (generation failed).*
