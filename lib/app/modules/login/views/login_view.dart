import 'package:anuncios_ui/app/modules/login/views/components/or_divider.dart';
import 'package:anuncios_ui/app/modules/login/views/components/rounded_button.dart';
import 'package:anuncios_ui/app/modules/login/views/components/rounded_input_field.dart';
import 'package:anuncios_ui/app/modules/login/views/components/rounded_password_field.dart';
import 'package:anuncios_ui/app/modules/login/views/components/social_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 10.h),
            height: 90.h,
            width: 100.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "INICIAR SESIÓN",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 2.h),
                Container(
                  child: Center(
                    child: SvgPicture.asset(
                      "assets/img/login.svg",
                      width: 80.w,
                    ),
                  ),
                ),
                SizedBox(height: 2.h),
                RoundedInputField(
                  hintText: "Email",
                  onChanged: (value) {},
                ),
                RoundedPasswordField(
                  hintText: "Ingrese su Contraseña",
                  onChanged: (value) {
                    print(value);
                  },
                ),
                RoundedButton(
                  text: "Iniciar sesión",
                  press: () {},
                  color: Color(0xff15852F),
                ),
                SizedBox(height: 1.h),
                Expanded(child: OrDivider()),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialIcon(
                        iconSrc: FontAwesomeIcons.facebook,
                        press: () {},
                        color: Colors.blue,
                      ),
                      SocialIcon(
                        iconSrc: FontAwesomeIcons.twitter,
                        press: () {},
                        color: Colors.lightBlueAccent.shade400,
                      ),
                      SocialIcon(
                        iconSrc: FontAwesomeIcons.google,
                        press: () {},
                        color: Colors.red,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
