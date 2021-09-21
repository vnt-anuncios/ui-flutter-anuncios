import 'dart:convert';

import 'package:anuncios_ui/app/data/models/categoria.dart';
import 'package:anuncios_ui/app/utils/base_url.dart';
import 'package:http/http.dart' as http;

class CategoriaProvider {
  final String url = BaseUrl.BASE_URL_REMOTO + "categorias";

  Future<Map<int, List<Categoria>>> getCategorias() async {
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var data = json.decode(response.body)["data"] as List;
        Map<int, List<Categoria>> map = {};
        data.map((e) {
          int id = e["id"];
          List<Categoria> listCategoria =
              e["sub_categoria"].map<Categoria>((cate) {
            return Categoria.fromMap(cate);
          }).toList();

          map[id] = listCategoria;
        }).toList();
        return map;
      } else {
        throw response.body;
      }
    } catch (e) {
      throw e;
    }
  }
}
