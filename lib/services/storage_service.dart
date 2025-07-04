import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../models/users_model.dart';

class SecureStorageService {
  static const _storage = FlutterSecureStorage();

  static const _cookieKey = 'Cookie';
  static const _userKey = 'UserData';

  // ---------------- Cookie ----------------
  static Future<void> saveCookie(String cookie) async {
    await _storage.write(key: _cookieKey, value: cookie);
  }

  static Future<String?> getCookie() async {
    return await _storage.read(key: _cookieKey);
  }

  static Future<void> deleteCookie() async {
    await _storage.delete(key: _cookieKey);
  }

  static Future<bool> hasCookie() async {
    final token = await _storage.read(key: _cookieKey);
    return token != null && token.isNotEmpty;
  }

  // ---------------- User Data ----------------
  static Future<void> saveUser(User user) async {
    final jsonStr = jsonEncode({
      'email': user.email,
      'nik': user.nik,
      'code': user.code,
      'name': user.name,
      'roles': user.roles,
    });
    await _storage.write(key: _userKey, value: jsonStr);
  }

  static Future<User?> getUser() async {
    final jsonStr = await _storage.read(key: _userKey);
    if (jsonStr == null) return null;

    final Map<String, dynamic> jsonMap = jsonDecode(jsonStr);
    return User.fromJson(jsonMap);
  }

  static Future<void> deleteUser() async {
    await _storage.delete(key: _userKey);
  }

  // ---------------- Clear All ----------------
  static Future<void> clearAll() async {
    await _storage.deleteAll();
  }
}
