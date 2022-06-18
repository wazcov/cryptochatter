import 'package:flutter/material.dart';
import 'package:cryptochatter/ui/index.dart' as screens;

void main() {
  runApp(
    MaterialApp(
      title: 'Passing Data',
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.light,
        primaryColor: Colors.orange,
        primarySwatch: Colors.lightBlue,
        splashColor: Colors.green,

        // Define the default font family.
        fontFamily: 'Schyler',

        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.w600),
          headline6: TextStyle(fontSize: 36.0, fontWeight: FontWeight.w300),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      home: screens.LoginScreen(),
    ),
  );
}
