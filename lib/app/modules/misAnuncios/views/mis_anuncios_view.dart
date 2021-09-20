import 'package:anuncios_ui/app/global/loading/loading.dart';
import 'package:anuncios_ui/app/modules/anuncios_search/views/anuncios_search_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/mis_anuncios_controller.dart';

class MisAnunciosView extends GetWidget<MisAnunciosController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mis Anuncios',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        color: Colors.green,
        onRefresh: () async {},
        child: Obx(
          () => (controller.isLoading)
              ? Container(
                  child: Center(
                    child: CircularProgressIndicatorGreen(),
                  ),
                )
              : (controller.misAnuncios.isEmpty)
                  ? CustomScrollView(
                      slivers: [
                        SliverFillRemaining(
                          child: Center(
                            child: Text("No tienes anuncios Favoritos"),
                          ),
                        )
                      ],
                    )
                  : ListView.builder(
                      itemCount: controller.misAnuncios.length,
                      itemBuilder: (context, index) => CardAnuncioSearch(
                        anuncioDetails: controller.misAnuncios[index],
                      ),
                    ),
        ),
      ),
    );
  }
}
