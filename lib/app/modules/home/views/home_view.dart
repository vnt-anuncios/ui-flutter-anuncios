import 'package:anuncios_ui/app/global/main_drawer.dart';
import 'package:anuncios_ui/app/modules/home/views/components/anuncios_home_page.dart';
import 'package:anuncios_ui/app/modules/home/views/components/setting_home_page.dart';
import 'package:anuncios_ui/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'package:sizer/sizer.dart';

import 'components/anuncios_destacados.dart';
import 'components/main_category.dart';

class HomeView extends GetView<HomeController> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  final List<CategoriaItem> item = [
    CategoriaItem(title: "Motor", svgAssets: "assets/categoria/motor.svg"),
    CategoriaItem(
        title: "Inmobilaria", svgAssets: "assets/categoria/inmobiliaria.svg"),
    CategoriaItem(title: "Empleo", svgAssets: "assets/categoria/empleos.svg"),
    CategoriaItem(
        title: "Formación y Libros",
        svgAssets: "assets/categoria/formacion.svg"),
    CategoriaItem(title: "Juegos", svgAssets: "assets/categoria/game.svg"),
    CategoriaItem(
        title: "Servicios", svgAssets: "assets/categoria/servicios.svg"),
    CategoriaItem(
        title: "Negocios", svgAssets: "assets/categoria/negocios.svg"),
    CategoriaItem(
        title: "asdfasdfasdfasdfsdfasdfasdfasdfasdf",
        svgAssets: "assets/categoria/computer.svg"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      endDrawer: MainDrawer(),
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MainCategoria(
            items: item,
          ),
          TextTitle(
            title: "Anuncios Destacados",
            sizeText: 14.sp,
          ),
          AnunciosDestacados(),
          Padding(
            padding: EdgeInsets.only(top: 1.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextTitle(
                  title: "Nuevos Anuncios",
                  color: Colors.black,
                  sizeText: 14.sp,
                ),
                GestureDetector(
                  onTap: () {
                    print("ver mas");
                  },
                  child: TextTitle(
                    title: "ver mas >>",
                    color: Colors.blue,
                    sizeText: 12.sp,
                    boldT: false,
                  ),
                ),
              ],
            ),
          ),
          AnunciosHomePage(),
        ],
      ),
      bottomNavigationBar: SettingHomePage(
        items: [
          BottonAppBarItem(Icons.search, "Buscar", Routes.LOGIN),
          BottonAppBarItem(Icons.notifications_none, "Busquedas", Routes.LOGIN),
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
            if (scaffoldKey.currentState!.isEndDrawerOpen) {
              scaffoldKey.currentState!.openDrawer();
            } else {
              scaffoldKey.currentState!.openEndDrawer();
            }
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        height: 12.h,
        width: 12.w,
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.green,
          elevation: 2,
          mini: true,
          child: Icon(
            Icons.add_box_outlined,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class TextTitle extends StatelessWidget {
  final String title;
  final Color color;
  final double sizeText;
  final bool boldT;
  const TextTitle({
    Key? key,
    required this.title,
    this.color: Colors.black,
    required this.sizeText,
    this.boldT: true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 1.h, left: 2.h, right: 2.h),
      child: Text(
        title,
        style: TextStyle(
          color: color,
          fontWeight: (boldT) ? FontWeight.bold : FontWeight.normal,
          fontSize: sizeText,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}
