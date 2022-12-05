// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:fooody/widgets/drawer.dart';
import 'package:expiry/models/food_data.dart';
import 'package:expiry/screens/expiry_home_page.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

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
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Example: Mi Yamin Fasilkom",
                      labelText: "Food Name",
                      // Menambahkan circular border agar lebih rapi
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
                    child: Text("Food Expired Date"),
                    onPressed: () {
                      // TODO: Need validator
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
                          onPressed: () {
                            if (_formKey.currentState!.validate() &&
                                food_expired_date != null) {
                              // Request.POST
                              // Main function check : POST work?
                              request.post(
                                  "https://fooodybuddy.up.railway.app/expiry/add-food/",
                                  {
                                    "food_name": food_name,
                                    "food_expired_date": food_expired_date,
                                  });

                              setState(() {
                                food_name = "";
                                food_expired_date = null;
                              });

                              Navigator.pop(context);
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
