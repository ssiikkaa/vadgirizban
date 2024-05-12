import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/api_speaking.dart';
import 'package:flutter_application_2/widgets/loder.dart';
import 'package:flutter_application_2/widgets/my_txt.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:flutter_application_2/widgets/spik.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:ionicons/ionicons.dart';
import 'package:http/http.dart' as http;

class Speaking extends StatefulWidget {
  const Speaking({super.key});

  @override
  State<Speaking> createState() => _SpeakingState();
}

class _SpeakingState extends State<Speaking> {
  bool isLoading = true;

  List? Speaking_data = [];
  Future<List<GeAllSpeaking>?> get_api_speaking() async {
    const infouri = 'http://ssiikkaabani.ir/speking/speking_get';
    var my_data = await http
        .get(Uri.parse(infouri), headers: {"Content-type": "application/json"});
    if (my_data.statusCode == 200) {
      var x = my_data.body;
      Speaking_data = geAllSpeakingFromJson(x);
      setState(() {
        isLoading = false;
      });
    }
  }

  stt.SpeechToText _speech = stt.SpeechToText();
  String _text = '';

  @override
  void initState() {
    super.initState();
    initSpeech();
    _speech.initialize(onError: (error) => print('Error: $error'));
    get_api_speaking();
  }

  void startListening() {
    _speech.listen(onResult: (result) {
      setState(() {
        _text = result.recognizedWords;
      });
    });
  }

  final stt.SpeechToText _speechToText = stt.SpeechToText();
  bool _speechEnabel = false;
  String _wordsSpoken = "";
  double _confidenceLevel = 0;

  Future<void> initSpeech() async {
    _speechEnabel = await _speechToText.initialize();
    setState(() {});
  }

  void _startLesanig() async {
    await _speechToText.listen(
      onResult: _onSpeechResult,
      localeId: 'en_US',
    );
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
    String textSeech = "nice to meet you";
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        child: isLoading
            ? const Center(
                child: LoderWidgets(),
              )
            : SafeArea(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyText(
                    text:
                        "پس از فشردن دکمه مربط عبارت انگلیسی زیر را تلفظ کنید",
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.end,
                    fontFamily: "my_FA",
                    size: 18.0,
                  ),
                  // const Text(".پس از فشردن دکمه مربط عبارت انگلیسی زیر را تلفظ کنیذ",
                  //     textAlign: TextAlign.end,
                  //     style: TextStyle(
                  //       fontSize: 18.0,
                  //       fontWeight: FontWeight.bold,
                  //     )),
                  Spike(
                    textEN: Speaking_data![0].mainSentence,
                    child: const CircleAvatar(
                        child: Center(child: Icon(Icons.play_arrow_rounded))),
                  ),
                  Text(
                    Speaking_data![0].mainSentence,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(Speaking_data![0].meaningSentence,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      )),
                  form_container(
                    Center(
                      child: Text(_wordsSpoken,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: _wordsSpoken == textSeech
                                ? Colors.green.withOpacity(0.77)
                                : Colors.red.withOpacity(0.77),
                          )),
                    ),
                  ),
                  _wordsSpoken == ""
                      ? SizedBox()
                      : Icon(
                          _wordsSpoken == textSeech
                              ? IconlyBold.tickSquare
                              : IconlyBold.closeSquare,
                          color: _wordsSpoken == textSeech
                              ? Colors.green.withOpacity(0.77)
                              : Colors.red.withOpacity(0.77),
                          size: 40.0,
                        ),
                  SizedBox(
                    height: myheight * 0.12,
                  ),
                  my_container_mic(),
                ],
              )),
      ),
    );
  }

  Widget form_container(Widget child) {
    double myheight = MediaQuery.of(context).size.height;
    double mywidth = MediaQuery.of(context).size.width;
    return Container(
      height: myheight * 0.08,
      width: mywidth,
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10.0)),
      child: child,
    );
  }

  Widget my_container_mic() {
    double myheight = MediaQuery.of(context).size.height;
    double mywidth = MediaQuery.of(context).size.width;
    bool is_true_spike = false;
    return Container(
      width: mywidth,
      height: myheight * 0.19,
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.3),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Ionicons.settings_sharp,
              color: Colors.grey,
            ),
            SizedBox(
              width: mywidth * 0.03,
            ),
            FloatingActionButton(
              onPressed:
                  _speechToText.isListening ? _stopListenuing : _startLesanig,
              // tooltip: "listen",
              child: Icon(
                _speechToText.isNotListening ? Icons.mic_off : Icons.mic,
                color: Colors.black,
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
    );
  }
}
