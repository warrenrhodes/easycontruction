import 'package:flutter/material.dart';
import 'package:flutter_app2/betons/poutre/AnalyseValeurPoutre.dart';
import 'package:editable/editable.dart';
import 'package:flutter_app2/model.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
class Resultat extends StatelessWidget {
  Resultat(
      {Key key,
      this.longueur,
      this.epaisseur,
      this.hauteur,
      this.sable,
      this.gravier,
      this.espacement,
      this.quantite,
      this.nbrebar})
      : super(key: key);
  final String gravier;
  final String sable;
  final String hauteur;
  final String epaisseur;
  final String longueur;
  final String nbrebar;
  final String quantite;
  final String espacement;

  AnalysePourtre calcule;
  final _editableKey = GlobalKey<EditableState>();
  final _editableKeys = GlobalKey<EditableState>();
  @override
  Widget build(BuildContext context) {
    calcule = AnalysePourtre(longueur, epaisseur, hauteur ,quantite);
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

        "description": "Volume",
        "quantite": calcule.volumepoteau,
        "unite": 'm³',
        "prix": "/",
      },
      {
        "description": "Ciment",
        "quantite": calcule.qtciment(sable, gravier)
        ,
        "unite": 'Sacs 50kg',
        "prix": double.parse(calcule.qtciment(sable, gravier)).ceil() * int.parse(Model.value.ciment50),
        
      },
      {
        "description": "Sable",
        "quantite": calcule.qtSable(sable),
        "unite": 'kg',
        "prix": "/",
      },
      {
        "description": "Gravier",
        "quantite":calcule.qtAgregat(gravier),
        "unite": 'kg',
        "prix": "/",
      },
      {
        "description": "Eau",
        "quantite": calcule.qtEau(),
        "unite": 'L',
        "prix": "/",
      },
    ];
    List rows_poutre = [
      {
        "description": "Nombre De Bar Fer${Model.value.fer}",
        "quantite": calcule.nbrBarpoteau(quantite, nbrebar).ceil().toString(),
        "unite": '1/12 M',
        "prix": "${calcule.nbrBarpoteau(quantite, nbrebar).ceil() *double.parse(Model.value.prixfer)} ${Model.value.devise}"
      },
      {
        "description": "Nombre De Bar Fer 6 Pour Cadre",
        "quantite":double.parse(calcule.nbrBarCadre(espacement, quantite)).ceil(),
        "unite": '1/12m',
        "prix": "${double.parse(calcule.nbrBarCadre(espacement, quantite)).ceil() * int.parse(Model.value.prixfer6)} ${Model.value.devise}",
      },
      {
        "description": "Quantité de cadre",
        "quantite":calcule.quantitecadre,
        "unite": 'un',
        "prix": "/",
      },

    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("Resultat"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(8),
                color: Colors.black,
                child: Text(
                  " 1 Ciment : $sable Sable : $gravier Gravier",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),
                ),
              ),
              Container(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    children: [
                      Container(
                        color: Colors.black12,
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          "Donnée générale",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height/2 + 50,
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
                  )),
              Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Container(
                        color: Colors.black12,
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          "Donnée Poutre",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height/2 + 50,
                        child: Editable(
                          key: _editableKeys,
                          columns: cols,
                          rows: rows_poutre,
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
                      )
                    ],
                  )),
              Container(
                child: Text("NB : Par default le fer est de 6 mm d'épaisseur est  utilisé"
                    " pour la réalisation des cadres "),

              )
            ],
          ),
        ),
      ),
    );
  }

}
