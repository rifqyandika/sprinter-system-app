// lib/main.dart

import 'package:flutter/material.dart';
import './pages/home_screens.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sprinter System',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 212, 15, 15),
        scaffoldBackgroundColor: Colors.grey[100],
        fontFamily: 'Poppins',
      ),
      home: const HomePage(), // Atur HomePage sebagai halaman awal
    );
  }
}
