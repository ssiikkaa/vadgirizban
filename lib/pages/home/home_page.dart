import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/conversation/canversation.dart';
import 'package:flutter_application_2/pages/lessones/lesson.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:ionicons/ionicons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double myheight = MediaQuery.of(context).size.height;
    double mywidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27.0),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
          child: ListView(
            children: [
              SizedBox(
                height: myheight * 0.02,
              ),
              level_lern_form(),
              // GestureDetector(
              //     onTap: () {
              //       Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //             builder: (context) => const Vocabulary(),
              //           ));
              //     },
              //     child: Text("1ssssssssssss")),
              // GestureDetector(
              //     onTap: () {
              //       Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //             builder: (context) => const Conversation(),
              //           ));
              //     },
              //     child: Text("1sssssssss")),
              // GestureDetector(
              //     onTap: () {
              //       Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //             builder: (context) => const Speaking(),
              //           ));
              //     },
              //     child: Text("1sssssss")),
              // GestureDetector(
              //     onTap: () {
              //       Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //             builder: (context) => const Vocabulary(),
              //           ));
              //     },
              //     child: Text("ssssssss")),

              // Spike(textEN: "",textFA: "سیب"),
            ],
          ),
        ),
      ),
    );
  }

  Widget level_lern_form() {
    return Column(
      children: [
        my_container("1", "1", () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LessonPage(),
              ));
        }),
        my_container("2", "2", () {}),
        my_container("3", "3", () {}),
        my_container("4", "4", () {}),
      ],
    );
  }

  Widget my_container(String levelEn, String levelFA, VoidCallback click) {
    double myheight = MediaQuery.of(context).size.height;
    double mywidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: GestureDetector(
        onTap: click,
        child: Container(
          width: mywidth,
          height: myheight * 0.3,
          decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/levelone.jpg"),
          fit: BoxFit.cover,
        ),
            color: Colors.deepPurple,
            borderRadius: BorderRadiusDirectional.circular(20.0),
          ),
          // child: Padding(
          //   padding: const EdgeInsets.all(20.0),
          //   child: Column(
          //     children: [
          //       Row(
          //         children: [
          //           const Text(
          //             "Level",
          //             style: TextStyle(
          //                 fontWeight: FontWeight.bold,
          //                 color: Colors.white,
          //                 fontSize: 25.0),
          //           ),
          //           const Spacer(),
          //           Text(
          //             levelEn,
          //             style: const TextStyle(
          //                 fontWeight: FontWeight.bold,
          //                 color: Colors.white,
          //                 fontSize: 25.0),
          //           ),
          //         ],
          //       ),
          //       Spacer(),
          //       Row(
          //         children: [
          //           Text(
          //             levelFA,
          //             style: const TextStyle(
          //                 fontWeight: FontWeight.bold,
          //                 color: Colors.white,
          //                 fontSize: 25.0),
          //           ),
          //           const Spacer(),
          //           const Text(
          //             "سطح",
          //             style: TextStyle(
          //                 fontWeight: FontWeight.bold,
          //                 color: Colors.white,
          //                 fontSize: 25.0),
          //           ),
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
        ),
      ),
    );
  }

  Widget app_bar() {
    double myheight = MediaQuery.of(context).size.height;
    double mywidth = MediaQuery.of(context).size.width;
    return Container(
      height: myheight * 0.070,
      width: mywidth,
      decoration: BoxDecoration(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          children: [
            Text("data"),
            Spacer(),
            Icon(IconlyBold.profile),
            SizedBox(
              width: mywidth * 0.03,
            ),
            Icon(Ionicons.menu_outline),
          ],
        ),
      ),
    );
  }
}
