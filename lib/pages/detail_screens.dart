// lib/pages/detail_page.dart

import 'package:flutter/material.dart';
import '../models/transactions_model.dart';
import '../helpers/date_formater.dart';
import '../widgets/buildDetailRow.dart';

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
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.store_mall_directory, size: 60),
                  Text(
                    ' ${sprinter.seller_name}',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              build_detail_row(
                Icons.person,
                'Nama Sprinter',
                sprinter.seller_name,
              ),
              const Divider(height: 20),
              build_detail_row(
                Icons.timer_rounded,
                'Tanggal / Jam',
                '${dateFormater(sprinter.created_at)} / ${timeFormater(sprinter.created_at)}',
              ),
              const Divider(height: 20),
              build_detail_row(
                Icons.info_outline,
                'Package',
                "${sprinter.package} Package",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
