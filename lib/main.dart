import 'package:employement_app/pages/Details.dart';
import 'package:flutter/material.dart';

import 'pages/HomePage.dart';
import 'pages/Details.dart';

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
      home: HomePage(),
      routes: {
        '/detalles': (context) => Details(),
      },
    );
  }
}
