// lib/widgets/app_drawer.dart

import 'package:flutter/material.dart';
import '../core/app_colors.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(color: AppColors.secondary),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 8),
                CircleAvatar(
                  radius: 45,
                  backgroundImage: NetworkImage('https://i.pravatar.cc/230'),
                ),
                SizedBox(height: 10),
                Text(
                  'V.1.0.0',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontFamily: "Poppins",
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.home_outlined,
              size: 30,
              // color: AppColors.secondary,
            ),
            title: const Text(
              'Home',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/home');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.person_outline, size: 30),
            title: const Text(
              'Profile',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
          const Divider(),
        ],
      ),
    );
  }
}
