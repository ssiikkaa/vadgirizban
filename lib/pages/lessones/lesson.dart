import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/api_lesson.dart';
import 'package:flutter_application_2/pages/learnig/learning.dart';
import 'package:flutter_application_2/widgets/loder.dart';
import 'package:http/http.dart' as http;

class LessonPage extends StatefulWidget {
  const LessonPage({super.key});

  @override
  State<LessonPage> createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {
  @override
  void initState() {
    super.initState();
    get_api_lesson();
  }

  List? lessonData = [];
  bool isloding=true;
  var api_list;
  Future<List<GeAllLesson>?> get_api_lesson() async {
    const infourl = 'http://ssiikkaabani.ir/lesson/lesson_get';
    var my_data = await http
        .get(Uri.parse(infourl), headers: {"Content-type": "application/json"});
    if (my_data.statusCode == 200) {
      var x = my_data.body;
      lessonData = geAllLessonFromJson(x);
      setState(() {isloding=false;});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Lesson",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27.0),
        ),
      ),
      body:isloding
          ? Center(
              child: LoderWidgets(),
            )
          : SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
        child: ListView.builder(
          itemCount: lessonData!.length,
          itemBuilder: (context, index) {
            return lesson_form(
              lessonData![index].lessonNum.toString(),
              lessonData![index].titel,
            );
          },
        ),
      )),
    );
  }

  Widget lesson_form(String lesson_num, String titel) {
    double myheight = MediaQuery.of(context).size.height;
    double mywidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(bottom: 0.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LearningPage(),
              ));
        },
        child: Container(
          width: mywidth,
          height: myheight * 0.14,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: myheight * 0.09,
                width: mywidth * 0.18,
                decoration: BoxDecoration(
                  color: Colors.amber.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Center(
                  child: Text(
                    lesson_num,
                    style: const TextStyle(
                        fontSize: 22.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                width: mywidth * 0.03,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Lesson $lesson_num",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                  ),
                  Text(
                    titel,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Spacer(),
              Center(
                child: Icon(Icons.download),
              )
            ],
          ),
        ),
      ),
    );
  }
}
