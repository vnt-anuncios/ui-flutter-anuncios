import 'package:anuncios_ui/app/data/models/anuncio_detail.dart';
import 'package:anuncios_ui/app/global/card_destacado.dart';
import 'package:anuncios_ui/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AnunciosDestacados extends StatelessWidget {
  final List<AnuncioDetails> listDestacados;
  AnunciosDestacados({Key? key, required this.listDestacados})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 3, horizontal: 2.w),
      scrollDirection: Axis.horizontal,
      itemCount: listDestacados.length,
      //shrinkWrap: true,
      itemBuilder: (context, index) {
        return CardDestacado(
          anuncio: listDestacados[index],
          onPress: () =>
              Get.toNamed(Routes.DETAILS, arguments: listDestacados[index]),
        );
      },
    );
  }
}
