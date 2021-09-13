import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: 100.w,
      color: Colors.black.withOpacity(0.5),
      child: Center(
        child: CircularProgressIndicatorGreen(),
      ),
    );
  }
}

class CircularProgressIndicatorGreen extends StatelessWidget {
  const CircularProgressIndicatorGreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(Colors.greenAccent),
    );
  }
}
