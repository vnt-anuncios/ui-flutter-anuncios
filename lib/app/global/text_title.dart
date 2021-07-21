import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TextTitle extends StatelessWidget {
  final String title;
  final Color color;
  final double sizeText;
  final bool boldT;
  const TextTitle({
    Key? key,
    required this.title,
    this.color: Colors.black,
    required this.sizeText,
    this.boldT: true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 1.h, left: 2.h, right: 2.h),
      child: Text(
        title,
        style: TextStyle(
          color: color,
          fontWeight: (boldT) ? FontWeight.bold : FontWeight.normal,
          fontSize: sizeText,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}
