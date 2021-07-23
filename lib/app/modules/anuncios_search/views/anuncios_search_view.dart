import 'dart:math';

import 'package:anuncios_ui/app/global/lista_anuncios.dart';
import 'package:anuncios_ui/app/global/user.dart';
import 'package:anuncios_ui/app/modules/anuncios_search/controllers/anuncios_search_controller.dart';
import 'package:anuncios_ui/app/modules/anuncios_search/views/components/filtros_busqueda_view.dart';
import 'package:anuncios_ui/app/routes/app_pages.dart';
import 'package:anuncios_ui/app/utils/numero.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'components/filtros_button.dart';

class AnunciosSearchView extends GetWidget<AnunciosSearchController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.end,
              spacing: 10.0,
              children: [
                FiltrosButton(
                  label: "Filtros",
                  icon: Icons.menu_book_outlined,
                  onPress: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => FiltrosBusquedaView(),
                    ));
                  },
                ),
                FiltrosButton(
                  label: "Todas las categorias",
                  icon: Icons.menu,
                  onPress: () {},
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: anuncios.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 30.h,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: InkWell(
                          onTap: () {
                            print("estamos en la card");
                            Get.toNamed(
                              Routes.DETAILS,
                              arguments: anuncios[index],
                            );
                          },
                          child: Stack(
                            children: [
                              Positioned(
                                top: 0,
                                right: 0,
                                child: IconButton(
                                  alignment: Alignment.topRight,
                                  onPressed: () {
                                    print("favorito");
                                  },
                                  icon: Icon(Icons.favorite_border_outlined),
                                ),
                              ),
                              Positioned.fill(
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Expanded(
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: (!anuncios[index]
                                                    .images
                                                    .isEmpty)
                                                ? Image.network(
                                                    anuncios[index].images[0],
                                                    width: 35.w,
                                                    fit: BoxFit.cover,
                                                  )
                                                : Image.asset(
                                                    "assets/img/c.jpg",
                                                    width: 35.w,
                                                    fit: BoxFit.cover,
                                                  ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    DetalleCardItem(
                                      anuncios: anuncios[index],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetalleCardItem extends StatelessWidget {
  final Anuncios anuncios;

  const DetalleCardItem({
    Key? key,
    required this.anuncios,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User user = usuario.elementAt(
      Random().nextInt(usuario.length),
    );
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: 2.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextCustomApp(
                    title: anuncios.precio.toString() + " BS",
                    fontSize: 12.sp,
                    color: Colors.red,
                    weight: true,
                  ),
                  TextCustomApp(
                    title: anuncios.title.toUpperCase(),
                    fontSize: 10.sp,
                    color: Colors.black,
                    weight: true,
                    maxLine: 2,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextCustomApp(
                          title: anuncios.descripcion,
                          fontSize: 11.sp,
                          color: Colors.black,
                          maxLine: 4,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            size: 12.sp,
                            color: Colors.grey.shade400,
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          TextCustomApp(
                            title: anuncios.ubicacion,
                            fontSize: 11.sp,
                            color: Colors.grey.shade400,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextCustomApp(
                            title: "2021-05-02",
                            fontSize: 10.sp,
                            color: Colors.grey.shade400,
                          ),
                          Container(
                            padding: EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(
                                5,
                              ),
                            ),
                            child: TextCustomApp(
                              title: "destacado",
                              fontSize: 10.sp,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  TextCustomApp(
                    title: "auto - 4 patas - 4 puertas - etx -  asjdfs - asdf",
                    color: Colors.grey.shade500,
                    fontSize: 11.sp,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5.h,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton.icon(
                      onPressed: () async {
                        var whatsapp = urlWhatssap(numero: user.numero);
                        if (await canLaunch(whatsapp)) {
                          await launch(whatsapp);
                        } else {
                          throw 'could nnot launch $whatsapp';
                        }
                      },
                      icon: Icon(
                        FontAwesomeIcons.whatsapp,
                        size: 17.sp,
                      ),
                      label: Text("Contactar"),
                    ),
                    TextButton.icon(
                      onPressed: () async {
                        String numero = user.numero;

                        var telefono = llamar(numero: numero);
                        if (await canLaunch(telefono)) {
                          await launch(telefono);
                        } else {
                          throw 'could nnot launch $telefono';
                        }
                      },
                      icon: Icon(
                        Icons.phone_android_outlined,
                        size: 17.sp,
                      ),
                      label: Text("Llamar"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextCustomApp extends StatelessWidget {
  final String title;
  final double fontSize;
  final Color color;
  final bool weight;
  final int maxLine;
  TextCustomApp({
    Key? key,
    required this.title,
    required this.color,
    required this.fontSize,
    this.weight: false,
    this.maxLine: 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: (weight) ? FontWeight.bold : FontWeight.normal,
      ),
      maxLines: maxLine,
      overflow: TextOverflow.ellipsis,
    );
  }
}
