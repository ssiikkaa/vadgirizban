import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:ionicons/ionicons.dart';

class Conversation extends StatefulWidget {
  const Conversation({super.key});

  @override
  State<Conversation> createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {
  List<dynamic> jasonData = [];

  Future<void> loadJasonData() async {
    var jasonString =
        await rootBundle.loadString("assets/word/Conversation.json");
    setState(() {
      jasonData = json.decode(jasonString);
    });
    print(jasonData);
  }

  @override
  void initState() {
    super.initState();
    loadJasonData();
  }

  @override
  Widget build(BuildContext context) {
    double myheight = MediaQuery.of(context).size.height;
    double mywidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: Text("Conversation",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 27.0),),),
      body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: jasonData.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                      child: Covertions_form(
                        jasonData[index]["is_man"],
                        jasonData[index]["Conversation"],
                        jasonData[index]["Conversation_FA"],
                      ),
                    );
                  },
                ),
              ),
              play_Covertions(),

            ],
          )),
    );
  }
  Widget play_Covertions(){
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Icon(Icons.skip_previous,size:40.0),
        Icon(Icons.play_arrow_rounded,size: 88.0,),
        Icon(Icons.skip_next,size: 40.0,),
      ],),
    );
  }

  Widget Covertions_form(bool is_sex, String textEN, String textFA) {
    double mywidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        conversation_type_sex(is_sex),
        SizedBox(
          width: mywidth * 0.03,
        ),
        Expanded(child: conversation_text(is_sex, textEN, textFA)),
      ],
    );
  }

  Widget conversation_text(bool is_sex, String text, String meaing) {
    double myheight = MediaQuery.of(context).size.height;
    double mywidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 13.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: is_sex
              ? Colors.blue.withOpacity(0.35)
              : Colors.pink.withOpacity(0.35)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: mywidth * 0.02,
              ),
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(fontSize: 17.0),
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
                child: Text(
                  meaing,
                  textAlign: TextAlign.end,
                  style: TextStyle(fontSize: 18.0),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget conversation_type_sex(bool is_sex) {
    double myheight = MediaQuery.of(context).size.height;
    double mywidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: is_sex
            ? Colors.blue.withOpacity(0.2)
            : Colors.pink.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
        child: Icon(Ionicons.person),
      ),
    );
  }
}
