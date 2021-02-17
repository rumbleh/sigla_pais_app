import 'package:flutter/material.dart';
import 'package:sigla_pais_app/service/requisicao.dart';

class PaisesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Siglas dos países"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: FlatButton(
            child: Text("Listagem"),
          onPressed: ()=> {Requisicao.requisicaoPaises()},
        ),
      ),
    );
  }
}
