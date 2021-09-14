import 'package:anuncios_ui/app/data/provider/local/local_auth.dart';
import 'package:get/get.dart';

class LocalAuthService {
  final LocalAuth _localAuth = Get.find<LocalAuth>();

  Future<String?> getSession() => _localAuth.getSession();
  setSession(String token) => _localAuth.setSession(token);
  clearSession() => _localAuth.clearSession();
}
