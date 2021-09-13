import 'package:anuncios_ui/app/data/models/user.dart';
import 'package:anuncios_ui/app/data/services/auth_api_service.dart';
import 'package:anuncios_ui/app/data/services/google_sign_in_service.dart';
import 'package:anuncios_ui/app/data/services/local/local_auth_service.dart';
import 'package:anuncios_ui/app/data/services/local/local_user_auth_service.dart';
import 'package:anuncios_ui/app/routes/app_pages.dart';
import 'package:device_info/device_info.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  //dependency injection
  final GoogleSignInService googleSignInService =
      Get.find<GoogleSignInService>();
  final AuthApiService authApiService = Get.find<AuthApiService>();
  final LocalAuthService _localAuthService = Get.find<LocalAuthService>();
  final LocalUserAuthService _localUserAuthService =
      Get.find<LocalUserAuthService>();
  //dependency injection
  //atributes
  RxBool loading = false.obs;
  //setter and getter
  get isLoading => loading.value;
  LoginController();

  @override
  void onInit() {
    super.onInit();
  }

  googleSignIn() async {
    try {
      loading.value = true;
      String token = await googleSignInService.googleSignIn();
      print(token);

      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      var data = await authApiService.requestTokenGoogle(token, androidInfo);

      await _localAuthService.setSession(data[1]);
      await _localUserAuthService.setUser(data[0]);

      User? user = await _localUserAuthService.getUser();
      if (await _localAuthService.getSession() != null && user != null) {
        Get.offNamed(!user.estado ? Routes.VERIFY_OTP : Routes.HOME);
      }
      loading.value = false;
    } catch (e) {
      loading.value = false;
      print(e);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
