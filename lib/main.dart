import 'package:flutter/material.dart';
import 'package:treasure_hunt/code_scan.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String? qrCodeResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Scanner Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              qrCodeResult ?? 'No QR code scanned yet.',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // QR 스캔 페이지로 이동
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QRScannerPage()),
                );

                // QR 코드 스캔 결과를 받아옴
                if (result != null) {
                  setState(() {
                    qrCodeResult = result;
                  });
                }
              },
              child: Text('Scan QR Code'),
            ),
          ],
        ),
      ),
    );
  }
}
