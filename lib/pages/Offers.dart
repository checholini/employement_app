import 'package:employement_app/pages/Details.dart';
import 'package:flutter/material.dart';
import 'package:employement_app/dummies/DummyOffers.dart';

class Offers extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OfferState();
  }
}

class OfferState extends State<Offers> {
  @override
  Widget build(BuildContext context) {
    Widget content;
    var shortestSide = MediaQuery.of(context).size.shortestSide;

    if (shortestSide < 600) {
      content = _singleViewLayout();
    } else {
      content = _singleViewLayout();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Ofertas'),
      ),
      body: content,
    );
  }

  Widget _singleViewLayout() {
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
              IconButton(
                icon: Icon(Icons.chevron_right),
                iconSize: 42,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Detail(
                        oferta: ofertasDummy[i],
                        isInDualView: true,
                        comesFromMain: false,
                      ),
                    ),
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _dualViewLayout() {}
}
