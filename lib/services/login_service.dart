import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../services/storage_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models/users_model.dart';

Future<void> loginAuth(
  BuildContext context,
  String email,
  String password,
) async {
  final apiBase = Uri.parse("${dotenv.env['API_KEY']}/api/auth/login");
  try {
    final response = await http.post(
      apiBase,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );
    if (response.statusCode == 200) {
      final setCookie = response.headers['set-cookie'];
      final Map<String, dynamic> setBody = jsonDecode(response.body);
      final Map<String, dynamic> userData = setBody['user'];
      final user = User.fromJson(userData);
      if (setCookie != null) {
        final cookieSet = setCookie.split(';').first;
        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, '/home');
        await SecureStorageService.saveCookie(cookieSet);
        await SecureStorageService.saveUser(user);
      }
    } else {
      final error = jsonDecode(response.body);
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error['message'] ?? 'Login gagal')),
      );
    }
  } catch (e) {
    ScaffoldMessenger.of(
      // ignore: use_build_context_synchronously
      context,
    ).showSnackBar(SnackBar(content: Text("Terjadi Kesalahan")));
  }
}
