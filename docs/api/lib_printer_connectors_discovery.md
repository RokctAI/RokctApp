# API Reference: discovery

Source file: `lib/printer/connectors/discovery.dart`

## Classes

### class `PrinterDiscovery`

## Whitelisted API Endpoints

### `PrinterDiscovery() => _instance; PrinterDiscovery._internal(); final BluetoothConnector _bluetooth = BluetoothConnector(); final TcpConnector _tcp = TcpConnector(); final UsbConnector _usb = UsbConnector(); Future<List<PrinterDevice>> discoverAll() async { final List<PrinterDevice> devices = []; final results = await Future.wait([ _bluetooth.getBondedDevices(), _tcp.discover(), _usb.getDevices(), ]); for (var list in results)`
*No documentation provided (generation failed).*
