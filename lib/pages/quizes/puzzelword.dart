// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

// class WordPuzzleWidget extends StatefulWidget {
//   @override
//   _WordPuzzleWidgetState createState() => _WordPuzzleWidgetState();
// }

// class _WordPuzzleWidgetState extends State<WordPuzzleWidget> {
//   List<String> sentence = ["This", "is", "a", "sample", "sentence"];
//   List<String> shuffledWords = [];
//   List<String> userWords = [];
//   bool is_true = false;
//   bool is_show = false;

//   @override
//   void initState() {
//     super.initState();
//     shuffledWords = sentence.toList()..shuffle();
//   }

//   void checkAnswer() {
//     if (listEquals(sentence, userWords)) {
//       print('Correct! The sentence is complete.');
//       is_show = true;
//       is_true = true;
//     } else {
//       print('Incorrect! Try again.');
//       is_show = true;
//       is_true = false;
//     }
//   }

//   void resetGame() {
//     setState(() {
//       shuffledWords = sentence.toList()..shuffle();
//       userWords.clear();
//       is_show = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Word Puzzle App'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Arrange the words to form a sentence:',
//               style: TextStyle(fontSize: 18.0),
//             ),
//             Wrap(
//               spacing: 8.0,
//               runSpacing: 8.0,
//               children: shuffledWords
//                   .map((word) => GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             userWords.add(word);
//                             shuffledWords.remove(word);
//                             checkAnswer();
//                           });
//                         },
//                         child: Chip(
//                           label: Text(word),
//                         ),
//                       ))
//                   .toList(),
//             ),
//             ElevatedButton(
//               onPressed: resetGame,
//               child: Text('Try Again'),
//             ),
//             SizedBox(height: 20),
//             Text('Selected words: ${userWords.join(" ")}'),
//             is_show
//                 ? Center(
//                     child: Icon(
//                       Icons.close,
//                       color: is_true ? Colors.green : Colors.red,
//                     ),
//                   )
//                 : const SizedBox(),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class WordPuzzleWidget extends StatefulWidget {
  @override
  _WordPuzzleWidgetState createState() => _WordPuzzleWidgetState();
}

class _WordPuzzleWidgetState extends State<WordPuzzleWidget> {
  List<String> sentence = ["This", "is", "a", "sample", "sentence"];
  List<String> shuffledWords = [];
  List<String> userWords = [];

  @override
  void initState() {
    super.initState();
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
                },
                child: Text('OK'),
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
            const Text(
              'Arrange the words to form a sentence:',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(
              height: myheight * 0.1,
            ),

            Chip(
              label: Text(
                userWords.join(" "),
                style:const TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: myheight * 0.1,
            ),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: shuffledWords
                  .map((word) => my_btn(word, () {
                            setState(() {
                              userWords.add(word);
                              shuffledWords.remove(word);
                              if (userWords.length == sentence.length) {
                                checkAnswer();
                              }
                            });
                          })
                      //  GestureDetector(
                      //   onTap: () {
                      //     setState(() {
                      //       userWords.add(word);
                      //       shuffledWords.remove(word);
                      //       if (userWords.length == sentence.length) {
                      //         checkAnswer();
                      //       }
                      //     });
                      //   },
                      //   child: Chip(
                      //     label: Text(word),
                      //   ),
                      // ),
                      )
                  .toList(),
            ),
            // my_btn("Try Again", resetGame)
            SizedBox(
              height: myheight * 0.1,
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

  Widget my_btn(String text, void Function()? onTap) {
    double myheight = MediaQuery.of(context).size.height;
    double mywidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Chip(
        label: Text(text),
      ),
      // child: Container(
      //   margin: const EdgeInsets.all(10),
      //   padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      //   decoration: BoxDecoration(
      //     color: Colors.green.withOpacity(0.09),
      //     borderRadius: BorderRadius.circular(10.0),
      //   ),
      //   child: Chip(
      //     label: Text(text),
      //   ),
      // ),
    );
  }
}
