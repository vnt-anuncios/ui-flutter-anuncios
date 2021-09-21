import 'package:anuncios_ui/app/data/models/categoria.dart';
import 'package:anuncios_ui/app/modules/anuncios_search/controllers/anuncios_search_controller.dart';
import 'package:anuncios_ui/app/modules/home/controllers/home_controller.dart';
import 'package:anuncios_ui/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class MainCategoria extends StatelessWidget {
  final int cantidadVisual = 7;
  final List<Categoria> items;
  const MainCategoria({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 14.5.h,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 0.5.h),
        shrinkWrap: true,
        itemCount: cantidadVisual,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          if (index == cantidadVisual - 1) {
            return ItemCard(
                items: Categoria(
                  id: 0,
                  nombre: "Todas las categorias",
                  imagen: "ver_mas",
                ),
                // imagen: "assets/categoria/ver_mas.svg"),
                onPress: () {
                  Navigator.of(context).pushNamed(Routes.CATEGORIA);
                });
          }
          return ItemCard(
            items: items[index],
            onPress: () {
              Get.find<AnunciosSearchController>().selectCategoria.value =
                  items[index].id;
              Get.find<AnunciosSearchController>()
                  .getAnuncioCategoria(items[index].id);
              Get.find<HomeController>().change(1);
            },
          );
        },
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key? key,
    required this.items,
    required this.onPress,
  }) : super(key: key);

  final Categoria items;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Card(
        color: Colors.white,
        elevation: 0.0,
        child: Container(
          width: 22.w,
          padding: EdgeInsets.all(5),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/categoria/${items.imagen}.svg",
                        width: 10.w,
                        height: 5.h,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Expanded(
                  child: Text(
                    items.nombre,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    maxLines: 2,
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

class CategoriaItem {
  final int id;
  final String title;
  final String svgAssets;
  CategoriaItem(
      {required this.id, required this.title, required this.svgAssets});
}
