// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:ionicons/ionicons.dart';

// class ListeningPage extends StatefulWidget {
//   const ListeningPage({super.key});

//   @override
//   State<ListeningPage> createState() => _ListeningPageState();
// }

// class _ListeningPageState extends State<ListeningPage> {
//    List<String> sentence = ["a", "p", "p", "l", "e"];
//   List<String> shuffledWords = [];
//   List<String> userWords = [];

//   @override
//   void initState() {
//     super.initState();
//     shuffledWords = sentence.toList()..shuffle();
//   }

//   void checkAnswer() {
//     if (listEquals(sentence, userWords)) {
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text('Correct!'),
//             content: Text('The sentence is complete.'),
//             actions: <Widget>[
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: Text('OK'),
//               ),
//             ],
//           );
//         },
//       );
//     } else {
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text('Incorrect!'),
//             content: Text('Try again.'),
//             actions: <Widget>[
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: Text('OK'),
//               ),
//             ],
//           );
//         },
//       );
//     }
//   }

//   void resetGame() {
//     setState(() {
//       shuffledWords = sentence.toList()..shuffle();
//       userWords.clear();
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//         double myheight = MediaQuery.of(context).size.height;
//     double mywidth = MediaQuery.of(context).size.width;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Listening",
//           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27.0),
//         ),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               'Arrange the words to form a sentence:',
//               style: TextStyle(fontSize: 18.0),
//             ),
//             SizedBox(
//               height: myheight * 0.1,
//             ),

//             Chip(
//               label: Text(
//                 userWords.join(""),
//                 style:const TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
//               ),
//             ),
//             SizedBox(
//               height: myheight * 0.1,
//             ),
//             Wrap(
//               spacing: 8.0,
//               runSpacing: 8.0,
//               children: shuffledWords
//                   .map((word) => my_btn(word, () {
//                             setState(() {
//                               userWords.add(word);
//                               shuffledWords.remove(word);
//                               if (userWords.length == sentence.length) {
//                                 checkAnswer();
//                               }
//                             });
//                           })
//                       //  GestureDetector(
//                       //   onTap: () {
//                       //     setState(() {
//                       //       userWords.add(word);
//                       //       shuffledWords.remove(word);
//                       //       if (userWords.length == sentence.length) {
//                       //         checkAnswer();
//                       //       }
//                       //     });
//                       //   },
//                       //   child: Chip(
//                       //     label: Text(word),
//                       //   ),
//                       // ),
//                       )
//                   .toList(),
//             ),
//             // my_btn("Try Again", resetGame)
//             SizedBox(
//               height: myheight * 0.1,
//             ),
//             Try_Again(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget Try_Again() {
//     return GestureDetector(
//       onTap: resetGame,
//       child: const Center(
//         child: Icon(
//           Ionicons.repeat_sharp,
//           size: 40.0,
//         ),
//       ),
//     );
//   }

//   Widget my_btn(String text, void Function()? onTap) {
//     double myheight = MediaQuery.of(context).size.height;
//     double mywidth = MediaQuery.of(context).size.width;
//     return GestureDetector(
//       onTap: onTap,
//       child: Chip(
//         label: Text(text),
//       ),
//       // child: Container(
//       //   margin: const EdgeInsets.all(10),
//       //   padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
//       //   decoration: BoxDecoration(
//       //     color: Colors.green.withOpacity(0.09),
//       //     borderRadius: BorderRadius.circular(10.0),
//       //   ),
//       //   child: Chip(
//       //     label: Text(text),
//       //   ),
//       // ),
//     );
//   }
// }

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/spik.dart';
import 'package:ionicons/ionicons.dart';

class ListeningPage extends StatefulWidget {
  @override
  _ListeningPageState createState() => _ListeningPageState();
}

class _ListeningPageState extends State<ListeningPage> {
  List<List<String>> sentences = [
    ["This", "is", "a", "sample", "sentence"],
    ["Flutter", "is", "a", "great", "framework"],
    ["Programming", "is", "fun", "and", "challenging"],
    // ادامه دهید با جملات دیگر
  ];

  int index = 0;
  List<String> sentence = [];
  List<String> shuffledWords = [];
  List<String> userWords = [];

  @override
  void initState() {
    super.initState();
    sentence = sentences[index];
    shuffledWords = sentence.toList()..shuffle();
  }

  void checkAnswer() {
    if (listEquals(sentence, userWords)) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Correct!'),
            content: Text('The sentence is complete.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  nextSentence();
                },
                child: Text('Next'),
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Incorrect!'),
            content: Text('Try again.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  resetGame();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
    void resetGame() {
    setState(() {
      shuffledWords = sentence.toList()..shuffle();
      userWords.clear();
    });
  }

  void nextSentence() {
    if (index < sentences.length - 1) {
      setState(() {
        index++;
        sentence = sentences[index];
        shuffledWords = sentence.toList()..shuffle();
        userWords.clear();
      });
    } else {
      print('You have completed all sentences.');
    }
  }

  @override
  Widget build(BuildContext context) {
       double myheight = MediaQuery.of(context).size.height;
    double mywidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Word Puzzle App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spike(
              child: Icon(Icons.play_circle,size: 44.0,),
              textEN: sentence.join(' '),
            ),
            SizedBox(height: myheight*0.1,),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: shuffledWords
                  .map((word) => GestureDetector(
                        onTap: () {
                          setState(() {
                            userWords.add(word);
                            shuffledWords.remove(word);
                          });
                        },
                        child: Chip(
                          label: Text(word),
                        ),
                      ))
                  .toList(),
            ),
            SizedBox(height: myheight*0.1,),
            ElevatedButton(
              onPressed: checkAnswer,
              child: Text('Check'),
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Check Answer'),
                      content: Text(
                          'Are you sure the sentence is correctly arranged?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            checkAnswer();
                          },
                          child: Text('Check'),
                        ),
                        SizedBox(height: myheight*0.1,),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Cancel'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Next'),
            ),
            Try_Again(),
          ],
        ),
      ),
    );
  }
    Widget Try_Again() {
    return GestureDetector(
      onTap: resetGame,
      child: const Center(
        child: Icon(
          Ionicons.repeat_sharp,
          size: 40.0,
        ),
      ),
    );
  }
}
