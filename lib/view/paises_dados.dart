import 'package:flutter/material.dart';
import 'package:sigla_pais_app/service/requisicao.dart';

class PaisesDados extends StatefulWidget {
  @override
  _PaisesDadosState createState() => _PaisesDadosState();
}

class _PaisesDadosState extends State<PaisesDados> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          FutureBuilder(
              future: Requisicao.requisicaoPaises(),
              builder: (BuildContext context, AsyncSnapshot<List> snapshop) {
                if (snapshop.hasData) {
                  List paises = snapshop.data;
                  return _listaPaises(paises);
                } else {
                  return Container(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(50.0),
                      child:
                          Text("Aguarde...", style: TextStyle(fontSize: 16.0)),
                    ),
                  );
                }
              })
        ],
      ),
    );
  }
}
