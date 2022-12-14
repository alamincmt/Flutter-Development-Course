import 'package:flutter/material.dart';
import 'package:quiz_app/login.dart';
import 'package:quiz_app/registration.dart';
import 'package:quiz_app/sura_list.dart';

void main() {
  runApp(MaterialApp(
      initialRoute: 'login',
      routes: {
        'login': (context) => UserLogin(),
        'registration': (context) => UserRegistration(),
        'sura_list': (context) => SuraList()
      },
    ),
  );
}