import 'package:flutter/material.dart';
import 'package:fooody/main.dart';


class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Menambahkan clickable menu
          ListTile(
            title: const Text('Home'),
            onTap: () {
              // Route menu ke halaman utama
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const MyHomePage(title: 'Foody Homepage')),
              );
            },
          ),
          ListTile(
            title: const Text('Artikel'),
            onTap: () {
              // Route menu ke halaman tambah budget
              
            },
          ),
          ListTile(
            title: const Text('Quiz'),
            onTap: () {
              // Route menu ke halaman data budget
            },
          ),
          ListTile(
            title: const Text('Expiry Tracker'),
            onTap: () {
              // Route menu ke halaman data budget
            },
          ),
          ListTile(
            title: const Text('Foody Diary'),
            onTap: () {
              // Route menu ke halaman data budget
            },
          ),
          ListTile(
            title: const Text('Org Info'),
            onTap: () {
              // Route menu ke halaman data budget
            },
          ),
          ListTile(
            title: const Text('Send Foodwaste'),
            onTap: () {
              // Route menu ke halaman data budget
            },
          ),
        ],
      ),
    );
  }
}