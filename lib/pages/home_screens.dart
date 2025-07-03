// lib/pages/home_page.dart

import 'package:flutter/material.dart';
import '../models/transactions_model.dart';
import '../services/transactions_service.dart';
import './detail_screens.dart';
import '../helpers/date_formater.dart';
import '../widgets/menu_button.dart';
import '../core/app_colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final SprinterService _sprinterService = SprinterService();
  final TextEditingController _searchController = TextEditingController();
  // final UsersService _usersService = UsersService();

  List<Sprinter> allSprinters = [];
  List<Sprinter> filteredSprinters = [];

  bool isSearching = false;
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    fetchData();
    _searchController.addListener(() {
      _onSearchChanged(_searchController.text);
    });
  }

  Future<void> fetchData() async {
    try {
      final data = await _sprinterService.fetchSprinter();
      setState(() {
        allSprinters = data;
        filteredSprinters = data;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
        isLoading = false;
      });
    }
  }

  void toggleSearch() {
    setState(() {
      if (isSearching) {
        _searchController.clear();
        filteredSprinters = allSprinters;
      }
      isSearching = !isSearching;
    });
  }

  void _onSearchChanged(String query) {
    setState(() {
      filteredSprinters = allSprinters
          .where(
            (sprinter) =>
                sprinter.sellerName.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      title: isSearching
          ? TextField(
              controller: _searchController,
              autofocus: true,
              decoration: const InputDecoration(
                hintText: 'Cari seller...',
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.white, fontSize: 18),
              ),
              style: const TextStyle(color: Colors.white),
            )
          : const Text(
              'SPRINTER SYSTEM',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
      actions: [
        IconButton(
          icon: Icon(isSearching ? Icons.close : Icons.search),
          onPressed: toggleSearch,
        ),
      ],
      backgroundColor: AppColors.secondary,
      foregroundColor: Colors.white,
    );

    return Scaffold(
      appBar: appBar,
      drawer: const MenuButton(),
      body: isLoading
          ? Center(
              child: LoadingAnimationWidget.progressiveDots(
                color: AppColors.secondary,
                size: 45,
              ),
            )
          : errorMessage != null
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Terjadi Kesalahan:\n$errorMessage',
                  textAlign: TextAlign.center,
                ),
              ),
            )
          : filteredSprinters.isEmpty
          ? const Center(child: Text('Tidak ada data seller yang ditemukan.'))
          : ListView.builder(
              itemCount: filteredSprinters.length,
              itemBuilder: (context, index) {
                final sprinter = filteredSprinters[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15.0,
                    vertical: 8.0,
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12.0),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(sprinter: sprinter),
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
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: AppColors.secondary,
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
                                  sprinter.sellerName,
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 4.0),
                                Text(
                                  dateFormater(sprinter.createdAt),
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.grey[600],
                                    fontWeight: FontWeight.w500,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          const Icon(Icons.more_vert),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
