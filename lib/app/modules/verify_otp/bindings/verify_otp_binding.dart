import 'package:anuncios_ui/app/data/provider/remote/user/user_provider.dart';
import 'package:anuncios_ui/app/data/services/remoto/user/user_service.dart';
import 'package:get/get.dart';

import '../controllers/verify_otp_controller.dart';

class VerifyOtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserProvider>(
      () => UserProvider(),
    );
    Get.lazyPut<UserService>(() => UserService());
    Get.lazyPut<VerifyOtpController>(
      () => VerifyOtpController(),
    );
  }
}
