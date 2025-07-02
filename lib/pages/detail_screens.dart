// lib/pages/detail_page.dart

import 'package:flutter/material.dart';
import '../models/transactions_model.dart';
import '../helpers/date_formater.dart';
import '../widgets/build_detail_row.dart';
import '../core/app_colors.dart';

class DetailPage extends StatelessWidget {
  final Sprinter sprinter;

  const DetailPage({super.key, required this.sprinter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail ${sprinter.sellerName}",
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: "Poppins",
            fontSize: 20,
          ),
        ),
        backgroundColor: AppColors.secondary,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20.0),
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
              build_detail_row(Icons.store, 'Nama Seller', sprinter.sellerName),
              const Divider(height: 20),
              build_detail_row(Icons.info_rounded, 'Code', sprinter.code),
              const Divider(height: 20),
              build_detail_row(Icons.person, 'Sprinter', sprinter.sprinterName),
              const Divider(height: 20),
              build_detail_row(
                Icons.access_time_filled_outlined,
                'Tanggal / Jam',
                '${dateFormater(sprinter.createdAt)} / ${timeFormater(sprinter.createdAt)}',
              ),
              const Divider(height: 20),
              build_detail_row(
                Icons.indeterminate_check_box,
                'Package',
                "${sprinter.packageNumber} Package",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
