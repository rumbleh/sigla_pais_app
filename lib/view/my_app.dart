import 'package:flutter/material.dart';
import 'paises_screen.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sigla dos Países',
      theme: ThemeData(primaryColor: Colors.orangeAccent),
      home: PaisesScreen(),
    );
  }
}
