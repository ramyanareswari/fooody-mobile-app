import 'package:flutter/material.dart';
import 'package:fooody/common/cookie_request.dart';
import 'package:fooody/widgets/drawer.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:send_foodwaste/screens/send_foodwaste.dart';

class AddFoodHomePage extends StatefulWidget {
  const AddFoodHomePage({Key? key}) : super(key: key);

  @override
  State<AddFoodHomePage> createState() => _AddFoodHomePageState();
}

class _AddFoodHomePageState extends State<AddFoodHomePage> {
  final _formKey = GlobalKey<FormState>();
  final dateController = TextEditingController();
  String name = "";
  String address = "";
  String phoneNumber = "";
  String foodType = "";
  DateTime expiryDate = DateTime.now();
  String weight = "";
  List<String> types = ["Meat", "Fruits & Vegetables", "Dairy", "Seafood"];

  bool isNumeric(String str) {
    return double.tryParse(str) != null;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Foodwaste"),
      ),
      drawer: const AppDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Fill in the details below",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          icon: const Icon(Icons.account_circle),
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
                          icon: const Icon(Icons.home),
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
                          icon: const Icon(Icons.phone),
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
                          } else if (!isNumeric(value)) {
                            return 'Please enter a valid phone number';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        onTap: () async {
                          DateTime? newDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2100),
                          );

                          if (newDate == null) return;

                          setState(() {
                            expiryDate = newDate;
                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(newDate);
                            dateController.text = formattedDate;
                          });
                        },
                        controller: dateController,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.calendar_today),
                          labelText: "Set an expiry date",
                        ),
                        validator: (value) {
                          if (expiryDate == DateTime.now()) {
                            return "Please set an expiry date";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButtonFormField(
                        decoration:
                            const InputDecoration(icon: Icon(Icons.fastfood)),
                        value: foodType != "" ? foodType : null,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: types.map((String item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(item),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            foodType = newValue!;
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty || value == "") {
                            return 'Pick a food type';
                          }
                          return null;
                        },
                        hint: const Text(
                          "Food type",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          icon: const Icon(Icons.stop),
                          hintText: 'Weight',
                          labelText: 'Weight',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            weight = value!;
                          });
                        },
                        onSaved: (String? value) {
                          setState(() {
                            weight = value!;
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter food weight';
                          } else if (!isNumeric(value)) {
                            return 'Please enter a number';
                          }
                          return null;
                        },
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 50),
                            child: TextButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    const Color(0xFFFEA150)),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  await request.post(
                                      "https://fooodybuddy.up.railway.app/send_foodwaste/add_foodwaste/",
                                      {
                                        "name": name,
                                        "phone_number": phoneNumber,
                                        "address": address,
                                        "expiry_date" : expiryDate,
                                        "food_type": foodType,
                                        "weight": weight.toString(),
                                      });
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SendFoodHomePage()),
                                  );
                                }
                              },
                              child: const Text(
                                "Send",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
