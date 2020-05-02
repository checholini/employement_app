import 'package:employement_app/pages/Details.dart';
import 'package:employement_app/pages/MainView.dart';
import 'package:employement_app/pages/cvPage.dart';
import 'package:flutter/material.dart';

import 'pages/HomePage.dart';
import 'pages/Details.dart';
import 'pages/LoginPage.dart';
import 'pages/RegisterPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Employement app',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: LoginPage(),
      routes: {
        '/detalles': (context) => Details(),
        '/cv': (context) => CvPage(), 
        '/homePage': (context) => HomePage(),
        '/registerPage':(context) => RegisterPage(),
      },
    );
  }
}
