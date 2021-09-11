import 'package:anuncios_ui/app/global/nuevo_categoria.dart';
import 'package:anuncios_ui/app/global/text_title.dart';
import 'package:anuncios_ui/app/modules/home/controllers/home_controller.dart';
import 'package:anuncios_ui/app/modules/principal/views/components/anuncios_destacados.dart';
import 'package:anuncios_ui/app/modules/principal/views/components/anuncios_home_page.dart';
import 'package:anuncios_ui/app/modules/principal/views/components/main_category.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/principal_controller.dart';

class PrincipalView extends StatelessWidget {
  final controller = Get.find<HomeController>();
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
          SizedBox(
            height: 28.h,
            child: Obx(
              () => (controller.isLoadingDestacados)
                  ? loadingAnuncio()
                  : AnunciosDestacados(
                      listDestacados: controller.listAnuncioDestacados,
                    ),
            ),
          ),
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
          Expanded(
            child: Obx(
              () => (controller.isLoading)
                  ? loadingAnuncio()
                  : AnunciosHomePage(
                      listAnuncio: controller.listAnuncioDetails),
            ),
          )
        ],
      ),
    );
  }

  loadingAnuncio() {
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
