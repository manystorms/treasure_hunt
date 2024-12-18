import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:treasure_hunt/flutter_flow/nav/nav.dart';

class CodeScanPageWidget extends StatefulWidget {
  const CodeScanPageWidget({super.key});

  @override
  _CodeScanPageWidgetState createState() => _CodeScanPageWidgetState();
}

class _CodeScanPageWidgetState extends State<CodeScanPageWidget> {
  late MobileScannerController controller;

  bool returnQrCode = false;

  @override
  void initState() {
    super.initState();
    controller = MobileScannerController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR 코드 스캔'),
        actions: [
          IconButton(
            icon: const Icon(Icons.flip_camera_android),
            onPressed: () {
              controller.switchCamera();
            },
          ),
        ],
      ),
      body: MobileScanner(
        controller: controller,
        onDetect: (capture) {
          final List<Barcode> barcodes = capture.barcodes;
          for (final barcode in barcodes) {
            if (barcode.rawValue != null) {
              final String code = barcode.rawValue!;
              debugPrint('QR Code Scanned: $code');
              if(returnQrCode == false) {
                returnQrCode = true;
                context.pop(code);
              }
              break;
            }
          }
        },
      ),
    );
  }
}
