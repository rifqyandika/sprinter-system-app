// filepath: [sprinter_service.dart](http://_vscodecontentref_/0)
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/transactions_model.dart';

class SprinterService {
  final String _baseUrl =
      'https://trans-gamma.vercel.app/api/mobile/transactions';
  final String _cookie =
      'accessToken=eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJjbWNpbDhoZ2owMDAwazIwNGQ0eDE3M3A4IiwiZW1haWwiOiJjZV9ibHVlNjlAeWFob28uY29tIiwicm9sZXMiOlsic3ByaW50ZXIiXSwiaWF0IjoxNzUxMjY3Mzc1LCJleHAiOjE3NTEzNTM3NzV9.AY_0NI4Smb1ktq0m03J6Rv3c7ZcGWHJQ7e3yoXxNMFs'; // Ganti dengan Bearer token kamu

  Future<List<Sprinter>> fetchSprinter() async {
    final response = await http.get(
      Uri.parse(_baseUrl),
      headers: {'Cookie': _cookie, 'Accept': 'application/json'},
    );

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((user) => Sprinter.fromJson(user)).toList();
    } else {
      throw Exception('Gagal memuat data sprinter');
    }
  }
}
