import 'package:anuncios_ui/app/data/models/categoria.dart';
import 'package:anuncios_ui/app/modules/anuncios_search/controllers/anuncios_search_controller.dart';
import 'package:anuncios_ui/app/modules/categoria/controllers/categoria_controller.dart';
import 'package:anuncios_ui/app/modules/categoria/views/componentes/search_field.dart';
import 'package:anuncios_ui/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import 'package:get/get.dart';

class SubCategoriaView extends GetView<CategoriaController> {
  final int categoria;
  final String name;
  const SubCategoriaView(
      {Key? key, required this.categoria, required this.name});
  @override
  Widget build(BuildContext context) {
    List<Categoria>? subCategoria = controller.subCategoria[categoria];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Categoria $name'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SearchField(onSearch: (value) {}),
            ItemSubCategoria(
              title: "Todas las $name",
              onPress: (value) {},
            ),
            (subCategoria != null)
                ? Expanded(
                    child: ListView.builder(
                      itemCount: subCategoria.length,
                      padding: EdgeInsets.symmetric(horizontal: 2.w),
                      itemBuilder: (context, index) {
                        return ItemSubCategoria(
                          title: subCategoria[index].nombre,
                          onPress: (value) {
                            Get.find<AnunciosSearchController>()
                                .selectCategoria
                                .value = subCategoria[index].id;
                            Get.find<AnunciosSearchController>()
                                .getAnuncioCategoria(subCategoria[index].id);
                            Get.back();
                            Get.back();
                            Get.find<HomeController>().change(1);
                          },
                        );
                      },
                    ),
                  )
                : Expanded(
                    child: Opacity(
                      opacity: 0.5,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 2.h),
                              child: SvgPicture.asset(
                                "assets/img/cancel.svg",
                              ),
                            ),
                            Text(
                              "No se encontraron \nsubcategoria",
                              style: TextStyle(
                                fontSize: 11.sp,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

class ItemSubCategoria extends StatelessWidget {
  const ItemSubCategoria({
    Key? key,
    required this.title,
    required this.onPress,
  }) : super(key: key);

  final String title;
  final Function(String) onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPress(title),
      child: SizedBox(
        height: 7.h,
        child: Card(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w400,
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
