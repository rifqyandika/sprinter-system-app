// lib/pages/home_page.dart

import 'package:flutter/material.dart';
import '../models/sprinter_model.dart';
import '../services/sprinter_service.dart';
import './detail_screens.dart';
import '../helpers/date_formater.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Sprinter>> futureSprinter;
  final SprinterService _sprinterService = SprinterService();

  @override
  void initState() {
    super.initState();
    futureSprinter = _sprinterService.fetchSprinter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SPRINTER SYSTEM',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: "Poppins",
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white, size: 30),
            onPressed: () {},
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 212, 15, 15),
      ),
      body: Center(
        child: FutureBuilder<List<Sprinter>>(
          future: futureSprinter,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              // Menampilkan error dengan lebih jelas
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Terjadi Kesalahan:\n${snapshot.error}',
                  textAlign: TextAlign.center,
                ),
              );
            } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              // PERBAIKAN: Mengambil list dari snapshot.data!
              final sprinters = snapshot.data!;
              return ListView.builder(
                itemCount: sprinters.length,
                itemBuilder: (context, index) {
                  // PERBAIKAN KRITIS: Mengambil satu item dari list 'sprinters'
                  final sprinter = sprinters[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 8.0,
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12.0),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            // Pastikan DetailPage menerima objek Sprinter
                            builder: (context) =>
                                DetailPage(sprinter: sprinter),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withAlpha(25),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 255, 59, 59),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: const Icon(
                                Icons.storefront,
                                size: 35.0,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 16.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    sprinter.seller_name,
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 4.0),
                                  Text(
                                    dateFormater(sprinter.created_at),
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.grey[600],
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Text('Tidak ada data sprinter yang ditemukan.');
            }
          },
        ),
      ),
    );
  }
}
