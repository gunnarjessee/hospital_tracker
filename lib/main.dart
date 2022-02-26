import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hospital Tracker',
      darkTheme: ThemeData(brightness: Brightness.dark),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark
      ),
      home: HomePage(),
    );
  }

}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePage();

}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hospital Tracker',
          style: TextStyle(decoration: TextDecoration.none)),
        backgroundColor: Colors.deepOrange,),
      body:  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Text('Hospitals', style: TextStyle(decoration: TextDecoration.none, color: Colors.deepOrange),),
      ),
    );
  }

}

