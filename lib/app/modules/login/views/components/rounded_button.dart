import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  const RoundedButton(
      {Key? key,
      required this.text,
      required this.press,
      this.color = Colors.green,
      this.textColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: 60.w,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: TextButton(
          style: TextButton.styleFrom(
            primary: textColor,
            backgroundColor: color,
          ),
          onPressed: () {
            press;
          },
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 15.sp,
            ),
          ),
        ),
      ),
    );
  }
}
