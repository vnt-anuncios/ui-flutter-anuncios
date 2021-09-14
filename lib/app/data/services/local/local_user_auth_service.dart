import 'package:anuncios_ui/app/data/models/user.dart';
import 'package:anuncios_ui/app/data/provider/local/local_user_auth.dart';
import 'package:get/get.dart';

class LocalUserAuthService {
  final LocalUserAuth _localUserAuth = Get.find<LocalUserAuth>();

  Future<User?> getUser() => _localUserAuth.getUser();
  setUser(User user) => _localUserAuth.setUser(user);
  clearUser() => _localUserAuth.clearUser();
}
