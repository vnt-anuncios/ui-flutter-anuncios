import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_screen_controller.dart';
import 'package:sizer/sizer.dart';

class SplashScreenView extends GetWidget<SplashScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SplashScreenView'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white54,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              child: Center(
                child: Text(
                  'Logo de la empresa ',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              child: Center(
                child: SizedBox(
                    height: 20.sp,
                    width: 20.sp,
                    child: CircularProgressIndicator()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
