import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/api_grammer.dart';
import 'package:flutter_application_2/widgets/loder.dart';
import 'package:flutter_application_2/widgets/my_txt.dart';
import 'package:flutter_application_2/widgets/spik.dart';
import 'package:http/http.dart' as http;

class GrammerPage extends StatefulWidget {
  const GrammerPage({super.key});

  @override
  State<GrammerPage> createState() => _GrammerPageState();
}

class _GrammerPageState extends State<GrammerPage> {
  @override
  Widget build(BuildContext context) {
    double myheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: isloding
          ? LoderWidgets()
          // CircularProgressIndicator(),

          : Padding(
            padding:  EdgeInsets.symmetric(horizontal: 10.0, vertical: 13.0),
            child: SafeArea(
                child: Column(
                children: [
                  SizedBox(height: myheight*0.06,),
                  Center(child: MyText(
                  text: grammerData![0].titel,
                  fontFamily: "my_FA",
                  size: 20.0,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.right,
                ),),
                  SizedBox(height: myheight*0.35,),
                  // Spacer(),
                  Example_With_Sentence(
                    grammerData![0].mainExampleOne,
                    grammerData![0].meaningExampleOne,
                  ),
                  Example_With_Sentence(
                    grammerData![0].mainExampleTwo,
                    grammerData![0].meaningExampleTwo,
                  ),
                  Example_With_Sentence(
                    grammerData![0].mainExampleThree,
                    grammerData![0].meaningExampleThree,
                  ),
                ],
              )),
          ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_api_Vocabulary();
  }

  List? grammerData = [];
  bool isloding = true;
  var api_list;
  Future<List<GeAllGrammer>?> get_api_Vocabulary() async {
    const infourl = 'http://ssiikkaabani.ir/grammar/grammer_get';
    var my_data = await http
        .get(Uri.parse(infourl), headers: {"Content-type": "application/json"});
    if (my_data.statusCode == 200) {
      var x = my_data.body;
      grammerData = geAllGrammerFromJson(x);
      setState(() {
        isloding = false;
      });
    }
  }

  Widget Example_With_Sentence(
    String Example_With_Sentence,
    String Example_With_Sentence_main,
  ) {
    double myheight = MediaQuery.of(context).size.height;
    double mywidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Container(
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
      ),
    );
  }
}
