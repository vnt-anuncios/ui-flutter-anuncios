import 'package:anuncios_ui/app/data/provider/anuncio_destacados_provider.dart';

class AnuncioDestacadoService {
  final AnuncioDestacadosProvider _anuncioDestacadosProvider;

  AnuncioDestacadoService(this._anuncioDestacadosProvider);

  getAnunciosDestacados() {
    return _anuncioDestacadosProvider.getDestacados();
  }
}
