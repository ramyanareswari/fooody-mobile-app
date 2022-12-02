// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:fooody/widgets/drawer.dart';
import 'package:expiry/models/food_data.dart';
import 'package:expiry/screens/expiry_add.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ExpiryHomePage extends StatefulWidget {
  const ExpiryHomePage({Key? key}) : super(key: key);

  @override
  State<ExpiryHomePage> createState() => _Expiry_HomePageState();
}

class _Expiry_HomePageState extends State<ExpiryHomePage> {
  final _formKey = GlobalKey<FormState>();
  String food_name = "";
  // ? : Mark late
  DateTime? food_expired_date;

  Future<List<FoodData>> fetchFoodData() async {
    var url = Uri.parse('https://fooodybuddy.up.railway.app/expiry/json/');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object ToDo
    List<FoodData> listFoodData = [];
    for (var d in data) {
      if (d != null) {
        listFoodData.add(FoodData.fromJson(d));
      }
    }

    return listFoodData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Expiry Home Page"),
        ),
        drawer: const AppDrawer(),
        // TODO: Use fetch and fix the widgets
        body: Center(
          child: Text(
            "No Food Obtained.. :(",
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 35),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            textDirection: TextDirection.rtl,
            children: [
              FloatingActionButton(
                backgroundColor: const Color(0xFFFEA150),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ExpiryAddPage()),
                  );
                },
                tooltip: 'Add Food Note',
                child: const Icon(Icons.add),
              ),
              FloatingActionButton(
                backgroundColor: const Color(0xFFFEA150),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Wrap(
                        children: [
                          Center(
                            child: Column(
                              children: [
                                Text(
                                  "General Guidance",
                                  style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic),
                                ),
                                Text(
                                  "These are the examples if your food doesn't have an expiration date",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "3 years - Canned food and peanut butter",
                                  style: TextStyle(fontSize: 15),
                                ),
                                Text(
                                  "1 year - Sauces, condiments, dry foods, baking items, cereals, and snacks",
                                  style: TextStyle(fontSize: 15),
                                ),
                                Text(
                                  "6 months - Drinks, snacks, and chocolate candy",
                                  style: TextStyle(fontSize: 15),
                                ),
                                Text(
                                  "3 months - Cookies, mayonnaise, and tortillas",
                                  style: TextStyle(fontSize: 15),
                                ),
                                Text(
                                  "Others - Use expiration date",
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                tooltip: 'Guide',
                child: const Icon(Icons.question_mark),
              ),
            ],
          ),
        ));
  }
}
