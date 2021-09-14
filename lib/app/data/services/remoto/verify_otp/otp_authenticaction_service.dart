import 'package:anuncios_ui/app/data/provider/remote/verify_otp/otp_authentication-provider.dart';
import 'package:get/get.dart';

class PhoneAuthenticationRepository {
  final _phoneAuthentication = Get.find<PhoneAuthentication>();

  void addPhoneListener(PhoneAuthenticationMixin _mixin) {
    _phoneAuthentication.addListener(_mixin);
  }

  Future<void> verifyPhoneNumber(String phoneNumber, {int? resendToken}) {
    return _phoneAuthentication.verifyPhoneNumber(
      phoneNumber,
      resentToken: resendToken,
    );
  }

  void verifySmsCode({String? verificacionId, String? smsCode}) {
    _phoneAuthentication.verifySmsCode(
      verificacionId: verificacionId,
      smsCode: smsCode,
    );
  }
}
