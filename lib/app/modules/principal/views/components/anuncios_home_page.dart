import 'dart:math';

import 'package:anuncios_ui/app/global/card_anuncio.dart';
import 'package:anuncios_ui/app/global/lista_anuncios.dart';
import 'package:anuncios_ui/app/global/user.dart';
import 'package:anuncios_ui/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AnunciosHomePage extends StatelessWidget {
  const AnunciosHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User user = usuario.elementAt(
      Random().nextInt(usuario.length),
    );
    return Expanded(
      child: ListView.builder(
        addAutomaticKeepAlives: true,
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.3.h),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return CardAnuncio(
            onPress: () => Get.toNamed(Routes.DETAILS,arguments: [anuncios[index],user] ) ,
            anuncio: anuncios[index], user: user);
        },
       shrinkWrap: true,
        itemCount: anuncios.length,
      ),
    );
  }
}
