// lib/widgets/app_drawer.dart

import 'package:flutter/material.dart';

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
            child: Text(
              'Username',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontFamily: "Poppins",
              ),
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
              // TODO: Arahkan ke halaman Profile
              // Contoh: Navigator.pushNamed(context, '/profile');
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const Text('Pengaturan'),
            onTap: () {
              // Menutup drawer
              Navigator.pop(context);
              // TODO: Arahkan ke halaman Pengaturan
              // Contoh: Navigator.pushNamed(context, '/settings');
            },
          ),
          const Divider(), // Garis pemisah
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              // Menutup drawer
              Navigator.pop(context);
              // TODO: Implementasikan logika logout
              // Contoh: Arahkan ke halaman login dan hapus riwayat navigasi
              // Navigator.of(context).pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
            },
          ),
        ],
      ),
    );
  }
}
