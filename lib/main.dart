import 'package:flutter/material.dart';
import 'package:machshield/pages/about.dart';
import 'package:machshield/pages/home.dart';
import 'package:machshield/pages/process.dart';
import 'package:machshield/pages/success.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/home',
    routes: {
      '/home': (context) => Home(),
      '/about': (context) => const About(),
      '/process': (context) => Process(),
      '/success': (context) => const Success(),
    },
  ));
}
