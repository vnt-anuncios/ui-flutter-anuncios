import 'package:anuncios_ui/app/data/models/user.dart';
import 'package:anuncios_ui/app/data/services/local/local_user_auth_service.dart';
import 'package:get/get.dart';

class MainDrawerController extends GetxController {
  final LocalUserAuthService _localUserAuth = Get.find<LocalUserAuthService>();
  User? user;
  MainDrawerController();

  @override
  void onInit() {
    // TODO: implement onInit
    getUser();
    super.onInit();
  }

  getUser() async {
    user = await _localUserAuth.getUser();
    update(["drawerheader"]);
  }
}
