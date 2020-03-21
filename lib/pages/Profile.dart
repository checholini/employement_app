import 'package:employement_app/pages/cvPage.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProfileState();
  }
}

const _defaultPadding = EdgeInsets.symmetric(horizontal: 8, vertical: 20);

_textFormater(text) {
  return Padding(
    padding: _defaultPadding,
    child: Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 30,
      ),
    ),
  );
}

class ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: _defaultPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                CircleAvatar(
                  radius: 86,
                  child: Icon(
                    Icons.person,
                    size: 86,
                  ),
                ),
                _textFormater('Profile Name'),
                _textFormater('Email@email.com'),
                _textFormater('+57 123 4567890'),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: RaisedButton(
                    child: Text('Ver hoja de vida'),
                    onPressed: null,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/cv');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
