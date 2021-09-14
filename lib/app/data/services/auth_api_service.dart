import 'package:anuncios_ui/app/data/provider/remote/auth_api_provider.dart';
import 'package:device_info/device_info.dart';
import 'package:get/get.dart';

class AuthApiService {
  final AuthApiProvider _authApiProvider = Get.find<AuthApiProvider>();

  AuthApiService();

  requestTokenGoogle(String token, AndroidDeviceInfo info) {
    return _authApiProvider.requestTokenGoogle(token, info);
  }

  logout(String token) {
    return _authApiProvider.logout(token);
  }
}
