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
    return Scaffold(
      appBar: AppBar(
        title: Text('Ofertas'),
      ),
      body: new ListView.builder(
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
                      subtitle: new Text('Ofertado por: ' + ofertasDummy[i].enterprise),
                    ),
                  ),
                ),
                IconButton(
                    icon: Icon(Icons.chevron_right),
                    iconSize: 42,
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        '/detalles',
                        arguments: (
                          ofertasDummy[i]
                        )
                      );
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }

}
