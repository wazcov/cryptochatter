import 'package:flutter/material.dart';
import 'package:cryptochatter/ui/index.dart' as screens;

void main() {
  runApp(
    MaterialApp(
      title: 'Passing Data',
      theme: ThemeData(
        colorScheme: const ColorScheme(
          background: Colors.white,
          primary: Colors.green,
          onPrimary: Colors.white,
          secondary: Colors.orange,
          onSecondary: Colors.black45,
          surface: Colors.blueAccent,
          brightness: Brightness.light,
          onSurface: Colors.black45,
          error: Colors.purple,
          onError: Colors.black45,
          onBackground: Colors.black,
        ),

        // Define the default font family.
        fontFamily: 'Schyler',

        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: const TextTheme(
          headline1: TextStyle(
              fontSize: 30.0, fontWeight: FontWeight.w600, color: Colors.black),
          headline2: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w300,
              color: Colors.black54),
          bodyText2: TextStyle(fontSize: 12.0, fontFamily: 'Hind'),
        ),
      ),
      home: const screens.LoginScreen(),
    ),
  );
}
