import 'package:flutter/material.dart';

class CvPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CvPageState();
  }
}

class CvPageState extends State<CvPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Crear CV',
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                _listElement('Experiencia previa'),
                Divider(
                  height: 1,
                ),
                _listElement('Idiomas'),
                Divider(
                  height: 1,
                ),
                _listElement('Conocimientos'),
                Divider(
                  height: 1,
                ),
                _listElement('Referencias Personales'),
                Divider(
                  height: 1,
                ),
                _listElement('Referencias Empresariales'),
                Divider(
                  height: 1,
                ),
                _listElement('Competencias personales'),
                Divider(
                  height: 1,
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {Navigator.pop(context, );},
        child: Icon(Icons.save),
      ),
    );
  }

  Widget _listElement(textTitle) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Text(textTitle),
          Spacer(),
          Icon(Icons.add),
        ],
      ),
    );
  }
}
