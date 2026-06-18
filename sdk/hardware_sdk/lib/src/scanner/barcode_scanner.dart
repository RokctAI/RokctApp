import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class HardwareBarcodeScanner extends StatefulWidget {
  final ValueChanged<String> onScan;
  final Widget? overlay;

  const HardwareBarcodeScanner({
    super.key,
    required this.onScan,
    this.overlay,
  });

  @override
  State<HardwareBarcodeScanner> createState() => _HardwareBarcodeScannerState();
}

class _HardwareBarcodeScannerState extends State<HardwareBarcodeScanner> {
  final MobileScannerController _controller = MobileScannerController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MobileScanner(
      controller: _controller,
      overlayBuilder: widget.overlay != null ? (context, constraints) => widget.overlay! : null,
      onDetect: (capture) {
        final List<Barcode> barcodes = capture.barcodes;
        for (final barcode in barcodes) {
          if (barcode.rawValue != null) {
            widget.onScan(barcode.rawValue!);
          }
        }
      },
    );
  }
}
