import 'package:flutter/material.dart';

class Tasbih extends StatefulWidget {
  const Tasbih({super.key});

  @override
  State<Tasbih> createState() => _TasbihState();
}

class _TasbihState extends State<Tasbih> {
  int _counter = 0;
  int _kalimaShahadatCount = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  void _kalimaShahadatCountIncreement() {
    setState(() {
      _kalimaShahadatCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
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
        Text('Kalima Count: $_kalimaShahadatCount'),
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