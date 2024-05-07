import 'package:flutter/material.dart';

class MyText extends StatefulWidget {
  String? text;
  String? fontFamily;
  FontWeight? fontWeight;
  double? size;
  TextAlign? textAlign;
  Color? colors;
  MyText({
    super.key,
    this.text,
    this.fontFamily,
    this.fontWeight,
    this.size,
    this.textAlign,
    this.colors,
  });

  @override
  State<MyText> createState() => _MyTextState();
}

class _MyTextState extends State<MyText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text!,
      textAlign: widget.textAlign,
      style: TextStyle(
        color: widget.colors,
        fontFamily: widget.fontFamily,
        fontWeight: widget.fontWeight,
        fontSize: widget.size,
        
      ),
    );
  }
}
