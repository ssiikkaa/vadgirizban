import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/my_animaiton.dart';
import 'package:flutter_application_2/pages/auth/login_page.dart';

class Spalesh extends StatefulWidget {
  const Spalesh({super.key});

  @override
  State<Spalesh> createState() => _SpaleshState();
}

class _SpaleshState extends State<Spalesh> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(
        seconds: 4,
      ),
      () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MyAnimation(
          duration: 2000,
          child: Image.asset(
            "assets/google.png",
            height: MediaQuery.of(context).size.height * 0.20,
          ),
        ),
      ),
    );
  }
}
