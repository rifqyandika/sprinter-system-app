// lib/main.dart

import 'package:flutter/material.dart';
import './pages/home_screens.dart';
import 'package:intl/date_symbol_data_local.dart';
import './core/app_colors.dart';

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
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.grey,
        fontFamily: 'Poppins',
      ),
      home: const HomePage(),
    );
  }
}
