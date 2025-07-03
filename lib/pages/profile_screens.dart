import 'package:flutter/material.dart';
import '../core/app_colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Color primary = AppColors.secondary;
    final profileInfo = {
      'Nama Lengkap': 'Edi Cahyono',
      'Email': 'ce_blue69@yahoo.com',
      'NIK': 'JM0150001',
      'Kode Lokasi': 'MLG01',
      'Jabatan': 'Sprinter',
    };

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          'Profil',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        backgroundColor: primary,
        foregroundColor: Colors.white,
        elevation: 0,
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
              profileInfo['Nama Lengkap']!,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              profileInfo['Email']!,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 24),

            // 💳 Kartu Info
            ...profileInfo.entries
                .skip(2)
                .map(
                  (entry) => Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 2,
                    child: ListTile(
                      leading: _getIcon(entry.key),
                      title: Text(
                        entry.key,
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      subtitle: Text(
                        entry.value,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }

  Icon _getIcon(String key) {
    switch (key) {
      case 'NIK':
        return const Icon(Icons.badge, color: AppColors.secondary, size: 30);
      case 'Kode Lokasi':
        return const Icon(
          Icons.location_city,
          color: AppColors.secondary,
          size: 30,
        );
      case 'Jabatan':
        return const Icon(Icons.work, color: AppColors.secondary, size: 30);
      default:
        return const Icon(Icons.info);
    }
  }
}
