import 'package:employement_app/pages/cvPage.dart';
import 'package:employement_app/pages/themeProvider.dart';
import 'package:flutter/material.dart';
import 'package:employement_app/pages/globals.dart' as global;
import 'package:provider/provider.dart';

import '../textTheme.dart';

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

bool filledCv;

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
                  radius: 50,
                  child: Icon(
                    Icons.person,
                    size: 50,
                  ),
                ),
                _textFormater('Profile Name'),
                _textFormater('Email@email.com'),
                _textFormater('+57 123 4567890'),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: RaisedButton(
                    child: Text('Ver hoja de vida'),
                    onPressed: filledCv == null
                        ? null
                        : () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CvPage(
                                  cameFromFloating: false,
                                ),
                              ),
                            );
                          },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: RaisedButton(
                    child: Text('Cambiar tema'),
                    onPressed: () {
                      Provider.of<ThemeProvider>(context, listen: false)
                            .changeTheme();
                      setState(() {
                        true;
                      });
                    }                        
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
        child: filledCv == null ? Icon(Icons.add) : Icon(Icons.edit),
      ),
    );
  }

  markCvAsFilled() {
    filledCv = true;
  }
}
