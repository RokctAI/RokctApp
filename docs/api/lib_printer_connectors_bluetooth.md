# API Reference: bluetooth

Source file: `lib/printer/connectors/bluetooth.dart`

## Classes

### class `BluetoothConnector`

## Whitelisted API Endpoints

### `BluetoothConnector() => _instance; BluetoothConnector._internal(); bool _isConnected = false; bool get isConnected => _isConnected; Future<bool> checkPermission() async { Map<Permission, PermissionStatus> statuses = await [ Permission.bluetooth, Permission.bluetoothScan, Permission.bluetoothConnect, Permission.location, ].request(); return statuses.values.every((status) => status.isGranted); } Future<List<PrinterDevice>> getBondedDevices() async { try { final List<BluetoothInfo> list = await PrintBluetoothThermal.pairedBluetooths; return list .map( (e) => PrinterDevice( name: e.name, address: e.macAdress, type: PrinterType.bluetooth, ), ) .toList(); } catch (e)`
*No documentation provided (generation failed).*

### `connect(String macAddress) async { try { final bool result = await PrintBluetoothThermal.connect( macPrinterAddress: macAddress, ); _isConnected = result; return result; } catch (e)`
*No documentation provided (generation failed).*

### `disconnect() async { try { final bool result = await PrintBluetoothThermal.disconnect; _isConnected = !result; return result; } catch (e)`
*No documentation provided (generation failed).*

### `sendBytes(List<int> bytes) async { if (!_isConnected) return; final bool connectionStatus = await PrintBluetoothThermal.connectionStatus; if (connectionStatus)`
*No documentation provided (generation failed).*
