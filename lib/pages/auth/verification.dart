import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/components/my_translaiton.dart';
import 'package:flutter_application_2/components/shake.dart';
import 'package:flutter_application_2/pages/home/home_page.dart';

class Verifications extends StatefulWidget {
  const Verifications({super.key});

  @override
  State<Verifications> createState() => _VerificationsState();
}

class _VerificationsState extends State<Verifications> {
  @override
  Widget build(BuildContext context) {
    bool is_btn = false;
    String opt_text = p1.text + p2.text + p3.text + p4.text + p5.text;
    if (p1.text == "" &&
        p2.text == "" &&
        p3.text == "" &&
        p4.text == "" &&
        p5.text == "") {
      is_btn == false;
    } else {
      is_btn = true;
    }
    print(is_btn);
    print(opt_text);
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("A five-digit Code was sent to this"),
            Text(opt_text),
            form_verifay(),
            // Spacer(),
            is_btn
                ? MyTranslation(
                    axis: Axis.horizontal,
                    decoration: 1250,
                    ofset: 1250,
                    curves: Curves.easeIn,
                    clicke: () {},
                    child: my_butten("Next"))
                : const SizedBox(),
          ],
        ),
      )),
    );
  }

  Widget form_verifay() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          my_text_fild(
            (value) {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              }
            },
            p1,
          ),
          my_text_fild((value) {
            if (value.length ==1) {
              FocusScope.of(context).nextFocus();
            }
            if (value.isEmpty) {
              FocusScope.of(context).previousFocus();
              p1.text="";
            }
          }, p2),
          my_text_fild((value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
            if (value.isEmpty) {
              FocusScope.of(context).previousFocus();
              p2.text="";
            }
          }, p3),
          my_text_fild((value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
            if (value.isEmpty) {
              FocusScope.of(context).previousFocus();
              p3.text="";
            }
          }, p4),
          my_text_fild((value) {
            if (value.isEmpty) {
              FocusScope.of(context).previousFocus();
              p4.text="";
            }
          }, p5),
        ],
      ),
    );
  }

  TextEditingController p1 = TextEditingController();
  TextEditingController p2 = TextEditingController();
  TextEditingController p3 = TextEditingController();
  TextEditingController p4 = TextEditingController();
  TextEditingController p5 = TextEditingController();
  bool? error_five_codee;

  Widget my_text_fild(
    void Function(String)? onChanged,
    TextEditingController controller,
  ) {
    double myheight = MediaQuery.of(context).size.height;
    double mywidth = MediaQuery.of(context).size.width;
    return Container(
      height: myheight * 0.08,
      width: mywidth * 0.16,
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10.0)),
      child: Center(
        child: TextFormField(
          onChanged: onChanged,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly,
          ],
          textAlign: TextAlign.center,
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget my_butten(String textbtn) {
    double myheight = MediaQuery.of(context).size.height;
    double mywidth = MediaQuery.of(context).size.width;
    String opt_text = p1.text + p2.text + p3.text + p4.text + p5.text;
    int textpass = 11111;
    // bool error_five_code = error_five_codee;

    return GestureDetector(
      onTap: () {
        setState(() {
          if (opt_text == textpass.toString()) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ));
          } else {
            error_five_codee == true;
          }
        });
      },
      child: Container(
        height: myheight * 0.07,
        width: mywidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.blue.withOpacity(0.5),
        ),
        child: Center(
          child: Text(
            textbtn,
            style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
      ),
    );
  }
}
