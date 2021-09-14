import 'package:anuncios_ui/app/global/card_anuncio.dart';
import 'package:anuncios_ui/app/global/favorito_bottom.dart';
import 'package:anuncios_ui/app/global/loading/loading.dart';
import 'package:anuncios_ui/app/global/text_global.dart';
import 'package:anuncios_ui/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/favorite_page_controller.dart';
import 'package:sizer/sizer.dart';

class FavoritePageView extends GetWidget<FavoritePageController> {
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
      body: Obx(
        () => (controller.isLoading)
            ? Container(
                child: Center(
                  child: CircularProgressIndicatorGreen(),
                ),
              )
            : Padding(
                padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
                child: Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 1.w, vertical: 1.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextFormat(
                                text: "cantidad de favoritos", size: 12.5.sp),
                            GetBuilder<FavoritePageController>(
                              id: "listFavorite",
                              builder: (_) => TextFormat(
                                  text: _.favoritos.length.toString(),
                                  size: 12.5.sp),
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
                        child: GetBuilder<FavoritePageController>(
                          id: "listFavorite",
                          builder: (_) => (_.favoritos.isEmpty)
                              ? RefreshIndicator(
                                  onRefresh: () => _.refresh(),
                                  child: CustomScrollView(
                                    slivers: [
                                      SliverFillRemaining(
                                        child: Center(
                                          child: Text(
                                              "No tienes anuncios Favoritos"),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              : Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Expanded(
                                      child: RefreshIndicator(
                                        onRefresh: () => _.refresh(),
                                        child: ListView.builder(
                                            itemCount: _.favoritos.length,
                                            itemBuilder: (context, index) {
                                              return CardAnuncio(
                                                onPress: () {
                                                  Get.toNamed(
                                                    Routes.DETAILS,
                                                    arguments:
                                                        _.favoritos[index],
                                                  );
                                                },
                                                anuncioDetails:
                                                    _.favoritos[index],
                                                favorito: FavoritoButtom(
                                                  icon: _.favoritos[index]
                                                          .isFavorito
                                                      ? Icons.favorite
                                                      : Icons
                                                          .favorite_border_outlined,
                                                  color: _.favoritos[index]
                                                          .isFavorito
                                                      ? Colors.red
                                                      : Colors.black,
                                                  onPress: () async {
                                                    print("hola mundo");
                                                    bool success =
                                                        await _.deleteFavorito(
                                                            index,
                                                            _.favoritos[index]
                                                                .anuncio.id);
                                                    success
                                                        ? Get.snackbar(
                                                            "eliminado",
                                                            "Anuncio quitado con exito",
                                                            duration: Duration(
                                                                seconds: 2),
                                                            snackPosition:
                                                                SnackPosition
                                                                    .BOTTOM,
                                                            margin:
                                                                EdgeInsets.only(
                                                                    bottom:
                                                                        3.h),
                                                          )
                                                        : Container();
                                                  },
                                                ),
                                              );
                                            }),
                                      ),
                                    ),
                                  ],
                                ),
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
