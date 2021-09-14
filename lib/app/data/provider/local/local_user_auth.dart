import 'dart:convert';

import 'package:anuncios_ui/app/data/models/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class LocalUserAuth {
  static const KEY = "user";
  final FlutterSecureStorage _storage = Get.find<FlutterSecureStorage>();

  Future<void> setUser(User user) async {
    await _storage.write(key: KEY, value: jsonEncode(user.toJson()));
  }

  Future<void> clearUser() async {
    await _storage.delete(key: KEY);
  }

  Future<User?> getUser() async {
    final String? data = await _storage.read(key: KEY);
    if (data != null) {
      final User user = User.fromJson(jsonDecode(data));
      return user;
    }
    return null;
  }
}
