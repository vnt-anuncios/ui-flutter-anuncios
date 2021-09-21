import 'package:anuncios_ui/app/data/models/anuncio_detail.dart';
import 'package:anuncios_ui/app/global/my_image_network.dart';
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
                  onPress: () {
                    controller.getAnunciosDetails();
                  },
                ),
              ],
            ),
            Expanded(
              child: Obx(
                () => (controller.loading)
                    ? Container(
                        child: Center(
                          child: SizedBox(
                            width: 20.sp,
                            height: 20.sp,
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      )
                    : (controller.listAnuncio.isEmpty)
                        ? Container(
                            child: Center(
                                child: Text(
                                    "No existe anuncios en esta categorias")))
                        : ListView.builder(
                            itemCount: controller.listAnuncio.length,
                            itemBuilder: (context, index) {
                              return CardAnuncioSearch(
                                anuncioDetails: controller.listAnuncio[index],
                              );
                            },
                          ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardAnuncioSearch extends StatelessWidget {
  const CardAnuncioSearch({
    Key? key,
    required this.anuncioDetails,
  }) : super(key: key);

  final AnuncioDetails anuncioDetails;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 26.h,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: InkWell(
            onTap: () {
              Get.toNamed(
                Routes.DETAILS,
                arguments: anuncioDetails,
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
                              borderRadius: BorderRadius.circular(10),
                              child: SizedBox(
                                width: 35.w,
                                child:
                                    MyImageNetWork(fotos: anuncioDetails.fotos),
                              ),
                            ),
                          ),
                        ],
                      ),
                      DetalleCardItem(
                        anuncios: anuncioDetails,
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
  }
}
