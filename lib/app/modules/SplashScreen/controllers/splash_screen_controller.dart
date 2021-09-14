import 'package:anuncios_ui/app/data/provider/local/local_auth.dart';
import 'package:anuncios_ui/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  final LocalAuth _localAuth = Get.find<LocalAuth>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    verifyLogin();
  }

  verifyLogin() async {
    final String? token = await _localAuth.getSession();
    if (token != null) {
      Get.offNamed(Routes.HOME);
    } else {
      Get.offNamed(Routes.LOGIN);
    }
  }

  void onClose() {}
}
