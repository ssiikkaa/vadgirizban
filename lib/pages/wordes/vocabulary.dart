import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/model/api_vocabulary.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_2/widgets/my_txt.dart';
import 'package:flutter_application_2/widgets/spik.dart';

class Vocabulary extends StatefulWidget {
  const Vocabulary({super.key});

  @override
  State<Vocabulary> createState() => _VocabularyState();
}

class _VocabularyState extends State<Vocabulary> {
  List? vocabularyData = [];
  bool isloding = true;
  var api_list;
  Future<List<GeAllVocabulary>?> get_api_Vocabulary() async {
    const infourl = 'http://ssiikkaabani.ir/vocabulary/vocabulary_get';
    var my_data = await http
        .get(Uri.parse(infourl), headers: {"Content-type": "application/json"});
    if (my_data.statusCode == 200) {
      var x = my_data.body;
      vocabularyData = geAllVocabularyFromJson(x);
      setState(() {
        isloding = false;
      });
    }
  }

  List<dynamic> jasonData = [];

  @override
  void initState() {
    super.initState();
    loadJasonData();
    get_api_Vocabulary();
  }

  Future<void> loadJasonData() async {
    var jasonString = await rootBundle.loadString("assets/word/word.json");
    setState(() {
      jasonData = json.decode(jasonString);
    });
    print(jasonData);
  }

  @override
  Widget build(BuildContext context) {
    double myheight = MediaQuery.of(context).size.height;
    double mywidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Vocabulary",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27.0),
        ),
      ),
      body: isloding
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      // itemExtent: 10.0,
                      scrollDirection: Axis.horizontal,
                      itemCount: vocabularyData!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              image_word(vocabularyData![index].image),
                              word_spik(vocabularyData![index].mainWord),
                              SizedBox(
                                height: myheight * 0.08,
                              ),
                              description(
                                vocabularyData![index].mainWord,
                                vocabularyData![index].meaningWord,
                              ),
                              SizedBox(
                                height: myheight * 0.03,
                              ),
                              Container(
                                child: Example_With_Sentence(
                                  vocabularyData![index].mainSentence,
                                  vocabularyData![index].meaningSentence,
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget walking_the_path() {
    double myheight = MediaQuery.of(context).size.height;
    double mywidth = MediaQuery.of(context).size.width;
    return Container(
      width: mywidth,
      height: myheight * 0.08,
      decoration: BoxDecoration(),
      child: const Row(children: []),
    );
  }

  Widget image_word(String images) {
    double myheight = MediaQuery.of(context).size.height;
    double mywidth = MediaQuery.of(context).size.width;
    return Container(
      width: mywidth,
      height: myheight * 0.26,
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(20.0),
        image: DecorationImage(
          image: NetworkImage(images),
          fit: BoxFit.cover,
        ),
      ),

      // child: Center(
      //   child: Image.network(images,fit: BoxFit.cover,),
      // ),
    );
  }

  Widget word_spik(String Word) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Spike(
        textEN: Word,
        child: Container(
          child: Center(
            child: MyText(
              text: Word,
              fontFamily: "my_FA",
              size: 33.0,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ),
    );
  }

  Widget description(
    String description,
    String word_main,
  ) {
    double myheight = MediaQuery.of(context).size.height;
    double mywidth = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MyText(
                text: description,
                fontFamily: "my_FA",
                size: 17.0,
                fontWeight: FontWeight.w300,
              ),
            ],
          ),
          // SizedBox(
          //   height: myheight * 0.02,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MyText(
                  text: word_main,
                  fontFamily: "my_FA",
                  size: 18.0,
                  fontWeight: FontWeight.w300),
              // Text(
              //   word_main,
              //   style: const TextStyle(fontSize: 18.0),
              // )
            ],
          ),
        ],
      ),
    );
  }

  Widget Example_With_Sentence(
    String Example_With_Sentence,
    String Example_With_Sentence_main,
  ) {
    double myheight = MediaQuery.of(context).size.height;
    double mywidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 13.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.grey.withOpacity(0.15)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Spike(
                textEN: Example_With_Sentence,
                child: Image.asset(
                  "assets/volume (1).png",
                  height: myheight * 0.03,
                ),
              ),
              SizedBox(
                width: mywidth * 0.02,
              ),
              Expanded(
                child: MyText(
                  text: Example_With_Sentence,
                  fontFamily: "my_FA",
                  size: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
          // SizedBox(
          //   height: myheight * 0.02,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: MyText(
                    text: Example_With_Sentence_main,
                    fontFamily: "my_FA",
                    size: 18.0,
                    fontWeight: FontWeight.w300,
                    textAlign: TextAlign.end),
                //  Text(
                //   Example_With_Sentence_main,
                //   textAlign: TextAlign.end,
                //   style: TextStyle(fontSize: 18.0),
                // ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
