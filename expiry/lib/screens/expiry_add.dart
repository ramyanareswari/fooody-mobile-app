// ignore_for_file: camel_case_types, unused_import, non_constant_identifier_names, depend_on_referenced_packages, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:fooody/widgets/drawer.dart';
import 'package:expiry/screens/expiry_home_page.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
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
  DateTime food_expired_date = DateTime.now();

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
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    // Appearing food_expired_date?
                    child: const Text("Food Expired Date. Default : Today"),
                    onPressed: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2200),
                      ).then((date) {
                        setState(() {
                          food_expired_date = date!;
                        });
                      });
                    },
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      SizedBox(
                        width: 125,
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                const Color(0xFFFEA150)),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              // Main function check : POST work?
                              // ignore: unused_local_variable
                              final response = await request.post(
                                  "https://fooodybuddy.up.railway.app/expiry/add-food-flutter/",
                                  {
                                    "food_name": food_name,
                                    "food_expired_date":
                                        "${food_expired_date.year}-${food_expired_date.month}-${food_expired_date.day}",
                                  });

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("Successfully added!"),
                              ));
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ExpiryHomePage()),
                              );
                            }
                          },
                          child: const Text(
                            "Submit",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 100,
                        child: Text(""),
                      ),
                      SizedBox(
                        width: 125,
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                const Color(0xFFFEA150)),
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ExpiryHomePage()),
                            );
                          },
                          child: const Text(
                            "Back",
                            style: TextStyle(color: Colors.white),
                          ),
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
