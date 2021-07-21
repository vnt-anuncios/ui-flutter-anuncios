import 'package:anuncios_ui/app/global/list_item.dart';
import 'package:anuncios_ui/app/modules/categoria/views/componentes/search_field.dart';
import 'package:anuncios_ui/app/modules/categoria/views/sub_categoria_view.dart';
import 'package:anuncios_ui/app/modules/home/views/components/main_category.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:get/get.dart';

import '../controllers/categoria_controller.dart';

class CategoriaView extends GetView<CategoriaController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Todas las Categorias'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            SearchField(
              onSearch: (cad) {
                print("buscar");
              },
            ),
            Expanded(
              child: Container(
                child: GridView.builder(
                  itemCount: itemdecategoria.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
                  itemBuilder: (context, index) => Center(
                    child: ItemCard(
                      items: itemdecategoria[index],
                      onPress: () {
                        print(
                          itemdecategoria[index].title,
                        );
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SubCategoriaView(
                              categoria: index,
                              name: itemdecategoria[index].title,
                            ),
                          ),
                        );
                      },
                    ),
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
