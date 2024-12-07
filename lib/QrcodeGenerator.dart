import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:qrcodeapp/QrcodeScanner.dart';

class Qrcodegenerator extends StatefulWidget {
  const Qrcodegenerator({super.key});

  @override
  State<Qrcodegenerator> createState() => _QrcodegeneratorState();
}

class _QrcodegeneratorState extends State<Qrcodegenerator> {
  String? qrData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Qrcodescanner(),
                    ));
              },
              icon: Icon(Icons.qr_code_scanner_rounded))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onSubmitted: (event) {
                setState(() {
                  qrData = event;
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            if (qrData != null) PrettyQrView.data(data: qrData!)
          ],
        ),
      ),
    );
  }
}
