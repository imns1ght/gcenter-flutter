import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.purple[800],
    accentColor: Colors.cyan[600],
    fontFamily: 'Roboto',
    textTheme: TextTheme(
      headline1: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
      headline2: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
      headline3: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
      headline4: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
      headline5: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      headline6: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
      bodyText1: TextStyle(fontSize: 14.0),
    ),
    hintColor: Colors.white,
    dividerColor: Colors.white,
    buttonColor: Colors.white,
    cardColor: Colors.white,
    scaffoldBackgroundColor: Colors.grey[200],
    canvasColor: Colors.black,
  );
}
