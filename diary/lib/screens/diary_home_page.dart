// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:fooody/widgets/drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:diary/model/diary_model.dart';

class DiaryHomePage extends StatefulWidget {
  const DiaryHomePage({Key? key}) : super(key: key);

  @override
  State<DiaryHomePage> createState() => _Diary_HomePageState();
}

class _Diary_HomePageState extends State<DiaryHomePage> {
  Future<List<Diary>> fetchDiary() async {
    var url = Uri.parse('https://fooodybuddy.up.railway.app/diary/get_json/');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );

    var data = jsonDecode(utf8.decode(response.bodyBytes));

    List<Diary> listDiary = [];
    for (var d in data) {
      if (d != null) {
        listDiary.add(Diary.fromJson(d["fields"]));
      }
    }

    return listDiary;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Diary Home Page",
        style: TextStyle(fontFamily: 'Poppins'),),
      ),
      drawer: const AppDrawer(),
      body: FutureBuilder(
        future: fetchDiary(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return Column(
                children: const [
                  Text("No entry yet :(",
                  style: TextStyle(color: Colors.black, fontSize: 20 ),),
                  SizedBox(height: 8),
                ],
                );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => Container(
                margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15.0),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black, blurRadius: 2.0)
                                ]),
                            child: ListTile(
                                title: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${snapshot.data![index].title}",
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                )
                ));
            }
          }
        }));
  }
}
