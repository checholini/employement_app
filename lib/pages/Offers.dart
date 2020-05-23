import 'package:employement_app/models/offertModel.dart';
import 'package:employement_app/pages/Details.dart';
import 'package:employement_app/pages/MainView.dart';
import 'package:flutter/material.dart';
import 'package:employement_app/dummies/DummyOffers.dart';

class Offers extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OfferState();
  }
}

Offert ofertaCallback;

class OfferState extends State<Offers> {
  @override
  Widget build(BuildContext context) {
    Widget content;
    var orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.portrait) {
      content = _singleViewLayout();
    } else {
      content = _dualViewLayout();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Ofertas'),
      ),
      body: content,
    );
  }

  Widget _singleViewLayout() {
    return itemList(false);
  }

  Widget _dualViewLayout() {
    return Row(
      children: <Widget>[
        Flexible(
          flex: 1,
          child: Material(
            elevation: 4.0,
            child: itemList(true),
          ),
        ),
        Flexible(
          flex: 3,
          child: Detail(
            oferta: ofertaCallback,
            isInDualView: true,
            comesFromMain: false,
          ),
        ),
      ],
    );
  }

  Widget itemList(bool isDualView) {
    return new ListView.builder(
      itemCount: ofertasDummy.length,
      itemBuilder: (context, i) => new Column(
        children: <Widget>[
          new Divider(
            height: 10,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: new ListTile(
                    title: new Text(ofertasDummy[i].title),
                    subtitle:
                        new Text('Ofertado por: ' + ofertasDummy[i].enterprise),
                  ),
                ),
              ),
              determineButtonFunction(isDualView, i),
            ],
          )
        ],
      ),
    );
  }

  determineButtonFunction(bool isInDualView, int i) {
    return !isInDualView
        ? IconButton(
            icon: Icon(Icons.chevron_right),
            iconSize: 42,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (content) => Detail(
                    isInDualView: false,
                    oferta: ofertasDummy[i],
                    comesFromMain: false,
                  ),
                ),
              );
            },
          )
        : IconButton(
            icon: Icon(Icons.chevron_right),
            iconSize: 42,
            onPressed: () {
              setState(() {
                ofertaCallback = ofertasDummy[i];
              });
            },
          );
  }

  clearCallback() {
    ofertaCallback = null;
  }
}
