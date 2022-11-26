// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:fooody/widgets/drawer.dart';


class ExpiryHomePage extends StatefulWidget {
  const ExpiryHomePage({Key? key}) : super(key: key);

  
  @override
  State<ExpiryHomePage> createState() => _Expiry_HomePageState();
}


class _Expiry_HomePageState extends State<ExpiryHomePage> {
  int _counter = 0;

  // ignore: unused_element
  void _incrementCounter() {
    setState(() {
    
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
      
        title: const Text("Expiry Home Page"),
      ),
      drawer: const AppDrawer(),
      body: Center(
        
        child: Column(
        
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFFEA150),
        onPressed: () {
        },
        tooltip: 'Tambahkan Kutipan Penyemangat',
        child: const Icon(Icons.add),
      ), 
    );
  }
}
