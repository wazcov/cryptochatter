import 'package:flutter/material.dart';
import 'package:cryptochatter/ui/screens/index.dart' as screens;

void main() {
  runApp(
    MaterialApp(
      title: 'Passing Data',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black87,
        colorScheme: ColorScheme.dark().copyWith(
          background: Colors.black45,
          primary: Colors.green,
          onPrimary: Colors.white,
          secondary: Colors.orange,
          onSecondary: Colors.black45,
          surface: Colors.blueAccent,
          onSurface: Colors.white,
          error: Colors.purple,
          onError: Colors.black45,
          onBackground: Color(0xFF999999),
        ),

        // Define the default font family.
        fontFamily: 'Schyler',

        textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 30.0, fontWeight: FontWeight.w600, color: Colors.white),
          headline2: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w300,
              color: Color(0xFFDDDDDD)),
          bodyText1: TextStyle(fontSize: 14.0, fontFamily: 'Hind', color: Colors.white),
          bodyText2: TextStyle(fontSize: 12.0, fontFamily: 'Hind', color: Colors.white38),
        )
      ),
      home: const screens.LoginScreen(),
    ),
  );
}
