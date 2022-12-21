import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({
    super.key,
    required this.name,
  });
  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
      ),
      body: Center(
        child: Text('Welcom Mr. $name'),
      ),
    );
  }
}
