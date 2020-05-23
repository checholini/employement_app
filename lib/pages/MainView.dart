import 'package:employement_app/models/offertModel.dart';
import 'package:employement_app/pages/Details.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainState();
  }
}

List<Offert> _ofertasAceptadas = [];
Offert ofertaCallback;

class MainState extends State<MainView> {
  Widget content;

  @override
  Widget build(BuildContext context) {
    var shortestSide = MediaQuery.of(context).size.shortestSide;

    if (shortestSide < 600) {
      content = _singleViewLayout();
    } else {
      content = _dualViewLayout();
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

  Widget _dualViewLayout() {
    return determineDualView();
  }

  determineDualView() {
    if (_ofertasAceptadas.length == 0) {
      return SingleChildScrollView(
          child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 70),
          child: SingleChildScrollView(
              child: Column(
            children: <Widget>[
              Icon(
                Icons.business_center,
                size: 90,
                color: Colors.grey,
              ),
              SingleChildScrollView(
                  child: Text(
                'Aca apareceran las ofertas a las que hayas aplicado',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              )),
              SingleChildScrollView(
                  child: Text(
                'Para aplicar a una oferta ve a la pestaña de ofertas',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              )),
            ],
          )),
        ),
      ));
    }
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
            comesFromMain: true,
          ),
        ),
      ],
    );
  }

  determineSingleView() {
    if (_ofertasAceptadas.length == 0) {
            return SingleChildScrollView(
          child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 70),
          child: SingleChildScrollView(
              child: Column(
            children: <Widget>[
              Icon(
                Icons.business_center,
                size: 90,
                color: Colors.grey,
              ),
              SingleChildScrollView(
                  child: Text(
                'Aca apareceran las ofertas a las que hayas aplicado',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.grey,
                ),
              )),
              SingleChildScrollView(
                  child: Text(
                '\n\nPara aplicar a una oferta ve a la pestaña de ofertas',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.grey,
                ),
              )),
            ],
          )),
        ),
      ));
    } else {
      return itemList(false);
    }
  }

  void pushOffer(oferta) {
    _ofertasAceptadas.add(oferta);
  }

  void removeOffer(oferta) {
    ofertaCallback = null;
    _ofertasAceptadas.remove(oferta);
  }

  Widget itemList(bool isDualView) {
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
                    oferta: _ofertasAceptadas[i],
                    comesFromMain: true,
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
                ofertaCallback = _ofertasAceptadas[i];
              });
            },
          );
  }
}
