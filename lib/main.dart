import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scoreboard(),
    );
  }
}

class Scoreboard extends StatefulWidget {
  @override
  _ScoreboardState createState() => _ScoreboardState();
}

class _ScoreboardState extends State<Scoreboard> {
  int puntuacion = 0; // Puntuación total para ambos jugadores

  @override
  Widget build(BuildContext context) {
    List<Widget> jugador = List.generate(4, (index) => RandomColorCard(actualizarPuntuacion));
    List<Widget> computadora = List.generate(4, (index) => RandomColorCard(actualizarPuntuacion));

    return Scaffold(
      appBar: AppBar(
        title: Text('MINI ONO'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Marcador',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              '$puntuacion',
              style: TextStyle(fontSize: 36),
            ),
            SizedBox(height: 20),
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
    );
  }

  void actualizarPuntuacion(int numero) {
    setState(() {
      puntuacion += numero; // Incrementar la puntuación con el número generado aleatoriamente
    });
  }
}

class RandomColorCard extends StatefulWidget {
  final Function(int) onTap;

  RandomColorCard(this.onTap);

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
    return GestureDetector(
      onTap: () {
        widget.onTap(_randomNumber);
        _generateRandom();
      },
      child: Container(
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
        child: Column(
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
              onPressed: () {
                widget.onTap(_randomNumber);
                _generateRandom();
              },
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
      ),
    );
  }
}