import 'package:anuncios_ui/app/global/nuevo_categoria.dart';
import 'package:anuncios_ui/app/global/text_title.dart';
import 'package:anuncios_ui/app/modules/anuncios_search/controllers/anuncios_search_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

import 'package:get/get.dart';

class FiltrosBusquedaView extends GetView<AnunciosSearchController> {
  Future _selectCategoria(BuildContext context, bool tipo) {
    return showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) => AlertDialog(
            title: Text((tipo) ? 'Categoria' : 'Subcategoria'),
            content: GetBuilder<AnunciosSearchController>(
              id: "showModal",
              builder: (_) {
                return Container(
                  width: double.maxFinite,
                  height: 50.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: item.length + 1,
                          itemBuilder: (context, index) => (index > 0)
                              ? RadioListTile(
                                  contentPadding: EdgeInsets.zero,
                                  value: item[index - 1].id,
                                  groupValue: (tipo)
                                      ? controller.categoriaSelect.value
                                      : controller.subCategoriaSelect.value,
                                  onChanged: (value) {
                                    (tipo)
                                        ? controller.increment(value!)
                                        : controller.change(value!);
                                    Navigator.pop(context,
                                        controller.categoriaSelect.value);
                                  },
                                  title: Text(item[index - 1].title),
                                )
                              : RadioListTile(
                                  contentPadding: EdgeInsets.zero,
                                  value: 0,
                                  groupValue: (tipo)
                                      ? controller.categoriaSelect.value
                                      : controller.subCategoriaSelect.value,
                                  onChanged: (value) {
                                    (tipo)
                                        ? controller.increment(value!)
                                        : controller.change(value!);
                                    Navigator.pop(context,
                                        controller.categoriaSelect.value);
                                  },
                                  title: Text((tipo)
                                      ? "Todas las Categorias"
                                      : "Seleccione una subcategoria"),
                                ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Filtros Busqueda',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 15.sp,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.close,
            color: Colors.green,
            size: 18.sp,
          ),
        ),
      ),
      body: SizedBox(
        width: 100.w,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Positioned.fill(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 2.h,
                    ),
                    TextTitle(
                      title: "Categorias",
                      sizeText: 15.sp,
                      color: Colors.green,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Obx(
                      () => CardOptionCategoria(
                        title: TextTitleOptionCategoria(
                          label: "Categoria",
                          size: 11.sp,
                        ),
                        onPress: () {
                          _selectCategoria(context, true)
                              .then((value) => print(value! as int));
                        },
                        subTitle: TextTitleOptionCategoria(
                          label: (controller.categoriaSelect.value == 0)
                              ? "Todas las categorias"
                              : item[controller.categoriaSelect.value - 1]
                                  .title,
                          size: 12.sp,
                          weigth: true,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Obx(
                      () => CardOptionCategoria(
                        onPress: () {
                          _selectCategoria(context, false).then((value) =>
                              print(controller.subCategoriaSelect.value));
                        },
                        title: TextTitleOptionCategoria(
                          label: "Subcategoria",
                          size: 11.sp,
                        ),
                        subTitle: TextTitleOptionCategoria(
                          label: (controller.subCategoriaSelect.value == 0)
                              ? "Seleccione una subcategoria"
                              : item[controller.subCategoriaSelect.value - 1]
                                  .title,
                          size: 12.sp,
                          weigth: true,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    TextTitle(
                      title: "Precio",
                      sizeText: 15.sp,
                      color: Colors.green,
                    ),
                    SizedBox(
                      height: 1.w,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 40.w,
                          child: Text(
                            "Desde",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 11.sp,
                            ),
                          ),
                        ),
                        SizedBox(
                            width: 40.w,
                            child: Text(
                              "Hasta",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 11.sp,
                              ),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 40.w,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "ejemplo: 50",
                              labelText: "Desde",
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 40.w,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "ejemplo: 80",
                              labelText: "hasta",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: 80.w,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Aplicar Filtros",
                      style: TextStyle(fontSize: 13.sp),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardOptionCategoria extends StatelessWidget {
  final TextTitleOptionCategoria title;
  final TextTitleOptionCategoria subTitle;
  final IconData icon;
  final VoidCallback onPress;

  const CardOptionCategoria({
    Key? key,
    required this.title,
    required this.subTitle,
    this.icon: FontAwesomeIcons.angleRight,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: Colors.grey.shade400,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  title,
                  SizedBox(
                    height: 1.h,
                  ),
                  subTitle,
                ],
              ),
            ),
            IconButton(
              onPressed: onPress,
              icon: Icon(icon),
            ),
          ],
        ),
      ),
    );
  }
}

class TextTitleOptionCategoria extends StatelessWidget {
  final String label;
  final double size;
  final Color color;
  final bool weigth;
  const TextTitleOptionCategoria(
      {Key? key,
      required this.label,
      required this.size,
      this.color: Colors.black,
      this.weigth: false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: (weigth) ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
