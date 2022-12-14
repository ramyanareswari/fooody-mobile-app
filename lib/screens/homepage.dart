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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        
        title: const Text(
          'Home Page', style: TextStyle(fontFamily: 'Poppins')
        ),
      ),
      drawer: const AppDrawer(),
      body: ListView(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.symmetric(
                  horizontal: 23.0, vertical: 130.0),
            child: Center(
              child: Text(
                'Fooody Buddy',
                style: TextStyle(
                    color: Color(0xFFFEA150),
                    fontSize: 55,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Column(
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 23.0, vertical: 9.0),
                child: Text(
                'About Our App',
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Poppins',),
                ),
              ),
            ],
          ),
          Column(
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 5.0),
                child: Card(
                  child: Padding(
                              padding:
                                  EdgeInsets.only(left: 10.0, bottom: 10.0, right: 10.0),
                    child: Text('Fooody Buddy hadir sebagai solusi untuk memfasilitasi masyarakat dalam menyalurkan limbah makanan yang diproduksi. Tak hanya itu, kami juga menginisiasi langkah preventif dengan membuat fitur tracker kedaluwarsa makanan. Melalui digitalisasi, kami berharap aplikasi ini dapat meningkatkan kesadaran masyarakat terkait pentingnya pengelolaan food waste.',
                    style: TextStyle(
                      fontFamily: 'Poppins',),
                    ),   
                  )
                ),
              )
            ]
          ),
          Column(
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 23.0, vertical: 9.0),
                child: Text(
                'Frequently Asked Questions (FAQ)',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 5.0),
                child: Card(
                  child: Column(
                    children: <Widget>[
                      Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, top: 10.0, bottom: 15.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const <Widget>[
                                Text(
                                  'Question 1',
                                  style: TextStyle(fontSize: 15, fontFamily: 'Poppins'), 
                                )
                              ])),
                      Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, bottom: 10.0, right: 10.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const <Widget>[Text('Tempor ut dolore lorem kasd vero.', style: TextStyle(fontFamily: 'Poppins'))])),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 5.0),
                child: Card(
                  child: Column(
                    children: <Widget>[
                      Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, top: 10.0, bottom: 15.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const <Widget>[
                                Text(
                                  'Question 2',
                                  style: TextStyle(fontSize: 15, fontFamily: 'Poppins'), 
                                )
                              ])),
                      Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, bottom: 10.0, right: 10.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const <Widget>[Text('Tempor ut dolore lorem kasd vero.', style: TextStyle(fontFamily: 'Poppins'))])),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 5.0),
                child: Card(
                  child: Column(
                    children: <Widget>[
                      Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, top: 10.0, bottom: 15.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const <Widget>[
                                Text(
                                  'Question 3',
                                  style: TextStyle(fontSize: 15, fontFamily: 'Poppins'), 
                                )
                              ])),
                      Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, bottom: 10.0, right: 10.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const <Widget>[Text('Tempor ut dolore lorem kasd vero.', style: TextStyle(fontFamily: 'Poppins'))])),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 5.0),
                child: Card(
                  child: Column(
                    children: <Widget>[
                      Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, top: 10.0, bottom: 15.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const <Widget>[
                                Text(
                                  'Question 4',
                                  style: TextStyle(fontSize: 15, fontFamily: 'Poppins'), 
                                )
                              ])),
                      Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, bottom: 10.0, right: 10.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const <Widget>[Text('Tempor ut dolore lorem kasd vero.', style: TextStyle(fontFamily: 'Poppins'))])),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 5.0),
                child: Card(
                  child: Column(
                    children: <Widget>[
                      Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, top: 10.0, bottom: 15.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const <Widget>[
                                Text(
                                  'Question 5',
                                  style: TextStyle(fontSize: 15, fontFamily: 'Poppins'), 
                                )
                              ])),
                      Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, bottom: 10.0, right: 10.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const <Widget>[Text('Tempor ut dolore lorem kasd vero.', style: TextStyle(fontFamily: 'Poppins'))])),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 5.0),
                child: Card(
                  child: Column(
                    children: <Widget>[
                      Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, top: 10.0, bottom: 15.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const <Widget>[
                                Text(
                                  'Question 6',
                                  style: TextStyle(fontSize: 15, fontFamily: 'Poppins'), 
                                )
                              ])),
                      Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, bottom: 10.0, right: 10.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const <Widget>[Text('Tempor ut dolore lorem kasd vero.', style: TextStyle(fontFamily: 'Poppins'))])),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}