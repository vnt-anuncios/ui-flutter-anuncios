import 'package:anuncios_ui/app/modules/home/views/home_view.dart';
import 'package:anuncios_ui/app/modules/principal/views/components/anuncios_destacados.dart';
import 'package:anuncios_ui/app/modules/principal/views/components/anuncios_home_page.dart';
import 'package:anuncios_ui/app/modules/principal/views/components/main_category.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/principal_controller.dart';

class PrincipalView extends GetView<PrincipalController> {
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
    );
  }
}
