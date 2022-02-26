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
  HomePage({Key? key}) : super(key: key);
  final hospitals = ['Pulaski', 'Montgomery', 'Alleghany', 'Salem', 'Cave', 'RMH', 'NRV', 'Out of Town'];

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
        home: HospitalCounter('Pulaski', 10),
      ),
    );
  }

}

class HospitalCounter extends StatefulWidget {
  String name = "";
  int number = 0;

  HospitalCounter(this.name, this.number, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HospitalCounter();
  
}

class _HospitalCounter extends State<HospitalCounter> {

  final TextStyle _style = const TextStyle(decoration: TextDecoration.none, color: Colors.greenAccent, fontSize: 20);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GridView.count(
          crossAxisCount: 4,
          children: [
            Container(
              width: 1000,
              child: Center(child: Text("" + widget.name.toString(), style: _style,),),
            ),
            Container(
              child: TextButton(
                onPressed: () { setState(() {
                  widget.number++;
                }); },
                child: const Text("+", style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.greenAccent,
                    fontSize: 24
                ),),),
            ),
            Container(
              child: TextButton(
                onPressed: () { setState(() {
                  widget.number = widget.number - 1;
                }); },
                child: const Text("-", style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.greenAccent,
                    fontSize: 24
                ),),
              ),
            ),
            Container(
              child: Center(child: Text('' + widget.number.toString(), style: _style,),),
            )
          ],
      ),
    );
  }
  
}

