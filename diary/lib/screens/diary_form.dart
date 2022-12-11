import 'package:flutter/material.dart';
import 'package:diary/screens/diary_home_page.dart';
import 'package:fooody/widgets/drawer.dart';
import 'package:intl/intl.dart';

class DiaryForm extends StatefulWidget {
  const DiaryForm({super.key});

  @override
  State<DiaryForm> createState() => _DiaryFormState();
}

class data {
  static List logData = [];
}

class _DiaryFormState extends State<DiaryForm> {
  final _formKey = GlobalKey<FormState>();
  String? judul;
  String? desc;
  int price = 0;
  List logData = [];
  // List<bool> status = [true, false];
  String? dateTime;
  TextEditingController dateInput = TextEditingController();

  @override
  void initState() {
    dateInput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("What did you eat?",
          style: TextStyle(fontFamily: 'Poppins'),),
         
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "Nama Makanan/Minuman",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                            onChanged: (String? value) {
                              setState(() {
                                judul = value!;
                              });
                            },
                            onSaved: (String? value) {
                              setState(() {
                                judul = value!;
                              });
                            },
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Nama tidak boleh kosong :(';
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
                                firstDate: DateTime(2010),
                                lastDate: DateTime(2030),
                              ).then((selectedDate) {
                                if (selectedDate != null) {
                                  String formattedDate =
                                      DateFormat.yMd().format(selectedDate);
                                  setState(() {
                                    dateInput.text = formattedDate;
                                    dateTime = formattedDate;
                                  });
                                } else {
                                  print('Tanggal belum dipilih');
                                }
                              });
                            },
                            // Menambahkan behavior saat data disimpan
                            onSaved: (value) {
                              setState(() {
                                dateTime = value!;
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "Deskripsi",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                            onChanged: (String? value) {
                              setState(() {
                                desc = value!;
                              });
                            },
                            onSaved: (String? value) {
                              setState(() {
                                desc = value!;
                              });
                            },
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
                              labelText: "Price",
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
                            // Validator sebagai validasi form
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Jika tidak membayar, masukkan nilai nol';
                              }
                              return null;
                            },
                          ),
                        ),

                      ],
                    ))))));
  }
}
