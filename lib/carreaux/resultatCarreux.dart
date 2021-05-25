import 'package:editable/editable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app2/model.dart';

import 'AnalyseValeurCarreaux.dart';

class ResultatCarreaux extends StatelessWidget {
  ResultatCarreaux(
      {Key key,
      @required this.type_de_surface,
      this.largeurC,
      this.longueurC,
      this.longueur_surf,
      this.hauteur_surf,
      this.zone,
      this.ouverture,
      this.epaisseurCarreaux,
      this.largeurjoint})
      : super(key: key);
  final String type_de_surface;
  final String largeurC;
  final String longueurC;
  final String zone;
  final String ouverture;
  final String hauteur_surf;
  final String longueur_surf;
  final String epaisseurCarreaux;
  final String largeurjoint;

  Calcul calcul;
  final _editableKey = GlobalKey<EditableState>();
  @override
  Widget build(BuildContext context) {
    calcul = Calcul(typeSurface: type_de_surface, largeurC: largeurC,longueurC: longueurC,
    longueurS: longueur_surf,largeurjoint: largeurjoint, hauteurS: hauteur_surf, eppaisseurcarreaux: epaisseurCarreaux
    ,ouverture:  ouverture, zone: zone);

    List cols = [
      {
        "title": 'Description',
        'widthFactor': 0.3,
        'key': 'description',
        'editable': false
      },
      {"title": 'Quantite', 'widthFactor': 0.25, 'key': 'quantite'},
      {"title": 'Unite', 'widthFactor': 0.25, 'key': 'unite'},
      {"title": 'Prix', 'widthFactor': 0.25,'key': 'prix'},
    ];

    List rows_general = [
      {
        "description": "Surperficie Total",
        "quantite": calcul.surfaces,
        "unite": 'm²',
        "prix": "/",
      },
      {
        "description": "Carreaux",
        "quantite": calcul.nbrCarreaux(),
        "unite": '1',
        "prix": "/",
      },

      {
        "description": "Quantite de colle",
        "quantite": calcul.QteColle(),
        "unite": 'kg',
        "prix": "/",
      },
      {
        "description": "Ciment Colle",
        "quantite": calcul.QteCiment(),
        "unite": 'Sac 20Kg',
        "prix": "${(double.parse(calcul.QteCiment()) * double.parse(Model.value.ciment20)).ceil()} ${Model.value.devise}",
      },

      {
        "description": "Ciment pour joint",
        "quantite": calcul.qtecimentjoins,
        "unite": 'Sac 50KG',
        "prix": "${(double.parse(calcul.qtecimentjoins) * double.parse(Model.value.ciment50)).ceil()} ${Model.value.devise}",
      },
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultat'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(5),
                child: Text(
                  " Carreau : $longueurC Cm : $largeurC Cm",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                child: Editable(
                  key: _editableKey,
                  columns: cols,
                  rows: rows_general,
                  zebraStripe: true,
                  stripeColor1: Colors.brown.shade200,
                  stripeColor2: Colors.blue[50],
                  onRowSaved: (value) {
                    print(value);
                  },
                  onSubmitted: (value) {
                    print(value);
                  },
                  borderColor: Colors.black,
                  tdStyle: TextStyle(fontWeight: FontWeight.bold),
                  trHeight: 80,
                  thStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  thAlignment: TextAlign.center,
                  thVertAlignment: CrossAxisAlignment.end,
                  thPaddingBottom: 3,
                  showSaveIcon: false,
                  saveIconColor: Colors.black,
                  showCreateButton: false,
                  tdAlignment: TextAlign.center,
                  tdEditableMaxLines: 100, // don't limit and allow data to wrap
                  tdPaddingTop: 20,
                  tdPaddingBottom: 14,
                  tdPaddingLeft: 10,
                  tdPaddingRight: 8,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.all(Radius.circular(0))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
