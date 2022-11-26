// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:fooody/widgets/drawer.dart';


class SendFoodHomePage extends StatefulWidget {
  const SendFoodHomePage({Key? key}) : super(key: key);

  
  @override
  State<SendFoodHomePage> createState() => _SendFood_HomePageState();
}


class _SendFood_HomePageState extends State<SendFoodHomePage> {
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
      
        title: const Text("Send Foodwaste Home Page"),
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
        tooltip: 'Tambah Sisa Makanan',
        child: const Icon(Icons.add),
      ), 
    );
  }
}
