// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:fooody/common/cookie_request.dart';

import 'package:fooody/screens/homepage.dart';
import 'package:fooody/screens/login.dart';
import 'package:fooody/screens/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static Map<int, Color> colorTheme = {
    // 0xFF9966
    50: const Color.fromRGBO(254, 161, 80, .8),
    100: const Color.fromRGBO(254, 161, 80, .8),
    200: const Color.fromRGBO(254, 161, 80, .8),
    300: const Color.fromRGBO(254, 161, 80, .8),
    400: const Color.fromRGBO(254, 161, 80, .8),
    500: const Color.fromRGBO(254, 161, 80, .8),
    600: const Color.fromRGBO(254, 161, 80, .8),
    700: const Color.fromRGBO(254, 161, 80, .8),
    800: const Color.fromRGBO(254, 161, 80, .9),
    900: const Color.fromARGB(255, 253, 172, 102),
  };
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();

        return request;
      },
      child: MaterialApp(
          title: 'fooody',
          theme:
              ThemeData(primarySwatch: MaterialColor(0xFFFEA150, colorTheme)),
          home: HomePage(),
          onGenerateRoute: (RouteSettings settings) {
            switch (settings.name) {
              case HomePage.routeName:
                return MaterialPageRoute(builder: (_) => const HomePage());
          
              case SignUp.routeName:
                return MaterialPageRoute(builder: (_) => const SignUp());
              
              case LoginScreen.routeName:
                return MaterialPageRoute(builder: (_) => const LoginScreen());
            }
            return null;
          }),
    );
  }
}
