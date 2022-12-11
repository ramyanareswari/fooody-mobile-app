// ignore_for_file: use_build_context_synchronously

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

import 'package:provider/provider.dart';
import 'package:fooody/common/cookie_request.dart';


class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          // Menambahkan clickable menu
          ListTile(
            title: const Text('Home',
            style: TextStyle(
                    fontFamily: 'Poppins',),),
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
            title: const Text('Artikel',
            style: TextStyle(
                    fontFamily: 'Poppins',),),
            onTap: () {
              // Route menu ke halaman artikel
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const TipsHomePage()),
              );
              
            },
          ),
          ListTile(
            title: const Text('Quiz',
            style: TextStyle(
                    fontFamily: 'Poppins',),),
            onTap: () {
              // Route menu ke halaman quiz
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const QuizHomePage()),
              );
            },
          ),
          ListTile(
            title: const Text('Expiry Tracker',
            style: TextStyle(
                    fontFamily: 'Poppins',),),
            onTap: () {
              // Route menu ke halaman expiry
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const ExpiryHomePage()),
              );
            },
          ),
          ListTile(
            title: const Text('Foody Diary',
            style: TextStyle(
                    fontFamily: 'Poppins',),),
            onTap: () {
              // Route menu ke halaman diary
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const DiaryHomePage()),
              );
            },
          ),
          ListTile(
            title: const Text('Food Waste Organization',
            style: TextStyle(
                    fontFamily: 'Poppins',),),
            onTap: () {
              // Route menu ke halaman organization
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const OrganizationHomePage()),
              );
            },
          ),
          ListTile(
            title: const Text('Send Foodwaste',
            style: TextStyle(
                    fontFamily: 'Poppins',),),
            onTap: () {
              // Route menu ke halaman send foodwaste
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const SendFoodHomePage()),
              );
            },
          ),
          request.loggedIn
          ? (ListTile(
                  title: const Text('Logout',
                    style: TextStyle(
                    fontFamily: 'Poppins',),),
                  onTap: () async {
                    final response = await request.logout(
                        "https://fooodybuddy.up.railway.app/logoutflutter/");
                    if (response['status']) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Berhasil logout!"),
                      ));
                      Navigator.pushReplacementNamed(
                          context, HomePage.routeName);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Tidak berhasil logout :("),
                      ));
                    }
                  },
                ))
          : (ListTile(
            title: const Text('Login',
              style: TextStyle(
                    fontFamily: 'Poppins',),),
            onTap: () {
              // Route menu ke halaman login
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const LoginScreen()),
              );
            },
          )),
        ],
      ),
    );
  }
}