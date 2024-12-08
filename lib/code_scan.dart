import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRScannerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR코드 스캔'),
      ),
      body: MobileScanner(
        onDetect: (capture) {
          final List<Barcode> barcodes = capture.barcodes;
          print('detect');

          for (final barcode in barcodes) {
            final String? rawValue = barcode.rawValue;

            if (rawValue != null) {
              print('Barcode found! $rawValue');

              Navigator.pop(context, rawValue);
              break;
            }
          }
        },
      ),
    );
  }
}