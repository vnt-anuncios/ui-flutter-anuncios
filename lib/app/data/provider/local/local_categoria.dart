import 'dart:convert';

import 'package:anuncios_ui/app/data/models/categoria.dart';
import 'package:flutter/services.dart';

class LocalCategoria {
  List<Categoria> _categorias = [];
  Map<int, List<Categoria>> _subCategorias = {};

  get categorias => _categorias;
  get subCategorias => _subCategorias;

  Future<void> categoria() async {
    try {
      var response = await rootBundle
          .loadString('assets/categoria/categoria_principal.json');
      var data = await json.decode(response)["categorias"] as List;
      _categorias = data.map<Categoria>((e) {
        return Categoria.fromMap(e);
      }).toList();
    } catch (e) {
      throw "ocurrio un error al cargar la categoria";
    }
  }

  Future<void> subCategoria() async {
    try {
      var response =
          await rootBundle.loadString('assets/categoria/subcategoria.json');
      var data = await json.decode(response)["data"] as List;
      print(data.first["id"]);
      data.map((e) {
        _subCategorias[e["id"]] = e["subcategorias"]
            .map<Categoria>((cate) => Categoria.fromMap(cate))
            .toList();
      }).toList();
      print(_subCategorias.toString());
    } catch (e) {
      throw "ocurrio un error al cargar la categoria";
    }
  }

  Future<void> cargarCategoria() async {
    try {
      await categoria();
      await subCategoria();
    } catch (e) {}
  }
}
