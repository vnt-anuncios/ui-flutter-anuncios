import 'dart:math';

import 'package:anuncios_ui/app/global/card_anuncio.dart';
import 'package:anuncios_ui/app/global/lista_anuncios.dart';
import 'package:anuncios_ui/app/global/text_global.dart';
import 'package:anuncios_ui/app/global/user.dart';
import 'package:anuncios_ui/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/favorite_page_controller.dart';
import 'package:sizer/sizer.dart';

class FavoritePageView extends GetView<FavoritePageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mis Favoritos',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextFormat(text: "cantidad de favoritos", size: 12.5.sp),
                    TextFormat(text: anuncios.length.toString(), size: 12.5.sp),
                  ],
                ),
              ),
              Divider(
                color: Colors.green,
                height: 2.h,
                thickness: 1,
              ),
              Expanded(
                child: (anuncios.isEmpty)
                    ? Center(
                        child: Text("no Tienes anuncios Favoritos"),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: ListView.builder(
                                itemCount: anuncios.length,
                                itemBuilder: (context, index) {
                                  User user = usuario.elementAt(
                                      Random().nextInt(usuario.length));
                                  return CardAnuncio(
                                      onPress: () {
                                        Get.toNamed(Routes.DETAILS,
                                            arguments: [anuncios[index], user]);
                                      },
                                      anuncio: anuncios[index],
                                      user: user);
                                }),
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
