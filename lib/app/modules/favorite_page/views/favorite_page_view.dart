import 'package:anuncios_ui/app/global/card_anuncios_item_principal.dart';
import 'package:anuncios_ui/app/global/lista_anuncios.dart';
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
            color: Colors.black,
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 2,
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "cantidad de favorito",
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      anuncios.length.toString(),
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
                              itemBuilder: (context, index) =>
                                  CardAnunciosItemPricipal(
                                anuncio: anuncios[index],
                                onPress: () {
                                  print(anuncios[index].title);
                                },
                              ),
                            ),
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
