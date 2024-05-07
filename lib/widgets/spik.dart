import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:ionicons/ionicons.dart';

class Spike extends StatefulWidget {
  String? textEN;
  Widget? child;

  Spike({
    super.key,
    this.textEN = "",
    this.child,
  });

  @override
  State<Spike> createState() => _SpikeState();
}

class _SpikeState extends State<Spike> {
  FlutterTts _flutterTts = FlutterTts();
  Map? _currentVoice;

  @override
  void initState() {
    super.initState();
    initTTs();
  }

  void initTTs()async {
  await  _flutterTts.setLanguage("en-US");
  await _flutterTts.setSpeechRate(0.42);
  // await _flutterTts.speak(text);
    // _flutterTts.getVoices.then((data) {
    //   try {
    //     List<Map> _voices = List<Map>.from(data);
    //     _voices =
    //         _voices.where((_voice) => _voice['name'].contanins["en"]).toList();
    //     print(_voices);
    //     setState(() {
    //       _currentVoice = _voices.first;
    //       setVioce(_currentVoice!);
    //     });
    //   } catch (e) {
    //     print(e);
    //   }
    // });
  }

  void setVioce(Map voice) {
    _flutterTts.setVoice({"name": voice["name"], "locale": voice["locale"]});
  }

  @override
  Widget build(BuildContext context) {
    double myheight = MediaQuery.of(context).size.height;
    double mywidth = MediaQuery.of(context).size.width;
    return GestureDetector(
        onTap: () {
          _flutterTts.speak(widget.textEN!);
        },
        child: widget.child);
  }
  // Container(width: mywidth,height: myheight*0.05,color: Colors.amber,)

  // Spacer(),
  // my_butten(() {
  //   _flutterTts.speak("appel");
  // }, "textbtn"),
}
