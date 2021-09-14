import 'package:anuncios_ui/app/data/models/anuncio_detail.dart';
import 'package:anuncios_ui/app/global/card_anuncio.dart';
import 'package:anuncios_ui/app/global/favorito_bottom.dart';
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
          favorito: FavoritoButtom(
            icon: Icons.home,
            color: Colors.red,
            onPress: () {},
          ),
        );
      },
      shrinkWrap: true,
      itemCount: listAnuncio.length,
    );
  }
}
