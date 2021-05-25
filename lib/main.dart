import 'package:flutter/material.dart';
import 'package:flutter_app2/carreaux/carrelage.dart';
import 'package:flutter_app2/dalle/Dosage.dart';
import 'package:flutter_app2/dalle/dalle.dart';
import './myhomepage.dart';
import 'mur/mur.dart';
import 'mur/builwall.dart';
import 'betons/compositionBeton.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor:Colors.brown.shade700,
        buttonColor: Colors.white,
        buttonTheme: ButtonThemeData(buttonColor: Colors.brown.shade700,),
        /*highlightColor: Colors.black,*/
      ),
      debugShowCheckedModeBanner: false,
      title: 'Contruction App',
      home: MyHomePage(),
      routes: <String, WidgetBuilder>{
        './mur.dart': (context) => Murs(),
        './compositionBeton.dart': (context) => Beton(),
        './dalle.dart': (context) => Dosage(),
        './carrelage.dart': (context) => Carreaux(),
      },
    );
  }
}
