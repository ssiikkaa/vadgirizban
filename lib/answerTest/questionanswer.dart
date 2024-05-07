import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/model/quezclass.dart';
import 'package:flutter_application_2/pages/speaking/speaking.dart';
import 'package:flutter_application_2/widgets/spik.dart';

class QuestoinAnswer extends StatefulWidget {
  const QuestoinAnswer({super.key});

  @override
  State<QuestoinAnswer> createState() => _QuestoinAnswerState();
}

class _QuestoinAnswerState extends State<QuestoinAnswer> {
  List<dynamic> jasonData = [];
  List<bool> boolList = [];

  @override
  void initState() {
    super.initState();
    loadJasonData();
    quizQuestions();
  }

  Future<void> loadJasonData() async {
    var jasonString = await rootBundle.loadString("assets/word/qotions.json");
    setState(() {
      jasonData = json.decode(jasonString);
      // boolList = List.generate(
      //   jasonData.length,
      //   (index) => false,
      // );
    });
    print(jasonData);
  }

  bool is_check = false;
  bool is_true = false;

  @override
  Widget build(BuildContext context) {
    List<List<bool>> isOptionSelected = List.generate(quizz.length,
        (index) => List.filled(quizz[index].options.length, false));

    return Scaffold(
      appBar: AppBar(
        title: Text('Questions List'),
      ),
      body: PageView.builder(
        scrollDirection: Axis.horizontal,
        controller: PageController(initialPage: 1),
        itemCount: quizz.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Questoin_text(quizz[index].question),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:
                    quizz[index].options.asMap().entries.map<Widget>((entry) {
                  int optionIndex = entry.key;
                  String option = entry.value;
                  return Answer_text(option, () {
                   
                    if (option == quizz[index].answer) {
                      setState(() {
                        is_check = true;
                        is_true = true;

                        // isOptionSelected[index] = ;
                        // isOptionSelected[index] = List.generate(
                        //     quizz[index].options.length,
                        //     (optionIndex) =>
                        //         optionIndex ==
                        //         quizz[index].options.indexOf(option));
                      });
                      print(isOptionSelected);
                    } else if(option != quizz[index].answer) {
                       is_check = true;
                      is_true = false;
                      print("cccccc");
                    }
                  },Colors.pink.withOpacity(0.02)
                  );
                }).toList(),
              ),
              
          is_check?    Center(
                child:is_true? Icon(Icons.abc):Icon(Icons.kayaking),
              ):SizedBox(),
              Spacer(),
              Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(25.0),
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.09),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
        child: Text("text"),
      ),
    ),
            ],
          );
          // return ListTile(
          //   title: Text(quizz[index].question),
          //   subtitle: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: quizz[index].options.map<Widget>((option) {
          //       return Answer_text(option);
          //     }).toList(),
          //   ),
          // );
        },
      ),
    );
  }

  Widget Questoin_text(String text) {
    double myheight = MediaQuery.of(context).size.height;
    double mywidth = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(25.0),
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.09),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
        child: Text(text),
      ),
    );
  }

  Widget Answer_text(String text, VoidCallback click, Color colors) {
    return GestureDetector(
      onTap: click,
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(25.0),
        decoration: BoxDecoration(
          color: colors,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Text(text),
        ),
      ),
    );
  }

  List quizz = [];
  Future<List<Question>> quizQuestions() async {
    String data = await DefaultAssetBundle.of(context)
        .loadString("assets/word/qotions.json");
    List mapData = jsonDecode(data);

    List<Question> quiz =
        mapData.map((quiz) => Question.fromJson(quiz)).toList();
    quizz = quiz;
    print(data);
    return quiz;
  }
}
