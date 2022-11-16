import 'package:flutter/material.dart';

class Tasbih extends StatefulWidget {
  const Tasbih({super.key});

  @override
  State<Tasbih> createState() => _TasbihState();
}

class _TasbihState extends State<Tasbih> {
  int _counter = 0;
  int _kalimaShahadatCount = 0;

  int maxTime = 33;
  String congratulationMessage = "";

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  void _kalimaShahadatCountIncreement() {
    setState(() {
      _kalimaShahadatCount++;
      if(_kalimaShahadatCount >= maxTime){
        congratulationMessage = "Congratulations You completed $maxTime counts. ";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        ElevatedButton(
          onPressed: _increment,
          child: const Text('Increment'),
        ),
        const SizedBox(width: 16),
        Text('Count: $_counter'),
        ElevatedButton(
          onPressed: _kalimaShahadatCountIncreement,
          child: const Text('Laa-Ilaha-Illallah'),
        ),
        const SizedBox(width: 16),
        Text('Kalima Count: $_kalimaShahadatCount $congratulationMessage'),
      ],
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Tasbih(),
        ),
      ),
    ),
  );
}