import 'package:employement_app/pages/HomePage.dart';
import 'package:employement_app/pages/Offers.dart';
import 'package:employement_app/pages/Profile.dart';
import 'package:flutter/material.dart';

import 'MainView.dart';
import 'Offers.dart';
import 'Profile.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterPage> {
  bool _agreedToTOS = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 65.0),
          textBoxFormatter('Nickname'),
          textBoxFormatter('Nombre Completo'),
          textBoxFormatter('Correo Electronico'),
          textBoxFormatter('Contraseña'),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 36),
            child: Row(
              children: <Widget>[
                Checkbox(
                  value: _agreedToTOS,
                  onChanged: _setAgreedToTOS,
                ),
                GestureDetector(
                  onTap: () => _setAgreedToTOS(!_agreedToTOS),
                  child: const Text(
                    'Acepto los terminos y condiciones',
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 36, vertical: 15),
            child: Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(30.0),
              color: Colors.deepPurple,
              child: MaterialButton(
                minWidth: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    new MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: Text("Registrar",
                    textAlign: TextAlign.center,
                    style: style.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
          ),
        ],
      ),
    ));
  }

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  textBoxFormatter(text) {
    return Padding(
      padding: EdgeInsets.fromLTRB(36.0, 15.0, 36.0, 15.0),
      child: TextField(
        style: style,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: text,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      ),
    );
  }

  bool _submittable() {
    return _agreedToTOS;
  }

  void _submit() {
    print('Form submitted');
  }

  void _setAgreedToTOS(bool newValue) {
    setState(() {
      _agreedToTOS = newValue;
    });
  }
}

BottomNavigationBarItem _bottomIcons(IconData icon) {
  return BottomNavigationBarItem(icon: Icon(icon), title: Text(""));
}
