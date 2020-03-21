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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _titleFormat(oferta.title),
            _div,
            _titleFormat('Ofertado por: '),
            _textFormat(oferta.enterprise),
            _div,
            _titleFormat('Descripcion de la oferta:'),
            _textFormat(oferta.details),
            _div,
            _titleFormat('Conocimientos Requeridos'),
            requirements(oferta),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pop(context);
        },
        label: Text('Aplicar'),
        icon: Icon(Icons.check),
      ),
    );
  }
}

Widget _div = Padding(
  child: Divider(
    height: 1,
  ),
  padding: EdgeInsets.symmetric(horizontal: 36, vertical: 10),
);

_titleFormat(text) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 36, vertical: 10),
    child: Text(
      text,
      textAlign: TextAlign.left,
      style: TextStyle(
        fontSize: 28,
      ),
    ),
  );
}

_textFormat(text) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 36, vertical: 10),
    child: Text(
      text,
      textAlign: TextAlign.left,
      style: TextStyle(
        fontSize: 24,
        color: Colors.grey,
      ),
    ),
  );
}

_listFormat(text) {
  return Text(
    '   '+text,
    textAlign: TextAlign.left,
    style: TextStyle(
      fontSize: 18,
      color: Colors.grey,
    ),
  );
}

requirements(oferta) {
  return new ListView.builder(
    shrinkWrap: true,
    itemCount: oferta.requirements.length,
    itemBuilder: (context, i) => new Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 36, vertical: 10),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.check_circle,
              size: 20,
            ),
            _listFormat(oferta.requirements[i]),
          ],
        ),
      ),
    ),
  );
}
