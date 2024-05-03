import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    List<Widget> jugador = List.generate(4, (index) => RandomColorCard());
    List<Widget> computadora = List.generate(4, (index) => RandomColorCard());

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: GridView.count(
                    crossAxisCount: 4,
                    children: jugador,
                  ),
                ),
              ),
              SizedBox(height: 20), 
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: GridView.count(
                    crossAxisCount: 4,
                    children: computadora,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RandomColorCard extends StatefulWidget {
  @override
  _RandomColorCardState createState() => _RandomColorCardState();
}

class _RandomColorCardState extends State<RandomColorCard> {
  int _randomNumber = 0;
  Color _randomColor = Colors.black;

  @override
  void initState() {
    super.initState();
    _generateRandom();
  }

  void _generateRandom() {
    setState(() {
      _randomNumber = Random().nextInt(9) + 1; 
      _randomColor = colors[Random().nextInt(colors.length)];
    });
  }

  final List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15), 
      decoration: BoxDecoration(
        color: Colors.white, 
        borderRadius: BorderRadius.circular(20), 
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), 
          ),
        ],
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$_randomNumber",
                style: TextStyle(
                  fontSize: 48,
                  color: _randomColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20), 
              ElevatedButton(
                onPressed: _generateRandom,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan, 
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), 
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), 
                  child: Text(
                    "Poner carta",
                    style: TextStyle(fontSize: 16),
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