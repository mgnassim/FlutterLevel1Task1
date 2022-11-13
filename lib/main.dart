import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterLevel1Task1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'FlutterLevel1Task1'),
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

  List<String> dices = [
    "images/dice1.png",
    "images/dice2.png",
    "images/dice3.png",
    "images/dice4.png",
    "images/dice5.png",
    "images/dice6.png",
  ];

  int lastThrow = 0;
  int currentThrow = 0;

  Image img() {
    return Image.asset(dices[currentThrow]);
  }

  int random(int min, int max) {
    return min + Random().nextInt(max - min);
  }

  void _rollDice() {
      lastThrow = currentThrow;
      currentThrow = random(0, dices.length);
  }

  void notification(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        backgroundColor: Colors.blue,
        fontSize: 16.0
    );
  }

  void _onHigherClick() {
    _rollDice();
    if(currentThrow > lastThrow) {
      notification('Correct!');
    } else {
      notification('Incorrect!');
    }
  }

  void _onLowerClick() {
    _rollDice();
    if(currentThrow < lastThrow) {
      notification('Correct!');
    } else {
      notification('Incorrect!');
    }
  }

  void _onEqualClick() {
    _rollDice();
    if(currentThrow == lastThrow) {
      notification('Correct!');
    } else {
      notification('Incorrect!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
              'Guess if the next throw is going to be lower, equal or higher.',
              textAlign: TextAlign.center,
          ),
          img(),
          Text('Last Throw: ${lastThrow+1}'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _onLowerClick();
                    });
                  },
                  child: const Text(
                    'LOWER'
                  )
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _onEqualClick();
                    });
                  },
                  child: const Text(
                      'EQUALS'
                  )
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _onHigherClick();
                    });
                  },
                  child: const Text(
                      'HIGHER'
                  )
              )
            ],
          )
        ],
      ),
    );
  }
}
