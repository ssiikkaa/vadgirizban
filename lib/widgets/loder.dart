import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoderWidgets extends StatefulWidget {
  const LoderWidgets({super.key});

  @override
  State<LoderWidgets> createState() => _LoderWidgetsState();
}

class _LoderWidgetsState extends State<LoderWidgets> {
  @override
  Widget build(BuildContext context) {
    double myhit=MediaQuery.of(context).size.height;
    return Center(
      child: Lottie.asset('assets/loder.json',height:myhit*0.12 ),
    );
  }
}
