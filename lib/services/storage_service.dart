import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  static const _storage = FlutterSecureStorage();
  static const _cookie = 'Cookie';

  // Menyimpam token
  static Future<void> saveToken(String token) async {
    await _storage.write(key: _cookie, value: token);
  }

  // Mengambil token
  static Future<String?> getToken() async {
    return await _storage.read(key: _cookie);
  }

  // Menghapus token
  static Future<void> deleteToken() async {
    await _storage.delete(key: _cookie);
  }

  // Cek token
  static Future<bool> hasToken() async {
    final token = await _storage.read(key: _cookie);
    return token != null && token.isEmpty;
  }
}

void checkToken() async {
  final token = await SecureStorageService.getToken();
  if (token != null) {
    // print('Token ditemukan');
  } else {
    // print('Token tidak ditemukan');
  }
}
