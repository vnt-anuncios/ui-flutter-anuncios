import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class LocalAuth {
  static const KEY = "sesion";
  final FlutterSecureStorage _storage = Get.find<FlutterSecureStorage>();

  Future<void> setSession(String requestToken) async {
    await _storage.write(key: KEY, value: jsonEncode(requestToken));
  }

  Future<void> clearSession() async {
    await _storage.delete(key: KEY);
  }

  Future<String?> getSession() async {
    String? data = await _storage.read(key: KEY);
    if (data != null) {
      return jsonDecode(data);
    }
    return null;
  }
}
