// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:fooody/widgets/drawer.dart';

class SendFoodHomePage extends StatefulWidget {
  const SendFoodHomePage({Key? key}) : super(key: key);

  @override
  State<SendFoodHomePage> createState() => _SendFood_HomePageState();
}

class _SendFood_HomePageState extends State<SendFoodHomePage> {
  final _formKey = GlobalKey<FormState>();
  String name = "";
  String address = "";
  String phoneNumber = "";
  DateTime expiryDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Send Foodwaste Home Page"),
        ),
        drawer: const AppDrawer(),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Container(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Name',
                          labelText: 'Name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            name = value!;
                          });
                        },
                        onSaved: (String? value) {
                          setState(() {
                            name = value!;
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Address',
                          labelText: 'Address',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            address = value!;
                          });
                        },
                        onSaved: (String? value) {
                          setState(() {
                            address = value!;
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an address';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Phone number',
                          labelText: 'Phone number',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            phoneNumber = value!;
                          });
                        },
                        onSaved: (String? value) {
                          setState(() {
                            phoneNumber = value!;
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a phone number';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InputDatePickerFormField(
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100),
                      ),
                    ),
                  ],
                )),
          ),
        ));
  }
}
