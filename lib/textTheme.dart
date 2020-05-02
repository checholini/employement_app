import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData bright = new ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.lightGreenAccent[400],
  accentColor: Colors.amber[500],
  textTheme: GoogleFonts.solwayTextTheme(),
);

ThemeData dark = new ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.grey[900],
  accentColor: Colors.deepOrange[500],
  textTheme: GoogleFonts.inconsolataTextTheme(),
);

ThemeData basic = new ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.deepPurple[800],
  accentColor: Colors.teal[600],

  fontFamily: "Ubuntu",
);
