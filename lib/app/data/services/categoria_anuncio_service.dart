import 'package:anuncios_ui/app/data/models/anuncio_detail.dart';
import 'package:anuncios_ui/app/data/provider/anuncio_detail_provider.dart';
import 'package:anuncios_ui/app/data/provider/categoria_anuncio_provider.dart';

class CategoriaAnuncioService {
  final CategoriaAnuncioProvider _categoriaAnuncioProvider;
  final AnuncioDetailProvider _anuncioDetailProvider;

  CategoriaAnuncioService(
    this._categoriaAnuncioProvider,
    this._anuncioDetailProvider,
  );

  Future<List<AnuncioDetails>> getAnuncioOfCategoria(int id) {
    return _categoriaAnuncioProvider.getAnuncioForCategoria(id);
  }

  getAnuncioOrderByDestacados() {
    return _categoriaAnuncioProvider.getAnuncioOrderByDestacadoFirst();
  }

  Future<List<AnuncioDetails>> getAnuncioDetail() {
    return this._anuncioDetailProvider.getAnuncioDetail();
  }
}
