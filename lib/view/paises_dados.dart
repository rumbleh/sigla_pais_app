import 'package:flutter/material.dart';
import 'package:sigla_pais_app/service/requisicao.dart';

class PaisesDados extends StatefulWidget {
  final String pais;

  PaisesDados({this.pais});

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
                  return _listaPaises(
                      _filtraPais(widget.pais, paises, context));
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
                        child: ListTile(
                          title: Text(
                            "${paises[index]["name"]}",
                            style: TextStyle(
                                color: Colors.orangeAccent,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "${paises[index]["code"] ?? '--'}",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0),
                              ),
                            ),
                          ),
                        ),
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

  List _filtraPais(String pais, List paises, BuildContext context) {
    List filtro = List();
    paises.forEach((p) {
      if (p["name"].toUpperCase().contains(pais.toUpperCase())) {
        filtro.add(p);
      }
    });
    return filtro.isEmpty ? paises : filtro;
  }
}
