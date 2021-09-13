import 'package:anuncios_ui/app/data/provider/local/local_auth.dart';
import 'package:anuncios_ui/app/data/provider/local/local_user_auth.dart';
import 'package:anuncios_ui/app/data/provider/remote/auth_api_provider.dart';
import 'package:anuncios_ui/app/data/provider/remote/google_sign_in.dart';
import 'package:anuncios_ui/app/data/provider/remote/user/user_provider.dart';
import 'package:anuncios_ui/app/data/provider/remote/verify_otp/otp_authentication-provider.dart';
import 'package:anuncios_ui/app/data/services/auth_api_service.dart';
import 'package:anuncios_ui/app/data/services/google_sign_in_service.dart';
import 'package:anuncios_ui/app/data/services/local/local_auth_service.dart';
import 'package:anuncios_ui/app/data/services/local/local_user_auth_service.dart';
import 'package:anuncios_ui/app/data/services/remoto/user/user_service.dart';
import 'package:anuncios_ui/app/data/services/remoto/verify_otp/otp_authenticaction_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class DependencyInjection {
  static void init() {
    Get.lazyPut<FirebaseAuth>(() => FirebaseAuth.instance);
    Get.put<FlutterSecureStorage>(FlutterSecureStorage());

    //phone Authentication
    Get.lazyPut<PhoneAuthentication>(
      () => PhoneAuthentication(),
    );
    Get.lazyPut<PhoneAuthenticationRepository>(
      () => PhoneAuthenticationRepository(),
    );

    //provider
    Get.put<AuthApiProvider>(AuthApiProvider());
    Get.put<GoogleSignInProvider>(GoogleSignInProvider());
    Get.put<LocalAuth>(LocalAuth());
    Get.put<LocalUserAuth>(LocalUserAuth());
    Get.put<UserProvider>(UserProvider());

    //service o repository
    Get.put<AuthApiService>(AuthApiService());
    Get.put<GoogleSignInService>(GoogleSignInService());
    Get.put<LocalAuthService>(LocalAuthService());
    Get.put<LocalUserAuthService>(LocalUserAuthService());
    Get.put<UserService>(UserService());
  }
}
