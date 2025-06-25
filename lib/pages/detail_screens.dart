// lib/pages/detail_page.dart

import 'package:flutter/material.dart';
import '../models/sprinter_model.dart'; // Import model

class DetailPage extends StatelessWidget {
  final Sprinter sprinter;

  const DetailPage({super.key, required this.sprinter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          sprinter.seller_name,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: "Poppins",
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 212, 15, 15),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withAlpha(50),
                spreadRadius: 2,
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min, // Membuat Column seukuran kontennya
            children: [
              Text(
                ' ${sprinter.seller_name}',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              _buildDetailRow(
                Icons.person,
                'Nama Sprinter',
                sprinter.seller_name,
              ),
              const Divider(height: 20),
              _buildDetailRow(
                Icons.timer_rounded,
                'Tanggal/Jam',
                sprinter.seller_name,
              ),
              const Divider(height: 20),
              _buildDetailRow(Icons.info_outline, 'Package', "123 Package"),
            ],
          ),
        ),
      ),
    );
  }

  // Widget helper untuk membuat baris detail
  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: const Color.fromARGB(255, 212, 15, 15), size: 24),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(color: Colors.grey[600], fontSize: 14),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
