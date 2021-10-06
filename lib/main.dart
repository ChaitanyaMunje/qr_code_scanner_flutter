
import 'package:flutter/material.dart';
import 'package:text_to_speech_application/qr_scanner.dart';
import 'package:text_to_speech_application/text_to_speech.dart';

import 'GenerateQRCode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Code Scanner and Generator',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('QR Code Scanner and Generator'),backgroundColor: Colors.blue,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: (){
                  setState(() {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScanQRPage()));
                  });
                },
                child: Text('Scan Qr Code')),
            SizedBox(height: 30,),
            ElevatedButton(
                onPressed: (){
                  setState(() {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => GenerateQrCode()));
                  });
                },
                child: Text('Generate Qr Code')),
          ],
        ),
      ),
    );
  }
}
