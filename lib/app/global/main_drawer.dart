import 'package:anuncios_ui/app/data/services/local/local_auth_service.dart';
import 'package:anuncios_ui/app/global/logout/logout_button.dart';
import 'package:anuncios_ui/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'main_drawer/main_drawer_controller.dart';

class MainDrawer extends StatelessWidget {
  final controller = Get.put(MainDrawerController());
  MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
        child: Drawer(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.5.w),
            child: ListView(
              children: [
                GetBuilder<MainDrawerController>(
                  init: MainDrawerController(),
                  initState: (_) {},
                  id: "drawerheader",
                  builder: (_) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: UserAccountsDrawerHeader(
                        accountName: Text(controller.user != null
                            ? controller.user!.name
                            : "ingrese un nombre"),
                        accountEmail: Text(controller.user != null
                            ? controller.user!.email
                            : "ingrese un correo electronico"),
                        currentAccountPicture: CircleAvatar(
                          backgroundImage: NetworkImage(controller.user != null
                              ? controller.user!.foto
                              : "https://randomuser.me/api/portraits/men/46.jpg"),
                        ),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(FontAwesomeIcons.user),
                  title: Text("Mi Cuenta"),
                  onTap: () {
                    Get.toNamed(Routes.PROFILE);
                  },
                ),
                ListTile(
                  leading: Icon(FontAwesomeIcons.listUl),
                  title: Text("Mis Anuncios"),
                  onTap: () {
                    Get.toNamed(Routes.MIS_ANUNCIOS);
                    print("click mis anuncios");
                  },
                ),
                ListTile(
                  leading: Icon(FontAwesomeIcons.heart),
                  title: Text("Mis Favoritos"),
                  onTap: () {
                    print("click mis favoritos");
                    Get.toNamed(Routes.FAVORITE_PAGE);
                  },
                ),
                ListTile(
                  leading: Icon(FontAwesomeIcons.moneyBillAlt),
                  title: Text("Mis Creditos"),
                  onTap: () {
                    Get.toNamed(Routes.RECARGA);
                  },
                ),
                ListTile(
                  leading: Icon(FontAwesomeIcons.search),
                  title: Text("Mis búsquedas"),
                  onTap: () async {
                    print(await Get.find<LocalAuthService>().getSession());
                  },
                ),
                LogoutView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
