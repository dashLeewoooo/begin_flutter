import 'package:flutter/material.dart';
import 'package:you_and_i/screen/home_screen.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      fontFamily: 'sunflower',
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          color: Colors.white,
          fontFamily: 'parisienne',
          fontSize: 80.0,
        ),
        titleMedium: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 50.0,
        ),
        titleSmall: TextStyle(
          color: Colors.white,
          fontSize: 30.0,
        ),
      ),
    ),
    home: const HomeScreen(),
  ));
}
