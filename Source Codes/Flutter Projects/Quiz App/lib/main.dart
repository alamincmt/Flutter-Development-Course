import 'package:flutter/material.dart';
import 'package:quiz_app/login.dart';
import 'package:quiz_app/registration.dart';

void main() {
  runApp(MaterialApp(
      initialRoute: 'login',
      routes: {
        'login': (context) => UserLogin(),
        'registration': (context) => UserRegistration()
      },
    ),
  );
}