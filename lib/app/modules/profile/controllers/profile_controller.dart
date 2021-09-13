import 'package:anuncios_ui/app/data/models/user.dart';
import 'package:anuncios_ui/app/data/services/local/local_auth_service.dart';
import 'package:anuncios_ui/app/data/services/local/local_user_auth_service.dart';
import 'package:anuncios_ui/app/data/services/remoto/user/user_service.dart';
import 'package:anuncios_ui/app/global/main_drawer/main_drawer_controller.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  //injection de dependencia
  final LocalUserAuthService _localUserAuth = Get.find<LocalUserAuthService>();
  final UserService _userService = Get.find<UserService>();
  //injection de dependencia
  User? _user;
  User? get user => _user;
  //loading
  RxBool _loading = false.obs;
  bool get loading => _loading.value;
  //
  late String nombre;
  late String? apellido;
  late String? ubicacion;
  late String? fecha_nacimiento;

  ProfileController();

  @override
  void onInit() {
    getUser();
    super.onInit();
  }

  getUser() async {
    _loading.value = true;
    _user = await _localUserAuth.getUser();
    _loading.value = false;
    loadData();
  }

  loadData() {
    if (_user != null) {
      nombre = _user!.name;
      apellido = _user!.apellido ?? "";
      ubicacion = _user!.ubicacion ?? "";
      fecha_nacimiento = _user!.fecha_nacimiento != null
          ? _user!.fecha_nacimiento!.toIso8601String().split('T').first
          : "";
    } else {
      nombre = "";
      apellido;
      ubicacion;
      fecha_nacimiento;
    }
  }

  onChangeNombre(String name) {
    nombre = name;
    print(nombre);
  }

  onChangeApellido(String lastName) {
    apellido = lastName;
  }

  onChangeFechaNacimiento(String date) {
    fecha_nacimiento = date;
  }

  onChangeUbicacion(String location) {
    ubicacion = location;
  }

  onSave() {
    authUserSave();
  }

  authUserSave() async {
    try {
      _loading.value = true;
      String? token = await Get.find<LocalAuthService>().getSession();
      if (token != null) {
        User? newUser = await _userService.updateUser(
            nombre, apellido, fecha_nacimiento, ubicacion, token);
        if (newUser != null) {
          await _localUserAuth.clearUser();
          await _localUserAuth.setUser(newUser);
          getUser();
          await Get.find<MainDrawerController>().getUser();
        }
        _loading.value = false;
      }
      _loading.value = false;
    } catch (e) {
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
