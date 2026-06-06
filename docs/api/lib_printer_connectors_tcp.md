# API Reference: tcp

Source file: `lib/printer/connectors/tcp.dart`

## Classes

### class `TcpConnector`

## Whitelisted API Endpoints

### `TcpConnector() => _instance; TcpConnector._internal(); bool _isConnected = false; bool get isConnected => _isConnected; Socket? _socket; Future<List<PrinterDevice>> discover() async { final List<PrinterDevice> devices = []; try { final interfaces = await NetworkInterface.list( includeLinkLocal: false, type: InternetAddressType.IPv4, ); final List<String> subnets = []; for (final interface in interfaces)`
*No documentation provided (generation failed).*

### `Duration(milliseconds: 400), ); socket.destroy(); devices.add( PrinterDevice( name: 'Network Printer ($ip)', address: ip, type: PrinterType.tcp, ), ); } catch (_)`
*No documentation provided (generation failed).*

### `connect(String ipAddress, {int port = 9100}) async { try { _socket = await Socket.connect( ipAddress, port, timeout: const Duration(seconds: 5), ); _isConnected = true; return true; } catch (e)`
*No documentation provided (generation failed).*

### `disconnect() async { if (_socket != null)`
*No documentation provided (generation failed).*

### `sendBytes(List<int> bytes) async { if (!_isConnected || _socket == null) return; try { _socket!.add(bytes); await _socket!.flush(); } catch (e)`
*No documentation provided (generation failed).*
