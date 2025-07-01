import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

Future<void> loginAuth(
  BuildContext context,
  String email,
  String password,
) async {
  final apiBase = Uri.parse("https://trans-gamma.vercel.app/api/auth/login");
  try {
    final response = await http.post(
      apiBase,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final setCookie = response.headers['set-cookie'];
      if (setCookie != null) {
        final cookieSet = setCookie.split(';').first;
        final dataSet = data['user']['name'];
        ScaffoldMessenger.of(
          // ignore: use_build_context_synchronously
          context,
        ).showSnackBar(SnackBar(content: Text('$dataSet $cookieSet')));
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
