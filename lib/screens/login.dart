// ignore_for_file: constant_identifier_names, use_build_context_synchronously
import 'package:provider/provider.dart';
import 'package:fooody/screens/signup.dart';
// ignore: unused_import
import 'package:fooody/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:fooody/common/cookie_request.dart';
import 'package:fooody/widgets/drawer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  void togglePasswordView() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  String username = "";
  String password1 = "";

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    Size size = MediaQuery.of(context).size;
    return Form(
        key: _formKey,
        child: Stack(
          children: [
            Scaffold(
              backgroundColor: Color(0xFFFEA150),
              appBar: AppBar(
                ),
              drawer: const AppDrawer(),
              body: Column(
                children: [
                  const Flexible(
                    child: Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontSize: 55,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
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
                              borderRadius: BorderRadius.circular(5.0),
                            ),
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
                            final response = await request.login(
                                "https://fooodybuddy.up.railway.app/loginflutter/",
                                {
                                  'username': username,
                                  'password': password1,
                                });
                                print(response);
                            if (response['status']) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("Berhasil login!"),
                              ));
                              Navigator.pushReplacementNamed(
                                context, HomePage.routeName);
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content:
                                    Text("Tidak berhasil login. Mohon cek kembali input anda."),
                              ));
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
                        height: 35,
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                        context, SignUp.routeName);
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(width: 1, color: Colors.white))),
                      child: const Text(
                        'Belum punya akun? Buat sekarang!',
                        style: TextStyle(
                            fontFamily: 'Poppins', 
                            fontSize: 16, 
                            color: Colors.white, 
                            height: 1.5),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                ],
              ),
            )
          ],
        ),
    );
  }
}