import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:sizer/sizer.dart';

class FiltrosButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onPress;
  const FiltrosButton(
      {Key? key,
      required this.label,
      required this.icon,
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                style: BorderStyle.solid,
                color: Colors.green,
                width: 1,
              ),
            ),
          ),
        ),
        onPressed: onPress,
        icon: Icon(
          icon,
          size: 10.sp,
        ),
        label: Text(
          label,
          style: TextStyle(
            fontSize: 10.sp,
          ),
        ));
  }
}
