import 'package:anuncios_ui/app/global/logout/logout_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class LogoutView extends GetWidget<LogoutController> {
  const LogoutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(FontAwesomeIcons.signOutAlt),
      title: Text("Cerrar sesión"),
      onTap: () {
        Get.find<LogoutController>().googleSingOut();
      },
    );
  }
}
