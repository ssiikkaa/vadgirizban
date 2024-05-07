// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MyClikeAnimation extends StatefulWidget {
  bool? is_select;
  String? titele;
  int? duration;
  Curve? canvas;
  MyClikeAnimation({
    super.key,
    this.is_select,
    this.titele,
    this.canvas=Curves.easeInOutBack,
    this.duration=600,
  });

  @override
  State<MyClikeAnimation> createState() => _MyClikeAnimationState();
}

class _MyClikeAnimationState extends State<MyClikeAnimation> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration:  Duration(milliseconds: widget.duration!),
      transitionBuilder: (child, animation) => ScaleTransition(
        scale: animation,
        child: child,
        
      ),
      switchInCurve: widget.canvas!,
      child: widget.is_select!
          ? Text(
              widget.titele!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 15.0,
              ),key: const ValueKey("bold"),
            )
          : Text(
              widget.titele!,
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.grey,
                fontSize: 14.0,
              ),
              key: const ValueKey("normal"),
            ),
    );
  }
}
