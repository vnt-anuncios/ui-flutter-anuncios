import 'package:anuncios_ui/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

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
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: UserAccountsDrawerHeader(
                    accountName: Text("oswaldo"),
                    accountEmail: Text("oswaldo.orellana.v@gmail.com"),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://randomuser.me/api/portraits/men/46.jpg"),
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(FontAwesomeIcons.user),
                  title: Text("Mi Cuenta"),
                  onTap: () {
                    print("click mi cuenta");
                  },
                ),
                ListTile(
                  leading: Icon(FontAwesomeIcons.listUl),
                  title: Text("Mis Anuncios"),
                  onTap: () {
                    print("click mis anuncios");
                  },
                ),
                ListTile(
                  leading: Icon(FontAwesomeIcons.heart),
                  title: Text("Mis Favoritos"),
                  onTap: () {
                    print("click mis favoritos");
                  },
                ),
                ListTile(
                  leading: Icon(FontAwesomeIcons.search),
                  title: Text("Mis búsquedas"),
                  onTap: () {
                    print("click en busquedas");
                  },
                ),
                ListTile(
                  leading: Icon(FontAwesomeIcons.questionCircle),
                  title: Text("Ayuda"),
                  onTap: () {
                    print("click ayuda");
                  },
                ),
                ListTile(
                  leading: Icon(FontAwesomeIcons.signOutAlt),
                  title: Text("Cerrar sesión"),
                  onTap: () {
                    Get.toNamed(Routes.LOGIN);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
