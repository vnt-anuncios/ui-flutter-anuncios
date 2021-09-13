import 'package:anuncios_ui/app/data/models/user.dart';
import 'package:anuncios_ui/app/data/provider/remote/verify_otp/otp_authentication-provider.dart';
import 'package:anuncios_ui/app/data/services/local/local_auth_service.dart';
import 'package:anuncios_ui/app/data/services/local/local_user_auth_service.dart';
import 'package:anuncios_ui/app/data/services/remoto/user/user_service.dart';
import 'package:anuncios_ui/app/data/services/remoto/verify_otp/otp_authenticaction_service.dart';
import 'package:anuncios_ui/app/modules/verify_otp/views/otp.dart';
import 'package:anuncios_ui/app/routes/app_pages.dart';
import 'package:anuncios_ui/app/utils/state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyOtpController extends GetxController with PhoneAuthenticationMixin {
  final _phoneAuthenticationRepository =
      Get.find<PhoneAuthenticationRepository>();
  final _authUserService = Get.find<LocalUserAuthService>();
  final _userService = Get.find<UserService>();

  RxBool mostrar = false.obs;
  String _number = "+591";
  String _prefix = "+591";
  String _verificationId = "";
  int _resendToken = 0;
  String _smsCode = "";
  get smsCode => _smsCode;

  final Rx<Status> _status = Rx(Status.none);
  Rx<Status> get status => _status;
  get prefix => _prefix;

  String _error = "";

  void showDialogError() {
    _status.value = Status.error;
    Get.dialog(
      Container(
        child: AlertDialog(
          title: Text("Tuvimos un problema"),
          content: Text(_error),
          actions: [
            FlatButton(
              onPressed: () => Get.back(),
              child: Text("ok"),
            ),
          ],
        ),
      ),
    );
  }

  void onNumberChanged(String text) {
    _number = "+591" + text;
    print(_number);
  }

  void onSmsCodeChanged(String text) {
    _smsCode = _smsCode + text;
    print(_smsCode);
  }

  void onSmsDeleteLast() {
    _smsCode = "";
    print(_smsCode);
  }

  Future<void> sendMeACode() async {
    _status.value = Status.wait;
    try {
      await _phoneAuthenticationRepository.verifyPhoneNumber(
        _number,
        resendToken: _resendToken,
      );
      Get.to(Otp());
    } catch (e) {
      _error = "Ingresa un número válido";
      showDialogError();
    }
  }

  void verifyCode() {
    _status.value = Status.wait;
    _phoneAuthenticationRepository.verifySmsCode(
      verificacionId: _verificationId,
      smsCode: _smsCode,
    );
  }

  @override
  void onInit() {
    super.onInit();
    _phoneAuthenticationRepository.addPhoneListener(this);
  }

  @override
  void onCodeAutoRetrievalTimeout(String? verificationId) {
    _verificationId = verificationId!;
  }

  @override
  void onCodeSent(String? verificationId, int? resendToken) {
    status.value = Status.none;
    _verificationId = verificationId!;
    _resendToken = resendToken!;
    mostrar.value = true;
  }

  @override
  void onVerificationCompleted(String? idToken) {
    status.value = Status.ok;
    // Get.offNamed(Routes.HOME);
    guardarLocal();
    print("Estamos bien llegamos a la verificacion completa");
  }

  guardarLocal() async {
    String? token = await Get.find<LocalAuthService>().getSession();
    User? user = await _authUserService.getUser();
    if (token != null) {
      User? newUser = await _userService.saveTelefono(user!.id, _number, token);
      if (newUser != null) {
        await _authUserService.clearUser();
        await _authUserService.setUser(newUser);
        Get.offNamed(Routes.HOME);
      }
    }
  }

  @override
  void onVerificationFailed(String? error) {
    print("$error");
    _error = error!;
    status.value = Status.error;
    showDialogError();
  }
}
