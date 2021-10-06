import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanQRPage extends StatefulWidget {
  const ScanQRPage({Key? key}) : super(key: key);

  @override
  _ScanQRPageState createState() => _ScanQRPageState();
}

class _ScanQRPageState extends State<ScanQRPage> {
  String qrResult = 'Scanned Code Result Will Appear here';

  Future<void> scanQRCode()async{
    try{
      final qrCode = await FlutterBarcodeScanner.scanBarcode('#ff6666', 'Cancel', true, ScanMode.QR);
      if(!mounted)return;
      setState(() {
        print('qr code is '+qrCode);
        this.qrResult = qrCode.toString();
      });
    }on PlatformException {
      qrResult = 'Fail to read QR Code';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code Scanner'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 30,),
            Text('$qrResult',style: TextStyle(color: Colors.black,fontSize: 18),),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: scanQRCode, child: Text('Scan Code'))
          ],
        ),
      ),
    );
  }
}
