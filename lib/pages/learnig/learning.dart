import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/slideAnimation.dart';
import 'package:flutter_application_2/pages/conversation/canversation.dart';
import 'package:flutter_application_2/pages/home/listening/listening.dart';
import 'package:flutter_application_2/pages/speaking/speaking.dart';
import 'package:flutter_application_2/pages/wordes/vocabulary.dart';
import 'package:flutter_application_2/widgets/my_txt.dart';

class LearningPage extends StatefulWidget {
  const LearningPage({super.key});

  @override
  State<LearningPage> createState() => _LearningPageState();
}

class _LearningPageState extends State<LearningPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27.0),
        ),
      ),
      body: SafeArea(
          child:SlideAnimatedWidget(
          begin: Offset(-1.0, 0.0),
          end: Offset.zero,
          duration: Duration(seconds: 1),
          curve: Curves.easeInOut,
          child: Container(
            // width: double.infinity,
            // height: 200,
            // color: Colors.blue,
            child:
             ListView(
                    children: [
            my_Contaner(
              "Vocabulary",
              "واژگان",
              "assets/wordss.jpg",
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Vocabulary(),
                  ),
                );
              },
            ),
            my_Contaner(
              "Conversation",
              "مکالمه",
              "assets/images.jpg",
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Conversation(),
                  ),
                );
              },
            ),
            my_Contaner(
              "Grammar",
              "گرامر",
              "assets/gramers.jpg",
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Vocabulary(),
                  ),
                );
              },
            ),
            my_Contaner(
              "Speaking",
              "گفتاری",
              "assets/speakking.jpg",
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Speaking(),
                  ),
                );
              },
            ),
            my_Contaner(
              "Listening",
              "شنیداری",
              "assets/lesation.jpg",
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  ListeningPage(),
                  ),
                );
              },
            ),
            my_Contaner(
              "Exam ",
              "امتحان",
              "assets/tst.jpg",
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Vocabulary(),
                  ),
                );
              },
            ),
                    ],
                  ),
          )),)
    );
  }

  Widget my_Contaner(
      String txtEN, String txtFA, String image, VoidCallback click) {
    double myheight = MediaQuery.of(context).size.height;
    double mywidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: GestureDetector(
        onTap: click,
        child: Container(
            height: myheight * 0.15,
            width: mywidth,
            decoration: BoxDecoration(
              //   image: DecorationImage(
              //   image: AssetImage(image),
              //   fit: BoxFit.cover,
              // ),
              borderRadius: BorderRadius.circular(10.0), color: Colors.amber,
            ),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  color: Colors.black
                      .withOpacity(0.5), // افزودن سایه سفید با شفافیت 50%
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment:
                        MainAxisAlignment.center, // تراز متن‌ها در وسط عمودی
                    children: [
                      MyText(
                        text: txtEN,
                        fontFamily: "my_FA",
                        size: 24.0,
                        colors: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(
                        height: myheight * 0.01,
                      ),
                      MyText(
                        text: txtFA,
                        fontFamily: "my_FA",
                        size: 13.0,
                        colors: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      // Text(Font
                      //   'متن اول',
                      //   style: TextStyle(
                      //     color: Colors.black,
                      //     fontSize: 24,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
                      // Text(
                      //   'متن دوم',
                      //   style: TextStyle(
                      //     color: Colors.black,
                      //     fontSize: 18,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
