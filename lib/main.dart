import 'package:flutter/material.dart';
import 'package:fooody/widgets/drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static Map<int, Color> colorTheme = {
    // 0xFF9966
    50: const Color.fromRGBO(254,161,80, .8),
    100: const Color.fromRGBO(254,161,80, .8),
    200: const Color.fromRGBO(254,161,80, .8),
    300: const Color.fromRGBO(254,161,80, .8),
    400: const Color.fromRGBO(254,161,80, .8),
    500: const Color.fromRGBO(254,161,80, .8),
    600: const Color.fromRGBO(254,161,80, .8),
    700: const Color.fromRGBO(254,161,80, .8),
    800: const Color.fromRGBO(254,161,80, .9),
    900: Color.fromARGB(255, 253, 172, 102),
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'fooody',
      theme: ThemeData(
        
        primarySwatch: MaterialColor(0xFFFEA150, colorTheme)
      ),
      home: const MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
      
        title: Text(widget.title),
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
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
