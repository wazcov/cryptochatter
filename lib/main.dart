import 'package:cryptochatter/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cryptochatter/ui/index.dart' as screens;

void main() {
  runApp(
    MaterialApp(
      title: 'Passing Data',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFEFEFEF),
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
          headline1: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w600, color: Colors.black),
          headline2: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300, color: Colors.black45),
          bodyText2: TextStyle(fontSize: 12.0, fontFamily: 'Hind'),
        ),
      ),
      home: screens.LoginScreen(),
    ),
  );
}
