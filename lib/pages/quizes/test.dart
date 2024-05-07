import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/my_txt.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Map<String, dynamic>> questions = [
    {
      'question': 'What is the capital of France?',
      'options': ['Paris', 'London', 'Berlin', 'Rome'],
      'answerIndex': 0,
    },
    {
      'question': 'What is the largest mammal?',
      'options': ['Elephant', 'Blue Whale', 'Giraffe', 'Hippopotamus'],
      'answerIndex': 1,
    },
    // Add more questions as needed
  ];

  int currentQuestionIndex = 0;
  int selectedAnswerIndex = -1;
  bool answered = false;
  Color trueAnswerColor = Colors.green;
  Color falseAnswerColor = Colors.red;
  Color myColor = Colors.blue;

  void checkAnswer(int selectedIndex) {
    if (!answered) {
      setState(() {
        selectedAnswerIndex = selectedIndex;
        answered = true;
      });
      print(selectedAnswerIndex.toString());
    }
  }

  Color getButtonColor(int optionIndex) {
    if (selectedAnswerIndex == optionIndex) {
      if (optionIndex == questions[currentQuestionIndex]['answerIndex']) {
        return trueAnswerColor; // Default button color
      } else if (answered && optionIndex == selectedAnswerIndex) {
        return falseAnswerColor; // Incorrect answer selected
      } else {
        return myColor; // Default button color
      }
    } else {
      return myColor; // Default button color
    }
  }

  void goToNextQuestion() {
    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
        selectedAnswerIndex = -1;
        answered = false;
      } else {
        // Handle end of quiz
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyText(
          text: "سلام اسب سیب مامر",
          fontFamily: "my_FA",
          fontWeight: FontWeight.normal,
          size: 15.0,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(25.0),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10.0)),
              child: Center(
                child: Text(
                  questions[currentQuestionIndex]['question'],
                ),
              ),
            ),
            SizedBox(height: 20.0),
            my_anser_form(),
            SizedBox(height: 20.0),
            my_btn("Next Question ", answered ? goToNextQuestion : null,
                Colors.transparent.withOpacity(0.2))
          ],
        ),
      ),
    );
  }

  Widget my_btn(String text, void Function()? onTap, Color Clors) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(25.0),
        decoration: BoxDecoration(
          color: Clors,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Text(text),
        ),
      ),
    );
  }

  Widget my_anser_form() {
    return Column(
      children: [
        ...List.generate(
          questions[currentQuestionIndex]['options'].length,
          (index) {
            return my_btn(questions[currentQuestionIndex]['options'][index],
                () {
              checkAnswer(index);
            }, getButtonColor(index));
            // ElevatedButton(

            //   onPressed: () {
            //     checkAnswer(index);
            //   },
            //   style: ButtonStyle(

            //     backgroundColor:
            //     MaterialStateProperty.resolveWith<Color>((states) {
            //   return getButtonColor(index);
            // }),
            //   ),
            //   child:
            //       Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: Text(questions[currentQuestionIndex]['options'][index]),
            //       ),
            // );
          },
        ),
      ],
    );
  }
}
