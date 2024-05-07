// ignore_for_file: unused_local_variable, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/my_clike_animaiton.dart';
import 'package:flutter_application_2/components/my_translaiton.dart';
import 'package:flutter_application_2/pages/auth/singup_page.dart';
import 'package:flutter_application_2/pages/auth/verification.dart';
import 'package:flutter_application_2/pages/home/home_page.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:ionicons/ionicons.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

bool is_show_pass = true;

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    double myheight = MediaQuery.of(context).size.height;
    double mywidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Wellcome Back",
                  style: TextStyle(fontSize: 34.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: myheight * 0.012,
                ),
                const Text(
                  "we are very very hapyy to use accant",
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey),
                ),
              ],
            ),
            Login_type(),
            MyTranslation(
                axis: Axis.horizontal,
                decoration: 1600,
                ofset: 600,
                curves: Curves.linearToEaseOut,
                clicke: () {},
                child: login_form()),
            MyTranslation(
                axis: Axis.horizontal,
                decoration: 1600,
                ofset: 600,
                curves: Curves.bounceInOut,
                clicke: () {},
                child: my_butten(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Verifications(),
                    ),
                  );
                }, "Login")),
            SizedBox(
              height: myheight * 0.02,
            ),
            MyTranslation(
              axis: Axis.vertical,
              curves: Curves.bounceInOut,
              ofset: 600,
              decoration: 1600,
              clicke: () {},
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 1,
                    child: Divider(),
                  ),
                  Flexible(
                    flex: 2,
                    child: Text(
                      "sing in whit google or favebook",
                      style: TextStyle(fontSize: 11.0),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Divider(),
                  ),
                ],
              ),
            ),
            MyTranslation(
                axis: Axis.vertical,
                curves: Curves.bounceInOut,
                ofset: 600,
                decoration: 1600,
                clicke: () {},
                child: more_sing()),
            MyTranslation(
              axis: Axis.vertical,
              curves: Curves.bounceInOut,
              ofset: 600,
              decoration: 1600,
              clicke: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Dont have accunet"),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SingUpPage(),
                            ));
                      },
                      child: const Text(
                        "sing up",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }

  bool is_email = true;
  bool is_phone = false;
  TextEditingController email_controller = TextEditingController();
  TextEditingController phone_nuber = TextEditingController();
  TextEditingController password = TextEditingController();
  Widget Login_type() {
    double myheight = MediaQuery.of(context).size.height;
    double mywidth = MediaQuery.of(context).size.width;
    return Container(
      height: myheight * 0.08,
      width: mywidth,
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                is_email = true;
                is_phone = false;
              });
            },
            child: Container(
              height: myheight * 0.06,
              width: mywidth * 0.4,
              decoration: BoxDecoration(
                  color: is_email ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(10.0)),
              child: Center(
                  child: MyClikeAnimation(
                is_select: is_email,
                titele: "Email",
              )),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                is_email = false;
                is_phone = true;
              });
            },
            child: Container(
              height: myheight * 0.06,
              width: mywidth * 0.4,
              decoration: BoxDecoration(
                color: is_phone ? Colors.white : Colors.transparent,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: MyClikeAnimation(
                  is_select: is_phone,
                  titele: "phone",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget login_form() {
    return Column(
      children: [
        is_email
            ? my_text_fild(
                "Email",
                Ionicons.mail_outline,
                Ionicons.mail_outline,
                IconlyBold.tickSquare,
                email_controller,
                TextInputType.emailAddress,
                false,
                false,
                () {},
              )
            : my_text_fild(
                "phone",
                Ionicons.phone_portrait_outline,
                Ionicons.eye_off_sharp,
                IconlyBold.tickSquare,
                phone_nuber,
                TextInputType.phone,
                false,
                false,
                () {},
              ),
        my_text_fild(
          "password",
          Ionicons.lock_closed_outline,
          is_show_pass ? Ionicons.eye_off_outline : Ionicons.eye_outline,
          IconlyBold.tickSquare,
          password,
          TextInputType.multiline,
          is_show_pass,
          true,
          () {
            setState(() {
              is_show_pass = !is_show_pass;
            });
          },
        ),
        Row(
          // crossAxisAlignment:  CrossAxisAlignment.end,

          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
                onTap: () {},
                child: const Text(
                  "Forget Password ?",
                ))
          ],
        )
      ],
    );
  }

  Widget my_text_fild(
    String? hint,
    IconData iconData,
    IconData suffixIcon,
    IconData cheeck,
    TextEditingController controller,
    TextInputType kebord,
    bool obstract,
    bool ispassword,
    VoidCallback isshowpass,
  ) {
    double myheight = MediaQuery.of(context).size.height;
    double mywidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        height: myheight * 0.08,
        width: mywidth,
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10.0)),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: controller,
                keyboardType: kebord,
                obscureText: obstract,
                decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    hintText: hint,
                    labelText: hint,
                    hintStyle: const TextStyle(
                      fontSize: 12.0,
                    ),
                    prefixIcon: Icon(iconData),
                    suffixIcon: ispassword == true
                        ? GestureDetector(
                            onTap: isshowpass,
                            child: Icon(
                              suffixIcon,
                            ),
                          )
                        : const SizedBox()),
              ),
            ),
            Icon(
              cheeck,
              color: Colors.green.withOpacity(0.77),
            ),
            SizedBox(
              width: mywidth * 0.03,
            )
          ],
        ),
      ),
    );
  }

  Widget my_butten(
    VoidCallback clicke,
    String textbtn,
  ) {
    double myheight = MediaQuery.of(context).size.height;
    double mywidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: clicke,
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

  Widget more_sing() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        more_sing_optione("assets/google.png", "google"),
        more_sing_optione("assets/facebooke.png", "facebooke"),
      ],
    );
  }

  Widget more_sing_optione(
    String image,
    String titeke,
  ) {
    double myheight = MediaQuery.of(context).size.height;
    double mywidth = MediaQuery.of(context).size.width;
    return Container(
      height: myheight * 0.08,
      width: mywidth * 0.43,
      decoration: BoxDecoration(
        border: Border.all(width: 1.0, color: Colors.grey.withOpacity(0.7)),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              height: 30,
            ),
            SizedBox(
              width: mywidth * 0.03,
            ),
            Text(titeke)
          ]),
    );
  }
}
