import 'package:employement_app/models/offertModel.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainState();
  }
}

List<Offert> _ofertasAceptadas = [];

class MainState extends State<MainView> {
  Widget content;

  @override
  Widget build(BuildContext context) {
    var shortestSide = MediaQuery.of(context).size.shortestSide;

    if (shortestSide < 600) {
      content = _singleViewLayout();
    } else {
      //content = _dualViewLayout();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio'),
      ),
      body: content,
    );
  }

  Widget _singleViewLayout() {
    return determineSingleView();
  }

  /*
  Widget _dualViewLayout() {
    
  }*/

  determineSingleView() {
    if (_ofertasAceptadas.length == 0) {
      return Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 70),
          child: Column(
            children: <Widget>[
              Icon(
                Icons.business_center,
                size: 90,
                color: Colors.grey,
              ),
              Text(
                '\nAca apareceran las ofertas a las que hayas aplicado\n\nPara aplicar a una oferta ve a la pestaña de ofertas',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return new ListView.builder(
        itemCount: _ofertasAceptadas.length,
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
                      title: new Text(_ofertasAceptadas[i].title),
                      subtitle: new Text(
                          'Ofertado por: ' + _ofertasAceptadas[i].enterprise),
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
                      arguments: [_ofertasAceptadas[i], false],
                    );
                  },
                ),
              ],
            )
          ],
        ),
      );
    }
  }

  void pushOffer(oferta) {
    _ofertasAceptadas.add(oferta);
  }

  void removeOffer(oferta) {
    _ofertasAceptadas.remove(oferta);
  }
}
