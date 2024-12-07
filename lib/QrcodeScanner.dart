import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qrcodeapp/QrcodeGenerator.dart';

class Qrcodescanner extends StatefulWidget {
  const Qrcodescanner({super.key});

  @override
  State<Qrcodescanner> createState() => _QrcodescannerState();
}

class _QrcodescannerState extends State<Qrcodescanner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scanner"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Qrcodegenerator(),
                    ));
              },
              icon: Icon(Icons.qr_code))
        ],
      ),
      body: MobileScanner(
        controller: MobileScannerController(
            detectionSpeed: DetectionSpeed.noDuplicates),
        onDetect: (capture) {
          List<Barcode> list = capture.barcodes;
          final image = capture.image;
          // if (image != null)
          for (final barcode in list) {
            showDialog(
              context: context,
              builder: (context) {
                return GestureDetector(
                  onTap: () async {
                    print("hai");
                    Uri uri = Uri.parse(barcode.rawValue!);
                  },
                  child: AlertDialog(
                    content: Text(barcode.rawValue!),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
