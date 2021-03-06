import 'package:get/get.dart';

import 'package:anuncios_ui/app/modules/SplashScreen/bindings/splash_screen_binding.dart';
import 'package:anuncios_ui/app/modules/SplashScreen/views/splash_screen_view.dart';
import 'package:anuncios_ui/app/modules/anuncios_search/bindings/anuncios_search_binding.dart';
import 'package:anuncios_ui/app/modules/anuncios_search/views/anuncios_search_view.dart';
import 'package:anuncios_ui/app/modules/categoria/bindings/categoria_binding.dart';
import 'package:anuncios_ui/app/modules/categoria/views/categoria_view.dart';
import 'package:anuncios_ui/app/modules/details/bindings/details_binding.dart';
import 'package:anuncios_ui/app/modules/details/views/details_view.dart';
import 'package:anuncios_ui/app/modules/favorite_page/bindings/favorite_page_binding.dart';
import 'package:anuncios_ui/app/modules/favorite_page/views/favorite_page_view.dart';
import 'package:anuncios_ui/app/modules/home/bindings/home_binding.dart';
import 'package:anuncios_ui/app/modules/home/views/home_view.dart';
import 'package:anuncios_ui/app/modules/login/bindings/login_binding.dart';
import 'package:anuncios_ui/app/modules/login/views/login_view.dart';
import 'package:anuncios_ui/app/modules/misAnuncios/bindings/mis_anuncios_binding.dart';
import 'package:anuncios_ui/app/modules/misAnuncios/views/mis_anuncios_view.dart';
import 'package:anuncios_ui/app/modules/principal/bindings/principal_binding.dart';
import 'package:anuncios_ui/app/modules/principal/views/principal_view.dart';
import 'package:anuncios_ui/app/modules/profile/bindings/profile_binding.dart';
import 'package:anuncios_ui/app/modules/profile/views/profile_view.dart';
import 'package:anuncios_ui/app/modules/publish/bindings/publish_binding.dart';
import 'package:anuncios_ui/app/modules/publish/views/publish_view.dart';
import 'package:anuncios_ui/app/modules/recarga/bindings/recarga_binding.dart';
import 'package:anuncios_ui/app/modules/recarga/views/recarga_view.dart';
import 'package:anuncios_ui/app/modules/verify_otp/bindings/verify_otp_binding.dart';
import 'package:anuncios_ui/app/modules/verify_otp/views/verify_otp_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

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
    GetPage(
      name: _Paths.DETAILS,
      page: () => DetailsView(),
      binding: DetailsBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.RECARGA,
      page: () => RecargaView(),
      binding: RecargaBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.VERIFY_OTP,
      page: () => VerifyOtpView(),
      binding: VerifyOtpBinding(),
    ),
    GetPage(
      name: _Paths.PUBLISH,
      page: () => PublishView(),
      binding: PublishBinding(),
    ),
    GetPage(
      name: _Paths.MIS_ANUNCIOS,
      page: () => MisAnunciosView(),
      binding: MisAnunciosBinding(),
    ),
  ];
}
