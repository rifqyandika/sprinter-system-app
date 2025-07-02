import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  static const _storage = FlutterSecureStorage();
  static const _cookie = 'Cookie';

  // Menyimpan token
  static Future<void> saveCookie(String cookie) async {
    await _storage.write(key: _cookie, value: cookie);
  }

  // Mengambil token
  static Future<String?> getCookie() async {
    return await _storage.read(key: _cookie);
  }

  // Menghapus token
  static Future<void> deleteCookie() async {
    await _storage.delete(key: _cookie);
  }

  // Cek token
  static Future<bool> hasCookie() async {
    final token = await _storage.read(key: _cookie);
    return token != null && token.isEmpty;
  }
}

void checkCookie() async {
  final token = await SecureStorageService.getCookie();
  if (token != null) {
    // print('Token ditemukan');
  } else {
    return;
  }
}
