// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MyTranslation extends StatefulWidget {
  final Widget? child;
  final int? decoration;
  final double? ofset;
  final Curve? curves;
  final Axis? axis;
  final double? begin;
  final double? end;
  VoidCallback? clicke;
  MyTranslation({
    super.key,
    this.child,
    this.decoration = 800,
    this.ofset = 140.0,
    this.curves = Curves.elasticOut,
    this.axis = Axis.horizontal,
    this.clicke,
    this.begin=1.0,
    this.end=0.0,
  });

  @override
  State<MyTranslation> createState() => _MyTranslationState();
}

class _MyTranslationState extends State<MyTranslation> {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: widget.begin, end: widget.end),
      duration: Duration(milliseconds: widget.decoration!),
      curve: widget.curves!,
      builder: (context, value, child) {
        return Transform.translate(
          // ignore: unrelated_type_equality_checks
          offset: widget.ofset == Axis.horizontal
              ? Offset(value * widget.ofset!, 0.0)
              : Offset(0.0, value * widget.ofset!),
          child: widget.child,
        );
      },
    );
  }
}
