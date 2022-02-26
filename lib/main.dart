import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  HomePage({Key? key}) : super(key: key);

  final hospitalCard = [
    HospitalCounter('Pulaski'),
    HospitalCounter('Montgomery'),
    HospitalCounter('NRV'),
    HospitalCounter('Salem'),
    HospitalCounter('Cave'),
    HospitalCounter('RMH'),
    HospitalCounter('Alleghany'),
    HospitalCounter('Out of Town'),

  ];

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
        home: GridView.count(crossAxisCount: 1,
          childAspectRatio: 3.5,
          primary: false,
          padding: EdgeInsets.all(8),
          mainAxisSpacing: 0,
          children: widget.hospitalCard,
        ),
      ),
    );
  }

}

class HospitalCounter extends StatefulWidget {
  String name = "";
  HospitalCounter(this.name, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HospitalCounter();
  
}

class _HospitalCounter extends State<HospitalCounter> {

  final TextStyle _style = const TextStyle(decoration: TextDecoration.none, color: Colors.greenAccent, fontSize: 20);
  int _amount = 0;

  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  void _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      log(_amount);
      _amount = (prefs.getInt(widget.name) ?? 0);
    });
  }

  void _incrementCounter() async {
    final prefs = await SharedPreferences.getInstance();
    _amount = _amount + 1;
    prefs.setInt(widget.name, _amount);
  }

  void _decrementCounter() async {
    final prefs = await SharedPreferences.getInstance();
    if (_amount > 0) {
      _amount = _amount - 1;
    }
    prefs.setInt(widget.name, _amount);
  }

  @override
  Widget build(BuildContext context) {

    return Center(
      child: GridView.count(
          crossAxisCount: 4,
          padding: EdgeInsets.zero,
          shrinkWrap: true,

          childAspectRatio: 1.0,
          children: [
            Container(
              decoration: BoxDecoration(border: Border.all(width: 3.0, color: Colors.greenAccent)),
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Center(child: Text("" + widget.name, style: _style,),),
              ),
              height: 50,
            ),
            Container(
                decoration: BoxDecoration(border: Border.all(width: 3.0, color: Colors.greenAccent)),
                child: TextButton(
                onPressed: () { setState(() {
                  _incrementCounter();
                  _loadCounter();
                }); },
                child: const Text("+", style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.greenAccent,
                    fontSize: 24
                ),),),
                height: 50
            ),
            Container(
              decoration: BoxDecoration(border: Border.all(width: 3.0, color: Colors.greenAccent)),
              child: TextButton(
                onPressed: () { setState(() {
                  _decrementCounter();
                  _loadCounter();
                }); },
                child: const Text("-", style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.greenAccent,
                    fontSize: 24
                ),),
              ),
                height: 50
            ),
            Container(
              child: Center(child: Text('$_amount', style: _style,),),
                height: 50
            )
          ],
      ),
    );
  }
  
}

