// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MyAnimation extends StatefulWidget {
  Widget? child;
  int? duration;
  Curve? curye;
  MyAnimation({
    super.key,
    this.child,
    this.duration=600,
    this.curye=Curves.fastOutSlowIn,
  });

  @override
  State<MyAnimation> createState() => _MyAnimationState();
}

class _MyAnimationState extends State<MyAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController? contorol;
  Animation? animation;
  @override
  void initState() {
    super.initState();
    contorol = AnimationController(
        vsync: this, duration: Duration(milliseconds: widget.duration!));
    animation = Tween(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: contorol!, curve: Curves.linear));
    contorol!.forward();
  }

  @override
  void dispose() {
    super.dispose();
    contorol!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation!,
      builder: (context, child) {
        return Opacity(
          opacity: animation!.value,
          child: widget.child,
        );
      },
    );
  }
}
