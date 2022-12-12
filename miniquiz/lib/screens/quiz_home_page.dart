// ignore_for_file: unused_import, depend_on_referenced_packages, duplicate_ignore, camel_case_types

import 'package:flutter/material.dart';
import 'package:fooody/screens/login.dart';
import 'package:fooody/common/cookie_request.dart';
import 'package:fooody/widgets/drawer.dart';
import 'package:miniquiz/screens/asessment_page.dart';
import 'package:miniquiz/screens/quiz_question_page.dart';
// ignore: unused_import
import 'package:miniquiz/screens/quiz_result_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:provider/provider.dart';

class QuizHomePage extends StatefulWidget {
  const QuizHomePage({Key? key}) : super(key: key);

  @override
  State<QuizHomePage> createState() => _Quiz_HomePageState();
}

class _Quiz_HomePageState extends State<QuizHomePage> {
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Food Waste Awareness Mini Quiz",
          style: TextStyle(fontFamily: 'Poppins'),
        ),
      ),
      drawer: const AppDrawer(),
      body: request.loggedIn
          ? ListView(
              children: <Widget>[
                Column(
                  children: const [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 23.0, vertical: 9.0),
                      child: Text(
                        'Ready to begin?',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 25,
                            color: Color(0xFFFEA150),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: const [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 23.0, vertical: 9.0),
                      child: Text(
                        'Number of questions: 6',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: const [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 23.0, vertical: 9.0),
                      child: Text(
                        'Score to pass: 30',
                        style: TextStyle(fontFamily: 'Poppins', fontSize: 14),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: const [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 23.0, vertical: 9.0),
                      child: Text(
                        'Time limit: 4 minutes',
                        style: TextStyle(fontFamily: 'Poppins', fontSize: 14),
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xFFFEA150)),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AssessmentPage("", 1)),
                      );
                    },
                    child: const Text(
                      "Start",
                      style: TextStyle(fontSize: 16),
                    )),
              ],
            )
          : Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    "Please login to view the Quiz",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                      );
                    },
                    child: const Text(
                      "Login here!",
                      style: TextStyle(fontSize: 16),
                    ))
              ],
            )),
    );
  }
}
