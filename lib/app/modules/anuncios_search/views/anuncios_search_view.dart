import 'dart:math';

import 'package:anuncios_ui/app/global/lista_anuncios.dart';
import 'package:anuncios_ui/app/global/user.dart';
import 'package:anuncios_ui/app/modules/anuncios_search/controllers/anuncios_search_controller.dart';
import 'package:anuncios_ui/app/modules/anuncios_search/views/components/filtros_busqueda_view.dart';
import 'package:anuncios_ui/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'components/card_details.dart';
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
                  final User user = usuario.elementAt(
                    Random().nextInt(usuario.length),
                  );
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
                              arguments: [anuncios[index], user],
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
                                      user: user,
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

