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
                      child: Text("Carregando...",
                          style: TextStyle(fontSize: 16.0)),
                    ),
                  );
                }
              })
        ],
      ),
    );
  }

  Widget _listaPaises(List paises) {
    return paises != null
        ? Flexible(
            child: ListView.builder(
                itemCount: paises.length,
                itemBuilder: (context, index) {
                  return Container(
                      child: Card(
                        child: ExpansionTile(
                            title: Text("${paises[index]["name"]}"),
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text("${paises[index]["code"]}"),
                              )
                            ]),
                      ),
                      alignment: Alignment.center);
                }))
        : Container(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.all(50.0),
              child: Text("Carregando...", style: TextStyle(fontSize: 16.0)),
            ),
          );
  }
}
