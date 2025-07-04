import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import '../services/storage_service.dart';
import '../models/users_model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User? user;

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    final storedUser = await SecureStorageService.getUser();
    setState(() {
      user = storedUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color primary = AppColors.secondary;

    if (user == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          'Profil',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        backgroundColor: primary,
        foregroundColor: Colors.white,
        elevation: 5,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 55,
              backgroundImage: NetworkImage('https://i.pravatar.cc/230'),
            ),
            const SizedBox(height: 16),
            Text(
              user!.name,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              user!.email,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 24),

            // 💳 Kartu Info
            _buildCard('NIK', user!.nik),
            _buildCard('Kode', user!.code),
            _buildCard('Roles', user!.roles.join(', ')),

            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 100,
                ),
                backgroundColor: Colors.white,
                foregroundColor: AppColors.secondary,
              ),
              onPressed: () {
                // Laporan
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.report, size: 24),
                  SizedBox(width: 8),
                  Text('Laporkan', style: TextStyle(fontSize: 17)),
                ],
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 110,
                ),
                backgroundColor: AppColors.secondary,
                foregroundColor: Colors.white,
              ),
              onPressed: () async {
                await SecureStorageService.deleteCookie();
                await SecureStorageService.deleteUser();
                if (!context.mounted) return;
                Navigator.of(context).pushNamedAndRemoveUntil(
                  '/login',
                  (Route<dynamic> route) => false,
                );
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.logout, size: 24),
                  SizedBox(width: 8),
                  Text('Logout', style: TextStyle(fontSize: 17)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String label, String value) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: ListTile(
        leading: _getIcon(label),
        title: Text(
          label,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
        ),
        subtitle: Text(
          value,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Icon _getIcon(String key) {
    switch (key) {
      case 'NIK':
        return const Icon(Icons.badge, color: AppColors.secondary, size: 30);
      case 'Kode':
        return const Icon(
          Icons.location_city,
          color: AppColors.secondary,
          size: 30,
        );
      case 'Roles':
        return const Icon(Icons.work, color: AppColors.secondary, size: 30);
      default:
        return const Icon(Icons.info);
    }
  }
}
