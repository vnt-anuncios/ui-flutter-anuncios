import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SocialIcon extends StatelessWidget {
  final IconData iconSrc;
  final VoidCallback press;
  final Color color;
  const SocialIcon(
      {Key? key,
      required this.iconSrc,
      required this.press,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              offset: Offset(0.0, 2.0),
              blurRadius: 0.5,
            ),
          ],
          shape: BoxShape.circle,
        ),
        child: Icon(
          iconSrc,
          size: 25.sp,
          color: color,
        ),
      ),
    );
  }
}
