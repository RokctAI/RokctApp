# API Reference: tcp

Source file: `lib/printer/connectors/tcp.dart`

## Classes

### class `TcpConnector`

## Whitelisted API Endpoints

### `TcpConnector() => _instance; TcpConnector._internal(); bool _isConnected = false; bool get isConnected => _isConnected; Socket? _socket; Future<List<PrinterDevice>> discover() async { return []; } Future<bool> connect(String ipAddress, {int port = 9100}) async { try { _socket = await Socket.connect( ipAddress, port, timeout: const Duration(seconds: 5), ); _isConnected = true; return true; } catch (e)`
*No documentation provided (generation failed).*

### `disconnect() async { if (_socket != null)`
*No documentation provided (generation failed).*

### `sendBytes(List<int> bytes) async { if (!_isConnected || _socket == null) return; try { _socket!.add(bytes); await _socket!.flush(); } catch (e)`
*No documentation provided (generation failed).*
