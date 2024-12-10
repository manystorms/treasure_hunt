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
        title: Text('Scan QR Code'),
        actions: [
          IconButton(
            icon: Icon(Icons.flash_on),
            onPressed: () {
              controller.toggleTorch();
            },
          ),
          IconButton(
            icon: Icon(Icons.flip_camera_ios),
            onPressed: () {
              controller.switchCamera();
            },
          ),
        ],
      ),
      body: MobileScanner(
        controller: controller,
        allowDuplicates: false,
        onDetect: (barcode, args) {
          if (barcode.rawValue == null) {
            debugPrint('Failed to scan QR Code');
          } else {
            final String code = barcode.rawValue!;
            debugPrint('QR Code Scanned: $code');
            context.pop(code);
          }
        },
      ),
    );
  }
}
