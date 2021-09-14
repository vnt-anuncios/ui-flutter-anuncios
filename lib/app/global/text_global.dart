import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// text para el credito u otros explicar aqui
class TextFormat extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final TextAlign textAlign;
  final FontWeight fontWeight;

  const TextFormat(
      {Key? key,
      required this.text,
      required this.size,
      this.textAlign = TextAlign.center,
      this.color = Colors.black,
      this.fontWeight = FontWeight.w600})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: fontWeight,
        letterSpacing: -0.5,
      ),
      textAlign: textAlign,
    );
  }
}
