import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechToText extends StatefulWidget {
  const SpeechToText({super.key});

  @override
  State<SpeechToText> createState() => _SpeechToTextState();
}

class _SpeechToTextState extends State<SpeechToText> {
  final stt.SpeechToText _speechToText = stt.SpeechToText();
  bool _speechEnabel = false;
  String _wordsSpoken = "";
  double _confidenceLevel = 0;

  @override
  void initState() {
    super.initState();
    initSpeech();
  }

  Future<void> initSpeech() async {
    _speechEnabel = await _speechToText.initialize();
    setState(() {});
  }

  void _startLesanig() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {
      _confidenceLevel = 0;
    });
  }

  void _stopListenuing() async {
    await _speechToText.stop();
    setState(() {});
  }

  void _onSpeechResult(result) {
    setState(() {
      _wordsSpoken = "${result.recognizedWords}";
      _confidenceLevel = result.confidence;
    });
  }

  @override
  Widget build(BuildContext context) {
     double myheight = MediaQuery.of(context).size.height;
    double mywidth = MediaQuery.of(context).size.width;
    bool is_true_spike = false;
    String textSeech = "";
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        child: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(".پس از فشردن دکمه مربط عبارت انگلیسی زیر را تلفظ کنیذ",
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                )),
            const CircleAvatar(
                child: Center(child: Icon(Icons.play_arrow_rounded))),
            const Text(
              "Nice to meet you",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text("از ملاقات شما خوشحالم",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                )),
            Text(textSeech,
                style:const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(
              height: myheight * 0.12,
            ),
            Container(
              width: mywidth,
              height: myheight * 0.21,
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Ionicons.settings_sharp,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: mywidth * 0.03,
                    ),
                    Container(
                      padding: EdgeInsets.all(9.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100)),
                      child: Icon(
                        Ionicons.mic_outline,
                        size: 50.0,
                      ),
                    ),
                    is_true_spike
                        ? Icon(
                            Icons.reset_tv_rounded,
                            size: 50.0,
                          )
                        : SizedBox(
                            width: mywidth * 0.03,
                          ),
                  ],
                ),
              ),
            ),
          ],
        )),
      ),
    );
    // return GestureDetector(
    //   onTap: _speechToText.isListening ? _stopListenuing : _startLesanig,
    //   child: widget.child,
    // );
    // return Scaffold(
    //   body: Padding(
    //     padding: const EdgeInsets.all(10.0),
    //     child: SafeArea(
    //       child: Column(
    //         // mainAxisAlignment: MainAxisAlignment.center,
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         children: [
    //           Container(
    //             padding: const EdgeInsets.all(20.0),
    //             child: Center(
    //               child: Text(
    //                 _speechToText.isListening
    //                     ? "Listening......."
    //                     : _speechEnabel
    //                         ? "tap to the start Lesning....."
    //                         : "Speech not availabel",
    //                 style: const TextStyle(fontSize: 20.0),
    //               ),
    //             ),
    //           ),
    //              Container(
    //             padding: const EdgeInsets.all(20.0),
    //             child: Center(
    //               child: Expanded(
    //                 child: Text(
    //                  widget.wordsSpoken!,
    //                   style: const TextStyle(fontSize: 20.0),
    //                 ),
    //               ),
    //             ),
    //           ),
              // FloatingActionButton(
              //   onPressed:
              //       _speechToText.isListening ? _stopListenuing : _startLesanig,
              //   tooltip: "listen",
              //   child: Icon(
              //     _speechToText.isNotListening ? Icons.mic_off : Icons.mic,
              //     color: Colors.black,
              //   ),
              // ),
    //           //  GestureDetector(

    //           //     child: Container(
    //           //       height: 80,
    //           //       width: double.infinity,
    //           //       color: Colors.amber,
    //           //     ),
    //           //   ),    SizedBox(height: 200,),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
