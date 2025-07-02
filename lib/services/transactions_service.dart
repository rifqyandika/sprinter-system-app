// filepath: [sprinter_service.dart](http://_vscodecontentref_/0)
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/transactions_model.dart';
import './storage_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SprinterService {
  final String _baseUrl = '${dotenv.env['API_KEY']}/api/mobile/transactions';

  Future<List<Sprinter>> fetchSprinter() async {
    final String? cookie = await SecureStorageService.getCookie();
    final response = await http.get(
      Uri.parse(_baseUrl),
      headers: {'Cookie': cookie ?? '', 'Accept': 'application/json'},
    );

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((user) => Sprinter.fromJson(user)).toList();
    } else if (response.statusCode == 401) {
      throw ('Akses ditolak !!!.');
    } else {
      throw Exception('Gagal memuat data sprinter');
    }
  }
}
