import 'package:anuncios_ui/app/data/services/auth_api_service.dart';
import 'package:anuncios_ui/app/data/services/google_sign_in_service.dart';
import 'package:anuncios_ui/app/data/services/local/local_auth_service.dart';
import 'package:anuncios_ui/app/data/services/local/local_user_auth_service.dart';
import 'package:anuncios_ui/app/routes/app_pages.dart';
import 'package:get/get.dart';

class LogoutController extends GetxController {
  final GoogleSignInService _googleSignInService =
      Get.find<GoogleSignInService>();
  final AuthApiService _authApiService = Get.find<AuthApiService>();
  final LocalAuthService _localAuthService = Get.find<LocalAuthService>();
  final LocalUserAuthService _localUserAuthService =
      Get.find<LocalUserAuthService>();
  LogoutController();

  googleSingOut() async {
    String? token = await _localAuthService.getSession();
    if (token != null) {
      _authApiService.logout(token).then((data) async {
        if (data) {
          await _googleSignInService.googleSignOut();
          await _localAuthService.clearSession();
          await _localUserAuthService.clearUser();
          Get.offNamed(Routes.LOGIN);
        }
      });
      ;
    }
  }
}
