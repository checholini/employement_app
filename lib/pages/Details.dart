import 'package:employement_app/pages/HomePage.dart';
import 'package:employement_app/pages/MainView.dart';
import 'package:employement_app/pages/Offers.dart';
import 'package:flutter/material.dart';
import 'package:employement_app/models/offertModel.dart';

class Detail extends StatelessWidget {
  Detail({this.oferta, this.isInDualView, this.comesFromMain});

  final Offert oferta;
  final bool isInDualView;
  final bool comesFromMain;

  @override
  Widget build(BuildContext context) {
    print(isInDualView);
    return oferta != null
        ? Scaffold(
            appBar: !isInDualView
                ? AppBar(
                    title: Text('Detalle de la oferta'),
                  )
                : null,
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
            floatingActionButton: !comesFromMain
                ? applyOfferFloatingButton(context, oferta, isInDualView)
                : removeOfferFloatingButton(context, oferta, isInDualView),
          )
        : Scaffold(
            body: Center(
              child: Text('Selecciona una oferta del menú'),
            ),
          );
  }
}

Widget applyOfferFloatingButton(context, oferta, isInDualView) {
  return !isInDualView
      ? FloatingActionButton.extended(
          onPressed: () {
            MainState().pushOffer(oferta);
            Navigator.pop(context);
            Navigator.pushReplacement(context,
                new MaterialPageRoute(builder: (context) => HomePage()));
          },
          label: Text('Aplicar'),
          icon: Icon(Icons.check),
        )
      : FloatingActionButton.extended(
          onPressed: () {
            MainState().pushOffer(oferta);
            OfferState().clearCallback();
            Navigator.pushReplacement(context,
                new MaterialPageRoute(builder: (context) => HomePage()));
          },
          label: Text('Aplicar'),
          icon: Icon(Icons.check),
        );
}

Widget removeOfferFloatingButton(context, oferta, isInDualView) {
  return !isInDualView
      ? FloatingActionButton.extended(
          onPressed: () {
            MainState().removeOffer(oferta);
            Navigator.pop(context);
          },
          label: Text('Eliminar'),
          icon: Icon(Icons.delete),
        )
      : FloatingActionButton.extended(
          onPressed: () {
            MainState().removeOffer(oferta);
            Navigator.pushReplacement(context,
                new MaterialPageRoute(builder: (context) => HomePage()));
            //MainState().refreshState();
          },
          label: Text('Eliminar'),
          icon: Icon(Icons.delete),
        );
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
      ),
    ),
  );
}

_listFormat(text) {
  return Text(
    '   ' + text,
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
