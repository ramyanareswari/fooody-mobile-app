import 'package:flutter/material.dart';
import 'package:diary/screens/diary_home_page.dart';
import 'package:fooody/widgets/drawer.dart';
import 'package:intl/intl.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:fooody/common/cookie_request.dart';

class DiaryForm extends StatefulWidget {
  const DiaryForm({Key? key}) : super(key: key);

  @override
  State<DiaryForm> createState() => _DiaryFormState();
}

class Data {
  static List logData = [];
}

class _DiaryFormState extends State<DiaryForm> {
  final _formKey = GlobalKey<FormState>();
  String? foodname;
  String? description;
  int price = 0;
  List logData = [];
  // List<bool> status = [true, false];
  String? logDate;
  DateTime date = DateTime.now();
  TextEditingController dateInput = TextEditingController();

  @override
  void initState() {
    dateInput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          shape: Border(bottom: BorderSide(color: Colors.black, width: 0.5)),
          title: const Text(
            "add log",
            style:
                TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold),
          ),
        ),
        drawer: const AppDrawer(),
        body: Form(
            key: _formKey,
            child: SingleChildScrollView(
                child: Container(
              padding: const EdgeInsets.all(10.0),
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 20),
                      Text('fooody diary',
                          style: TextStyle(
                              color: Color.fromARGB(255, 46, 40, 36),
                              fontFamily: 'Poppins',
                              fontSize: 55,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline)),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: "Nama Makanan/Minuman",
                            hintText: "Contoh: Sup buatan Ibu",
                            labelStyle: const TextStyle(
                                color: Color.fromARGB(255, 33, 28, 26),
                                fontFamily: 'Poppins'),
                            hintStyle: const TextStyle(
                                color: Color.fromARGB(255, 107, 97, 93),
                                fontFamily: 'Poppins'),
                            icon: const Icon(Icons.fastfood_outlined),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              foodname = value!;
                            });
                          },
                          onSaved: (String? value) {
                            setState(() {
                              foodname = value!;
                            });
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Don\'t be shy, tell me what you ate/drank :D';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: dateInput,
                          decoration: InputDecoration(
                            labelText: "Tanggal",
                            icon: const Icon(Icons.calendar_today),
                            labelStyle: const TextStyle(
                                color: Color.fromARGB(255, 33, 28, 26),
                                fontFamily: 'Poppins'),
                            // Menambahkan circular border agar lebih rapi
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          // Menambahkan behavior saat nama diketik
                          readOnly: true,
                          onTap: () async {
                            showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2500),
                            ).then((selectedDate) {
                              if (selectedDate != null) {
                                String formattedDate =
                                    DateFormat.yMd().format(selectedDate);
                                setState(() {
                                  dateInput.text = formattedDate!;
                                  logDate = formattedDate!;
                                  date = selectedDate!;
                                });
                              } else {
                                print('Tanggal belum dipilih');
                              }
                            });
                          },
                          // Menambahkan behavior saat data disimpan
                          onSaved: (value) {
                            setState(() {
                              logDate = value!;
                            });
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Kapan kamu makan/minum ini?';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: "Deskripsi",
                            icon: const Icon(Icons.description_outlined),
                            labelStyle: const TextStyle(
                                color: Color.fromARGB(255, 33, 28, 26),
                                fontFamily: 'Poppins'),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              description = value!;
                            });
                          },
                          onSaved: (String? value) {
                            setState(() {
                              description = value!;
                            });
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Deskripsi tidak boleh kosong!';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: "Berapa harganya?",
                            hintText: "Masukkan angka tanpa titik/koma",
                            labelStyle: const TextStyle(
                                color: Color.fromARGB(255, 33, 28, 26),
                                fontFamily: 'Poppins'),
                            hintStyle: const TextStyle(
                                color: Color.fromARGB(255, 99, 87, 83),
                                fontFamily: 'Poppins'),
                            icon: const Icon(Icons.monetization_on_outlined),
                            // Menambahkan circular border agar lebih rapi
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          // Menambahkan behavior saat nama diketik
                          onChanged: (String? value) {
                            setState(() {
                              price = int.parse(value!);
                            });
                          },
                          // Menambahkan behavior saat data disimpan
                          onSaved: (String? value) {
                            setState(() {
                              price = int.parse(value!);
                            });
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Jika tidak membayar, masukkan nilai nol';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 30),
                      Center(
                        child: Column(
                          children: [
                            SizedBox(
                              width: 350,
                              height: 50,
                              child: TextButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                    const Color(0xFFFEA150),
                                  ),
                                ),
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    final response = await request.post(
                                        "https://fooodybuddy.up.railway.app/diary/add_flutter/",
                                        {
                                          "foodname": foodname,
                                          "description": description,
                                          "price": price.toString(),
                                          "date":
                                              "${date.year}-${date.month}-${date.day}",
                                        });

                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content: Text("Successfully added!",
                                          style:
                                              TextStyle(fontFamily: 'Poppins')),
                                    ));
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const DiaryHomePage()),
                                    );
                                  }
                                },
                                child: const Text(
                                  "+ Tambah Log",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Poppins',
                                      fontSize: 20),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Center(
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: 350,
                                    height: 50,
                                    child: OutlinedButton(
                                      style: ButtonStyle(
                                        side:
                                            MaterialStateProperty.all(
                                          BorderSide(
                        color: Color.fromARGB(255, 255, 139, 55),
                        width: 1,)
                                        ),
                                      ),
                                      onPressed: () async {
                                        Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const DiaryHomePage()),
                                    );
                                      },
                                      child: const Text(
                                        "Back",
                                        style: TextStyle(
                                            color: Color.fromARGB(255, 226, 108, 24),
                                            fontFamily: 'Poppins',
                                            fontSize: 20),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
              ),
            ))));
  }
}
