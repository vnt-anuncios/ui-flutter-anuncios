import 'package:anuncios_ui/app/data/models/user.dart';
import 'package:anuncios_ui/app/data/provider/remote/user/user_provider.dart';
import 'package:get/get.dart';

class UserService {
  final UserProvider _userProvider = Get.find<UserProvider>();
  Future<User?> saveTelefono(int id, String numero, String token) {
    return _userProvider.saveTelefono(id, numero, token);
  }

  Future<User?> updateUser(String name, String? apellido, String? date,
      String? ubicacion, String token) {
    return _userProvider.updateUser(name, apellido, date, ubicacion, token);
  }
}
