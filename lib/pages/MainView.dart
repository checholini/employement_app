import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MainState();
  }
}

class MainState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            'Aca apareceran las ofertas a las que hayas aplicado\n\nPara aplicar a una oferta ve a la pestaña de ofertas',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 36,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
