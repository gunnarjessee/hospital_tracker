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

  final hospitalCard = [
    HospitalCounter('Pulaski', 0),
    HospitalCounter('Montgomery', 0),
    HospitalCounter('NRV', 0),
    HospitalCounter('Salem', 0),
    HospitalCounter('Cave', 0),
    HospitalCounter('RMH', 0),
    HospitalCounter('Alleghany', 0),
    HospitalCounter('Out of Town', 0),

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
          padding: EdgeInsets.zero,
          shrinkWrap: true,

          childAspectRatio: 1.0,
          children: [
            Container(
              decoration: BoxDecoration(border: Border.all(width: 3.0, color: Colors.greenAccent)),
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Center(child: Text("" + widget.name.toString(), style: _style,),),
              ),
              height: 50,
            ),
            Container(
                decoration: BoxDecoration(border: Border.all(width: 3.0, color: Colors.greenAccent)),
                child: TextButton(
                onPressed: () { setState(() {
                  widget.number++;
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
                  if (widget.number > 0) {
                    widget.number = widget.number - 1;
                  }
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
              child: Center(child: Text('' + widget.number.toString(), style: _style,),),
                height: 50
            )
          ],
      ),
    );
  }
  
}

