import 'package:flutter/material.dart';
import 'package:fooody/widgets/drawer.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = '/home';

  // Color themes
  static const blackColorTheme = Color(0xFF24262A);
  static const orangeColorTheme = Color(0xFFFEA150);

  @override
  Widget build(BuildContext context) {
    // TODO: ADD NETWORK SERVICE
    return Scaffold(
      appBar: AppBar(
        // TODO: DIGANTI JADI USER LOGIN, tambah dolar
        title: const Text(
          'Halo, {request.username}}!',
        ),
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: const <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Text(
                  'Apa yang ingin kamu lakukan hari ini?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
