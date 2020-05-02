import 'package:flutter/material.dart';

ThemeData bright = new ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.lightGreenAccent[400],
  accentColor: Colors.amber[500],

  fontFamily: "EricaOne",
);

ThemeData dark = new ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.grey[900],
  accentColor: Colors.deepOrange[500],

  fontFamily: "Raleway",
);

ThemeData basic = new ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.deepPurple[800],
  accentColor: Colors.teal[600],

  fontFamily: "Ubuntu",
);
