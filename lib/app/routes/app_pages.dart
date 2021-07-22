import 'package:get/get.dart';

import 'package:anuncios_ui/app/modules/anuncios_search/bindings/anuncios_search_binding.dart';
import 'package:anuncios_ui/app/modules/anuncios_search/views/anuncios_search_view.dart';
import 'package:anuncios_ui/app/modules/categoria/bindings/categoria_binding.dart';
import 'package:anuncios_ui/app/modules/categoria/views/categoria_view.dart';
import 'package:anuncios_ui/app/modules/favorite_page/bindings/favorite_page_binding.dart';
import 'package:anuncios_ui/app/modules/favorite_page/views/favorite_page_view.dart';
import 'package:anuncios_ui/app/modules/home/bindings/home_binding.dart';
import 'package:anuncios_ui/app/modules/home/views/home_view.dart';
import 'package:anuncios_ui/app/modules/login/bindings/login_binding.dart';
import 'package:anuncios_ui/app/modules/login/views/login_view.dart';
import 'package:anuncios_ui/app/modules/principal/bindings/principal_binding.dart';
import 'package:anuncios_ui/app/modules/principal/views/principal_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.ANUNCIOS_SEARCH,
      page: () => AnunciosSearchView(),
      binding: AnunciosSearchBinding(),
    ),
    GetPage(
      name: _Paths.PRINCIPAL,
      page: () => PrincipalView(),
      binding: PrincipalBinding(),
    ),
    GetPage(
      name: _Paths.CATEGORIA,
      page: () => CategoriaView(),
      binding: CategoriaBinding(),
    ),
    GetPage(
      name: _Paths.FAVORITE_PAGE,
      page: () => FavoritePageView(),
      binding: FavoritePageBinding(),
    ),
  ];
}
