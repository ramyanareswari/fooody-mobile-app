import 'package:flutter/material.dart';

// ========== features homepage ==========
import 'package:fooody/screens/homepage.dart';
import 'package:diary/screens/diary_home_page.dart';
import 'package:expiry/screens/expiry_home_page.dart';
import 'package:miniquiz/screens/quiz_home_page.dart';
import 'package:organization/screens/org_home_page.dart';
import 'package:send_foodwaste/screens/send_foodwaste.dart';
import 'package:tips/screens/tips_home_page.dart';
import 'package:fooody/screens/login.dart';


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
                    builder: (context) => const HomePage()),
              );
            },
          ),
          ListTile(
            title: const Text('Artikel'),
            onTap: () {
              // Route menu ke halaman tambah budget
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const TipsHomePage()),
              );
              
            },
          ),
          ListTile(
            title: const Text('Quiz'),
            onTap: () {
              // Route menu ke halaman data budget
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const QuizHomePage()),
              );
            },
          ),
          ListTile(
            title: const Text('Expiry Tracker'),
            onTap: () {
              // Route menu ke halaman data budget
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const ExpiryHomePage()),
              );
            },
          ),
          ListTile(
            title: const Text('Foody Diary'),
            onTap: () {
              // Route menu ke halaman data budget
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const DiaryHomePage()),
              );
            },
          ),
          ListTile(
            title: const Text('Org Info'),
            onTap: () {
              // Route menu ke halaman data budget
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const OrganizationHomePage()),
              );
            },
          ),
          ListTile(
            title: const Text('Send Foodwaste'),
            onTap: () {
              // Route menu ke halaman data budget
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const SendFoodHomePage()),
              );
            },
          ),
          ListTile(
            title: const Text('Login'),
            onTap: () {
              // Route menu ke halaman login
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const LoginScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}