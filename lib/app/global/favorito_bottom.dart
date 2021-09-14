import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class FavoritoButtom extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onPress;
  const FavoritoButtom({
    Key? key,
    required this.icon,
    required this.color,
    required this.onPress,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      right: 1.w,
      child: IconButton(
        alignment: Alignment.topRight,
        padding: EdgeInsets.all(0),
        onPressed: onPress,
        icon: Icon(
          icon,
          color: color,
        ),
      ),
    );
  }
}
