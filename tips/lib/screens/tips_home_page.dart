// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:fooody/widgets/drawer.dart';


class TipsHomePage extends StatefulWidget {
  const TipsHomePage({Key? key}) : super(key: key);

  
  @override
  State<TipsHomePage> createState() => _Tips_HomePageState();
}


class _Tips_HomePageState extends State<TipsHomePage> {
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
      
        title: const Text("Foody Article Home Page"),
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
        tooltip: 'Tambahkan Artikel!',
        child: const Icon(Icons.add),
      ), 
    );
  }
}
