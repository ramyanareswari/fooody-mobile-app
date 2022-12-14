// ignore_for_file: constant_identifier_names, use_build_context_synchronously


import 'dart:convert' as convert;
// ignore: unused_import
import 'package:fooody/screens/login.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fooody/common/cookie_request.dart';
import 'package:fooody/widgets/drawer.dart';


class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);
  static const routeName = '/signup';


  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();

  String username = "";
  String email = "";
  String password1 = "";
  String password2 = "";

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: const Color(0xFFFEA150),
            appBar: AppBar(
                ),
            drawer: const AppDrawer(),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: size.width * 0.1,
                  ),
                  Stack(
                    children: const [
                      Center(
                        child: Text('Registrasi Akun',
                            style:
                                TextStyle(
                                fontFamily: 'Poppins', 
                                fontWeight: FontWeight.bold,
                                fontSize: 55, 
                                color: Colors.white)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.width * 0.1,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 10.0),
                        child: TextFormField(
                          style: const TextStyle(color: Colors.white, fontFamily: 'Poppins'),
                          decoration: InputDecoration(
                            hintText: "Masukkan Username",
                            labelText: "Username",
                            labelStyle: const TextStyle(color: Colors.white, fontFamily: 'Poppins'),
                            icon: const Icon(Icons.people),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            hintStyle: const TextStyle(color: Colors.white, fontFamily: 'Poppins'),
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              username = value!;
                            });
                          },
                          onSaved: (String? value) {
                            setState(() {
                              username = value!;
                            });
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Username tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 10.0),
                        child: TextFormField(
                          style: const TextStyle(color: Colors.white, fontFamily: 'Poppins'),
                          decoration: InputDecoration(
                            hintText: "Contoh: blabla@gmail.com",
                            labelText: "Email",
                            labelStyle: const TextStyle(color: Colors.white, fontFamily: 'Poppins'),
                            icon: const Icon(Icons.email),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            hintStyle: const TextStyle(color: Colors.white, fontFamily: 'Poppins'),
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              email = value!;
                            });
                          },
                          onSaved: (String? value) {
                            setState(() {
                              email = value!;
                            });
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Email tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 10.0),
                        child: TextFormField(
                          obscureText: true,
                          style: const TextStyle(color: Colors.white, fontFamily: 'Poppins'),
                          decoration: InputDecoration(
                            hintText: "Masukkan Password",
                            labelText: "Password",
                            labelStyle: const TextStyle(color: Colors.white, fontFamily: 'Poppins'),
                            icon: const Icon(
                              Icons.lock_outline,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            hintStyle: const TextStyle(color: Colors.white, fontFamily: 'Poppins'),
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              password1 = value!;
                            });
                          },
                          onSaved: (String? value) {
                            setState(() {
                              password1 = value!;
                            });
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 10.0),
                        child: TextFormField(
                          obscureText: true,
                          style: const TextStyle(color: Colors.white, fontFamily: 'Poppins'),
                          decoration: InputDecoration(
                            hintText: "Konfirmasi Password",
                            labelText: "Konfirmasi Password",
                            labelStyle: const TextStyle(color: Colors.white, fontFamily: 'Poppins'),
                            icon: const Icon(Icons.lock_outline),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            hintStyle: const TextStyle(color: Colors.white, fontFamily: 'Poppins'),
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              password2 = value!;
                            });
                          },
                          onSaved: (String? value) {
                            setState(() {
                              password2 = value!;
                            });
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password tidak boleh kosong';
                            } else if (value != password1){
                              return 'Password konfirmasi berbeda';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Container(
                        height: size.height * 0.08,
                        width: size.width * 0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: const Color(0xFF24262A),
                        ),
                        child: TextButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              final response = await request.post(
                                  "https://fooodybuddy.up.railway.app/registerflutter/",
                                  convert.jsonEncode(<String, String>{
                                    'username': username,
                                    'email': email,
                                    'password1': password1,
                                    'password2': password2,
                                  }));
                              if (response['status'] == 'success') {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text(
                                      "Akun berhasil dibuat!"),
                                ));
                                Navigator.pushReplacementNamed(
                                    context, LoginScreen.routeName);
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text(
                                      "Tidak berhasil buat akun. Mohon cek kembali input anda."),
                                ));
                              }
                            }
                          },
                          child: const Text(
                            'Submit',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 22,
                                color: Colors.white,
                                height: 1.5,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}