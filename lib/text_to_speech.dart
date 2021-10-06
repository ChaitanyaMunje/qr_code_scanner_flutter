import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TextToSpeech extends StatelessWidget {
  const TextToSpeech({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  final TextEditingController _controller = TextEditingController();
  final flutterTts = FlutterTts();
  bool isPlaying = false;

  void initializeTextToSpeech(){
    flutterTts.setStartHandler(() {
      setState(() {
        isPlaying = true;
      });
    });
    flutterTts.setCompletionHandler(() {
      setState(() {
        isPlaying = false;
      });
    });
    flutterTts.setErrorHandler((message) {
      setState(() {
        isPlaying = false;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeTextToSpeech();
  }

  void speak() async{
    if(_controller.text.isNotEmpty){
      isPlaying = true;
      await flutterTts.speak(_controller.text);
    }else{
      Fluttertoast.showToast(
        msg: 'Please enter a valid data',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
    }
  }


  void stop() async{
    setState(() {
      flutterTts.stop();
      isPlaying = false;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    isPlaying = false;
    flutterTts.stop();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text to Speech'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SingleChildScrollView(
              reverse: true,
              child: Container(
                padding: EdgeInsets.fromLTRB(25, 25, 25, 25),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter your message',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))
                  ),
                  maxLines: 6,
                  controller: _controller,
                  style: TextStyle(color: Colors.black,fontSize: 15),
                ),
              ),
            ),
            FloatingActionButton(onPressed: (){
              isPlaying ? stop() : speak();
            },
              child: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
            ),
          ],
        ),
      )
    );
  }
}
