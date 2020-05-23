import 'package:employement_app/pages/Profile.dart';
import 'package:flutter/material.dart';

class CvPage extends StatefulWidget {
  final bool cameFromFloating;
  CvPage({this.cameFromFloating});
  @override
  State<StatefulWidget> createState() {
    return CvState(cameFromFloating: cameFromFloating);
  }
}

class CvState extends State<CvPage> {
  final bool cameFromFloating;
  CvState({this.cameFromFloating});

  static List<Entry> _subIdiomas = [];
  static List<Entry> _subConocimientos = [];
  static List<Entry> _subCompetencias = [];
  static List<Entry> _subRefPersonales = [];
  static List<Entry> _subRefEmpresariales = [];
  String _selected;
  String _fieldInput;

  static Entry _idiomas = Entry(
    'Idiomas',
    _subIdiomas,
  );

  static Entry _conocimientos = Entry(
    'Conocimientos',
    _subConocimientos,
  );

  static Entry _competentencias = Entry(
    'Competencias',
    _subCompetencias,
  );

  static Entry _refPersonales = Entry(
    'Referencias Personales',
    _subRefPersonales,
  );

  static Entry _refEmpresariales = Entry(
    'Referencias Personales',
    _subRefEmpresariales,
  );

  List<Entry> cvData = <Entry>[
    _idiomas,
    _conocimientos,
    _competentencias,
    _refPersonales,
    _refEmpresariales
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: cameFromFloating == null
            ? const Text('Crear CV')
            : const Text('Mi CV'),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            EntryItem(cvData[index]),
        itemCount: cvData.length,
      ),
      persistentFooterButtons: cameFromFloating == null
          ? <Widget>[
              GestureDetector(
                child: Row(
                  children: <Widget>[
                    Icon(Icons.add),
                    Text('Añadir campo'),
                  ],
                ),
                onTap: () => {this.showSimpleCustomDialog(context)},
              )
            ]
          : null,
      floatingActionButton: cameFromFloating == null
          ? FloatingActionButton(
              onPressed: () {
                ProfileState().markCvAsFilled();
                Navigator.pop(
                  context,
                );
              },
              child: Icon(Icons.save),
            )
          : null,
    );
  }

  void showSimpleCustomDialog(BuildContext context) {
    Dialog simpleDialog = Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        height: 300.0,
        width: 300.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Seleccione Una categoria',
                style: TextStyle(fontSize: 22),
              ),
            ),
            DropdownButton<String>(
              value: _selected,
              items: <String>[
                "Idiomas",
                "Competencias",
                'Conocimientos',
                'Referencias Personales',
                'Referencias Empresariales'
              ].map((String val) {
                return new DropdownMenuItem<String>(
                  value: val,
                  child: new Text(val),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _selected = newValue;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: TextField(
                onChanged: (text) {
                  _fieldInput = text;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  RaisedButton(
                    color: Colors.blue,
                    onPressed: () {
                      switch (_selected) {
                        case "Idiomas":
                          setState(() => {_subIdiomas.add(Entry(_fieldInput))});
                          break;
                        case "Competencias":
                          setState(
                              () => {_subCompetencias.add(Entry(_fieldInput))});
                          break;
                        case "Conocimientos":
                          setState(() =>
                              {_subConocimientos.add(Entry(_fieldInput))});
                          break;
                        case "Referencias Personales":
                          setState(() =>
                              {_subRefPersonales.add(Entry(_fieldInput))});
                          break;
                        case "Referencias Empresariales":
                          setState(() =>
                              {_subRefEmpresariales.add(Entry(_fieldInput))});
                          break;
                      }
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Añadir',
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  RaisedButton(
                    color: Colors.red,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Cancelar',
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
    showDialog(
        context: context, builder: (BuildContext context) => simpleDialog);
  }
}

// One entry in the multilevel list displayed by this app.
class Entry {
  Entry(this.title, [this.children = const <Entry>[]]);

  final String title;
  final List<Entry> children;
}

// Displays one Entry. If the entry has children then it's displayed
// with an ExpansionTile.
class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) return ListTile(title: Text(root.title));
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.title),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}
