import 'package:flutter/material.dart';
import 'package:sigla_pais_app/service/requisicao.dart';
import 'package:sigla_pais_app/view/menu.dart';
import 'package:sigla_pais_app/view/paises_dados.dart';

class PaisesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Siglas dos países"),
        actions: [IconButton(icon: Icon(Icons.refresh), onPressed: () {})],
      ),
      body: PaisesDados(),
      drawer: Menu(),
    );
  }
}
