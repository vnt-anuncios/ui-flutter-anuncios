import 'package:anuncios_ui/app/data/provider/remote/google_sign_in.dart';
import 'package:get/get.dart';

class GoogleSignInService {
  final GoogleSignInProvider _googleSignInProvider =
      Get.find<GoogleSignInProvider>();

  GoogleSignInService();

  googleSignIn() {
    return _googleSignInProvider.signInWithGoogle();
  }

  googleSignOut() {
    return _googleSignInProvider.googleSignOut();
  }
}
