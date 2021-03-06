import 'package:anuncios_ui/app/global/main_drawer.dart';
import 'package:anuncios_ui/app/modules/anuncios_search/views/anuncios_search_view.dart';
import 'package:anuncios_ui/app/modules/favorite_page/views/favorite_page_view.dart';
import 'package:anuncios_ui/app/modules/home/views/components/setting_home_page.dart';
import 'package:anuncios_ui/app/modules/principal/views/principal_view.dart';
import 'package:anuncios_ui/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class HomeView extends GetView<HomeController> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  final listPage = [
    PrincipalView(),
    AnunciosSearchView(),
    FavoritePageView(),
    FavoritePageView(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        endDrawer: MainDrawer(),
        backgroundColor: Colors.white,
        /*appBar: AppBar(
          title: Text('HomeView'),
          centerTitle: true,
        ),*/
        body: Obx(
          () => listPage.elementAt(controller.indexRx.value),
        ),
        bottomNavigationBar: GetBuilder<HomeController>(
          id: "menu",
          builder: (_) {
            return SettingHomePage(
              items: [
                BottonAppBarItem(Icons.home_outlined, "Home", Routes.LOGIN),
                BottonAppBarItem(Icons.search, "Buscar", Routes.LOGIN),
                BottonAppBarItem(
                    Icons.favorite_border_outlined, "Favoritos", Routes.LOGIN),
                BottonAppBarItem(Icons.person_outline, "Perfil", Routes.LOGIN),
              ],
              centerItemText: "Publicar",
              backgroundColor: Colors.white,
              color: Colors.grey.shade500,
              selectedColor: Colors.green,
              notchedShape: CircularNotchedRectangle(),
              onTabSelected: (value) {
                print(value);
                if (value == 3) {
                  print(scaffoldKey.currentState?.isEndDrawerOpen);
                  if (scaffoldKey.currentState!.isEndDrawerOpen) {
                    scaffoldKey.currentState!.openEndDrawer();
                  } else {
                    scaffoldKey.currentState!.openEndDrawer();
                  }
                } else {
                  controller.change(value);
                }
              },
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: SizedBox(
          height: 12.h,
          width: 12.w,
          child: FloatingActionButton(
            onPressed: () async {
              int change = controller.indexRx.value;
              await Get.toNamed(Routes.CATEGORIA);

              Get.toNamed(Routes.PUBLISH);
              controller.change(change);
            },
            backgroundColor: Colors.green,
            elevation: 2,
            mini: true,
            child: Icon(
              Icons.add_box_outlined,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
