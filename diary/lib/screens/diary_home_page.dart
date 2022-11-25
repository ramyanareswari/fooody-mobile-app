import 'package:flutter/material.dart';


class DiaryHomePage extends StatefulWidget {
  const DiaryHomePage({Key? key}) : super(key: key);

  
  @override
  State<DiaryHomePage> createState() => _Diary_HomePageState();
}


class _Diary_HomePageState extends State<DiaryHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
    
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
      
        title: Text("Diary Home Page"),
      ),
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
        backgroundColor: const Color(0xFF0B36A8),
        onPressed: () {
        },
        tooltip: 'Tambahkan Kutipan Penyemangat',
        child: const Icon(Icons.add),
      ), 
    );
  }
}
