import 'package:flutter/material.dart';

import 'package:flutter_application_2/pages/home/home_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      // theme: ThemeData.light(),
  home: HomePage(),
    );
  }
}

