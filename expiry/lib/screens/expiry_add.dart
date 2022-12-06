// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:fooody/widgets/drawer.dart';
import 'dart:convert' as convert;
import 'package:provider/provider.dart';
import 'package:fooody/common/cookie_request.dart';

class ExpiryAddPage extends StatefulWidget {
  const ExpiryAddPage({Key? key}) : super(key: key);

  @override
  State<ExpiryAddPage> createState() => _Expiry_AddPage();
}

class _Expiry_AddPage extends State<ExpiryAddPage> {
  final _formKey = GlobalKey<FormState>();
  String food_name = "";
  DateTime? food_expired_date;

  @override
  Widget build(BuildContext context) {
    // Request, just like in Django.
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expiry Add Page"),
      ),
      drawer: const AppDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Example: Mi Yamin Fasilkom",
                      labelText: "Food Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        food_name = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        food_name = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Food name can\'t be empty!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    // Appearing food_expired_date?
                    child: Text("Food Expired Date"),
                    onPressed: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2200),
                      ).then((date) {
                        setState(() {
                          food_expired_date = date;
                        });
                      });
                    },
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      Container(
                        width: 125,
                        child: TextButton(
                          child: const Text(
                            "Submit",
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                const Color(0xFFFEA150)),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState!.validate() &&
                                food_expired_date != null) {
                              // Main function check : POST work?
                              final response = await request.post(
                                  "https://fooodybuddy.up.railway.app/expiry/add-food/",
                                  {
                                    "food_name": food_name,
                                    "food_expired_date":
                                        food_expired_date.toString(),
                                  });

                              // Alternative : post using http
                              if (response.status == 200) {
                                // Hopefully works, status based on Django code (?)
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content:
                                      Text("Food tracker creation is success!"),
                                ));
                                Navigator.pop(context);
                              }
                            }
                          },
                        ),
                      ),
                      Container(
                        width: 100,
                        child: const Text(""),
                      ),
                      Container(
                        width: 125,
                        child: TextButton(
                          child: const Text(
                            "Back",
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                const Color(0xFFFEA150)),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
