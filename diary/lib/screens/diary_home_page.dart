// ignore_for_file: camel_case_types, unused_import, depend_on_referenced_packages

import 'package:diary/screens/diary_form.dart';
import 'package:flutter/material.dart';
import 'package:fooody/widgets/drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:diary/model/diary_model.dart';
import 'package:provider/provider.dart';
import 'package:fooody/common/cookie_request.dart';
import 'package:fooody/screens/login.dart';

class DiaryHomePage extends StatefulWidget {
  const DiaryHomePage({Key? key}) : super(key: key);

  @override
  State<DiaryHomePage> createState() => _Diary_HomePageState();
}

class _Diary_HomePageState extends State<DiaryHomePage> {
  Future<List<Diary>> fetchDiary(CookieRequest request) async {
    var response = await request
        .get("https://fooodybuddy.up.railway.app/diary/json_flutter/");
    List<Diary> listDiary = [];
    for (var d in response) {
      if (d != null) {
        listDiary.add(Diary.fromJson(d));
      }
    }

    return listDiary;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          // ignore: prefer_const_constructors
          shape: Border(bottom: BorderSide(color: Colors.black, width: 0.5)),
          title: const Text(
            "Food Diary",
            style:
                TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold),
          ),
        ),
        drawer: const AppDrawer(),
        body:

                FutureBuilder(
                    future: fetchDiary(request),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.data == null) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        if (!snapshot.hasData) {
                          return Column(
                            children: const [
                              Text(
                                "No entry yet :(",
                                style: TextStyle(color: Colors.black, fontSize: 20),
                              ),
                              SizedBox(height: 8),
                            ],
                          );
                        } else {
                          return 
                          
                          ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (_, index) => Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 25),
                                    padding: const EdgeInsets.all(20.0),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border:
                                            Border.all(color: Colors.black, width: 0.5),
                                        borderRadius: BorderRadius.circular(5.0),
                                        boxShadow: const [
                                          BoxShadow(color: Colors.black, blurRadius: 0)
                                        ]),
                                    child: ListTile(
                                      title: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${snapshot.data![index].fields.foodname}",
                                            style: const TextStyle(
                                              fontSize: 24.0,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                          Text(
                                            "${snapshot.data![index].fields.date}",
                                            style: const TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.grey,
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            "${snapshot.data![index].fields.description}",
                                            style: const TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.black,
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            "Rp${snapshot.data![index].fields.price},00",
                                            style: const TextStyle(
                                              fontSize: 18.0,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ));
                        }
                      }
                    },
        ),

        floatingActionButton: Padding(
            padding: const EdgeInsets.only(left: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              textDirection: TextDirection.rtl,
              children: [
                if (request.loggedIn) ...[
                  FloatingActionButton(
                    backgroundColor: const Color(0xFFFEA150),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DiaryForm()),
                      );
                    },
                    tooltip: 'Add Log',
                    child: const Icon(Icons.add),
                  ),
                ],
              ],
            )));
  }
}
