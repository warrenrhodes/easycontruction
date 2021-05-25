import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Propos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("A Propos",),
        centerTitle: true,
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          SystemChannels.textInput.invokeMethod("TextInput.hide");
        },
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                test("Easy Construction est une application utile au calcule des matériaux de construction tels que:\n"
            "- le calcul de la quantité de mortier et du nombre de parpaing  nécessaires à la réalisation d'un mur.\n"
          "- évaluer la quantité de fer, ciment, sable, eau et granulats nécessaires à la réalisation d'un poteau, d'une poutre et d'un volume donné de béton.\n"
                    "- Évaluer le nombre de carreaux, de ciment ordinaire, de colle de ciment requis pour la pose des carreaux\n"
                    "- Evaluer la quantité de béton, ciment, sable, eau et granulats pour le coulage d'une dalle pleine, coulage d'un sol, béton de propreté, etc ..... "),
              ],
            ),
          ),
        ),
      ),
    );
  }
   test(String text){
    return Text(text, style:
      TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,

      ),);
   }
}
