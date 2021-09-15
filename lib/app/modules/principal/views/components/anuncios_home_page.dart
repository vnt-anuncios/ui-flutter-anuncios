import 'package:anuncios_ui/app/data/models/anuncio_detail.dart';
import 'package:anuncios_ui/app/global/card_anuncio.dart';
import 'package:anuncios_ui/app/global/favorito_bottom.dart';
import 'package:anuncios_ui/app/modules/home/controllers/home_controller.dart';
import 'package:anuncios_ui/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AnunciosHomePage extends StatelessWidget {
  final List<AnuncioDetails> listAnuncio;
  const AnunciosHomePage({Key? key, required this.listAnuncio})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      addAutomaticKeepAlives: true,
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.3.h),
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return CardAnuncio(
          onPress: () =>
              Get.toNamed(Routes.DETAILS, arguments: listAnuncio[index]),
          anuncioDetails: listAnuncio[index],
          favorito: GetBuilder<HomeController>(
            id: index,
            builder: (_) => FavoritoButtom(
                icon: _.listAnuncioDetails[index].isFavorito
                    ? Icons.favorite
                    : Icons.favorite_border_outlined,
                color: _.listAnuncioDetails[index].isFavorito
                    ? Colors.red
                    : Colors.black,
                onPress: () async => _.listAnuncioDetails[index].isFavorito
                    ? {
                        await _.deleteFavorito(
                            index, _.listAnuncioDetails[index].anuncio.id),
                        mySnackBar("Eliminado", "El anuncio quitado con éxito")
                      }
                    : {
                        await _.addFavorito(
                            index, _.listAnuncioDetails[index].anuncio.id),
                        mySnackBar(
                            "Agregado", "El anuncio fue agregado con éxito")
                      }),
          ),
        );
      },
      shrinkWrap: true,
      itemCount: listAnuncio.length,
    );
  }

  mySnackBar(String title, String message) {
    Get.snackbar(title, message,
        duration: Duration(seconds: 2),
        margin: EdgeInsets.only(bottom: 5.h),
        snackPosition: SnackPosition.BOTTOM);
  }
}
