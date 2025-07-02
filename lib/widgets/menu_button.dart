// lib/widgets/app_drawer.dart

import 'package:flutter/material.dart';
import '../services/storage_service.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(color: Color.fromARGB(255, 212, 15, 15)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // SizedBox(height: 10),
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/images/user.png'),
                ),
                SizedBox(height: 10),
                Text(
                  'Ridwan',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: "Poppins",
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            onTap: () {
              // Menutup drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.person_outline),
            title: const Text('Profile'),
            onTap: () {
              // Menutup drawer
              Navigator.pop(context);
              // Contoh: Navigator.pushNamed(context, '/profile');
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const Text('Pengaturan'),
            onTap: () {
              // Menutup drawer
              Navigator.pop(context);
              // Contoh: Navigator.pushNamed(context, '/settings');
            },
          ),
          const Divider(), // Garis pemisah
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () async {
              final currentContext = context;
              await SecureStorageService.deleteCookie();
              // final hasCookie = await SecureStorageService.hasCookie();
              if (!currentContext.mounted) return;
              Navigator.of(context).pushNamedAndRemoveUntil(
                '/login',
                (Route<dynamic> route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
