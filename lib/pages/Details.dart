import 'package:flutter/material.dart';
import 'package:employement_app/models/offertModel.dart';

class Details extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DetailState();
  }
}

class DetailState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    Offert oferta = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle de la oferta'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Text(oferta.title),
            Text(oferta.enterprise),
            Text(oferta.details),
          ],
        ),
      ),
    );
  }
}
