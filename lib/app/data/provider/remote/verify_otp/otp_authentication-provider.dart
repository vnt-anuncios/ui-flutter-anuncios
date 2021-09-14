import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class PhoneAuthentication {
  final _auth = Get.find<FirebaseAuth>();

  //mixin investigar
  PhoneAuthenticationMixin? _mixin;
  addListener(PhoneAuthenticationMixin _mixin) {
    this._mixin = _mixin;
  }

  Future<void> verifyPhoneNumber(String phoneNumber, {int? resentToken}) {
    return _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: _onVerificationCompleted,
      verificationFailed: _onVerificationFailed,
      codeSent: _mixin!.onCodeSent,
      forceResendingToken: resentToken,
      codeAutoRetrievalTimeout: _mixin!.onCodeAutoRetrievalTimeout,
    );
  }

  void verifySmsCode({
    @required String? verificacionId,
    @required String? smsCode,
  }) {
    final credential = PhoneAuthProvider.credential(
      verificationId: verificacionId!,
      smsCode: smsCode!,
    );
    _onVerificationCompleted(credential);
  }

  void _onVerificationCompleted(PhoneAuthCredential credential) async {
    try {
      final userCredential = await _auth.signInWithCredential(credential);
      final idToken = await userCredential.user!.getIdToken();
      _mixin!.onVerificationCompleted(idToken);
    } on FirebaseAuthException catch (e) {
      _onVerificationFailed(e);
    }
  }

  void _onVerificationFailed(FirebaseAuthException e) {
    _mixin!.onVerificationFailed(e.code);
  }
}

mixin PhoneAuthenticationMixin {
  void onVerificationFailed(String? error);
  void onVerificationCompleted(String? idToken);
  void onCodeSent(String? verificationId, int? resendToken);
  void onCodeAutoRetrievalTimeout(String? verificationId);
}
