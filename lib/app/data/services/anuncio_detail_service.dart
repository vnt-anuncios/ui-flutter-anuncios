import 'package:anuncios_ui/app/data/models/anuncio_detail.dart';
import 'package:anuncios_ui/app/data/provider/anuncio_detail_provider.dart';

class AnuncioDetailService {
  final AnuncioDetailProvider anuncioDetailProvider;

  AnuncioDetailService({required this.anuncioDetailProvider});

  Future<List<AnuncioDetails>> getAnuncioDetail() {
    return this.anuncioDetailProvider.getAnuncioDetail();
  }
}
