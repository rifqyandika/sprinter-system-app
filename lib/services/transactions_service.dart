// filepath: [sprinter_service.dart](http://_vscodecontentref_/0)
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/transactions_model.dart';

class SprinterService {
  final String _baseUrl =
      'https://trans-gamma.vercel.app/api/mobile/transactions'; // Ganti dengan endpoint API kamu
  final String _apiKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRqa2hpc2RmdXRweGx5d2ZpbmlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDk3OTY1MzcsImV4cCI6MjA2NTM3MjUzN30.a45dEtAVAyLSszkfDOB4dXpmWkLdFGM9a2zMEADbL2c'; // Ganti dengan API key kamu
  final String _bearerToken =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRqa2hpc2RmdXRweGx5d2ZpbmlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDk3OTY1MzcsImV4cCI6MjA2NTM3MjUzN30.a45dEtAVAyLSszkfDOB4dXpmWkLdFGM9a2zMEADbL2c  '; // Ganti dengan Bearer token kamu

  Future<List<Sprinter>> fetchSprinter() async {
    final response = await http.get(
      Uri.parse(_baseUrl),
      headers: {
        'apikey': _apiKey,
        'Authorization': 'Bearer $_bearerToken',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((user) => Sprinter.fromJson(user)).toList();
    } else {
      throw Exception('Gagal memuat data sprinter');
    }
  }
}
