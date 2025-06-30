// lib/widgets/app_drawer.dart

import 'package:flutter/material.dart';

// ignore: camel_case_types
class search_button extends StatelessWidget {
  const search_button({super.key});
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.search),
      onPressed: () {
        // print("getsearch button");
        search_input();
        // Add your search logic here
      },
    );
  }
}

// ignore: camel_case_types
class search_input extends StatelessWidget {
  const search_input({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('input search')));
  }
}
