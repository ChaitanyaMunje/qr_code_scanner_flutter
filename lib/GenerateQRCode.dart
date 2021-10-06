import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQrCode extends StatefulWidget {
  @override
  _GenerateQrCodeState createState() => _GenerateQrCodeState();
}

class _GenerateQrCodeState extends State<GenerateQrCode> {
  TextEditingController urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Qr Code Generator"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(urlController.text.isNotEmpty)
                QrImage(
                  data: urlController.text,
                  size: 200,
                ),

              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: TextField(
                  controller: urlController,
                  decoration: InputDecoration(
                    hintText: 'Enter your Data',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    labelText: 'Enter your Data',
                  ),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: Text('Generate Qr Code')),
              SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }
}
