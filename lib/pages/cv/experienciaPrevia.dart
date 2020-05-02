import 'package:flutter/material.dart';

class experienciaPrevia extends StatelessWidget {
  final List<String> experiencia;
  experienciaPrevia(this.experiencia);

  Widget _buildExperienciaList(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Text(experiencia[index])
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: _buildExperienciaList,
      itemCount: experiencia.length,
    );
  }
}