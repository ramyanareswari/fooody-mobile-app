// ignore_for_file: camel_case_types, depend_on_referenced_packages, non_constant_identifier_names, unused_import, sort_child_properties_last, unused_field

import 'package:flutter/material.dart';
import 'package:fooody/widgets/drawer.dart';
import 'package:expiry/models/food_data.dart';
import 'package:expiry/screens/expiry_add.dart';
import 'dart:convert' as convert;
import 'package:fooody/screens/login.dart';
import 'package:provider/provider.dart';
import 'package:fooody/common/cookie_request.dart';

class ExpiryHomePage extends StatefulWidget {
  const ExpiryHomePage({Key? key}) : super(key: key);
  static const routeName = '/expiry';

  @override
  State<ExpiryHomePage> createState() => _Expiry_HomePageState();
}

class _Expiry_HomePageState extends State<ExpiryHomePage> {
  final _formKey = GlobalKey<FormState>();
  String food_name = "";
  DateTime? food_expired_date;

  // Main function check : GET/Fetch work?
  Future<List<FoodData>> fetchFoodData(CookieRequest request) async {
    var response =
        await request.get("https://fooodybuddy.up.railway.app/expiry/json/");

    List<FoodData> listFoodData = [];
    for (var d in response) {
      if (d != null) {
        listFoodData.add(FoodData.fromJson(d));
      }
    }

    return listFoodData;
  }

  @override
  Widget build(BuildContext context) {
    // Request, just like in Django.
    final request = context.watch<CookieRequest>();
    return Scaffold(
        appBar: AppBar(
          title: const Text("Expiry Home Page"),
        ),
        drawer: const AppDrawer(),
        body: request.loggedIn
            ? (FutureBuilder(
                future: fetchFoodData(request),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    if (!snapshot.hasData) {
                      return Column(
                        children: const [
                          Text(
                            "You haven't add any food to your tracker :(",
                            style: TextStyle(
                                color: Color(0xFFFEA150), fontSize: 40),
                          ),
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
                                          color: Color(0xFFFEA150),
                                          blurRadius: 2.0)
                                    ]),
                                child: Card(
                                  child: SizedBox(
                                    height: 95,
                                    child: Column(children: <Widget>[
                                      // Main function check : Is data valid with logic?
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, left: 12),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            snapshot.data![index].food_name,
                                            style:
                                                const TextStyle(fontSize: 30),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, left: 12),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            snapshot
                                                .data![index].food_expired_date,
                                            style:
                                                const TextStyle(fontSize: 15),
                                          ),
                                        ),
                                      ),
                                    ]),
                                  ),
                                ),
                              ));
                    }
                  }
                }))
            : (Center(
                // Main function check : Switched to login page?
                child: TextButton(
                  child: const Text(
                    "Proceed to login first..",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xFFFEA150)),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                    );
                  },
                ),
              )),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 35),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            textDirection: TextDirection.rtl,
            children: [
              // Floating Action Button only appear when the user is logged in
              if (request.loggedIn) ...[
                FloatingActionButton(
                  backgroundColor: const Color(0xFFFEA150),
                  onPressed: () {
                    Navigator.pushReplacement(
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
                                children: const [
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
              ]
            ],
          ),
        ));
  }
}
