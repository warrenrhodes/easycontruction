import 'package:editable/editable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app2/model.dart';
import 'AnalyseDonneMur.dart';

class Buildwall extends StatelessWidget {
  Buildwall({
    Key key,
    @required this.type_de_surface,
    this.hauteur_p,
    this.epaisseur_p,
    this.longueur_p,
    this.longueur_surf,
    this.hauteur_surf,
    this.zone,
    this.ouverture,
    this.epaisseur_M,
  }) : super(key: key);
  final String type_de_surface;
  final String epaisseur_M;
  final String hauteur_p;
  final String epaisseur_p;
  final String longueur_p;
  final String zone;
  final String ouverture;
  final String hauteur_surf;
  final String longueur_surf;
  String prixciment = Model.value.ciment50;
  String prixparpaing = Model.value.prixParpaint;
  String momaie = Model.value.devise;

  final Calcul calcule = Calcul();
  @override
  Widget build(BuildContext context) {
    final _editableKey = GlobalKey<EditableState>();
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

    List rows = [
      {
        "description": "Bloc",
        "quantite": calcule.Nbre_parpaing(
    type_de_surface,
    hauteur_p,
    longueur_p,
    zone,
    ouverture,
    hauteur_surf,
    longueur_surf,
    epaisseur_M,
    epaisseur_p),
        "unite": 'un',
        "prix": "${(double.parse(calcule.Nbre_parpaing(
    type_de_surface,
    hauteur_p,
    longueur_p,
    zone,
    ouverture,
    hauteur_surf,
    longueur_surf,
    epaisseur_M,
    epaisseur_p))*double.parse(prixparpaing)).ceil()}"
    " $momaie",
      },
      {
        "description": "Mortier",
        "quantite": calcule.quantiteMotier,
        "unite": 'm³',
        "prix": "/",
      },
      {
        "description": "Ciment",
        "quantite": calcule.nbreSacCiment(),
        "unite": 'Sacs 50kg',
        "prix": "${(double.parse(calcule.nbreSacCiment())*double.parse(prixciment)).ceil()}  "
            "$momaie",
      },
      {
        "description": "Sable",
        "quantite": calcule.qteSable(),
        "unite": 'kg',
        "prix": "/",
      },
      {
        "description": "Eau",
        "quantite": calcule.qteEau(),
        "unite": 'L',
        "prix": "/",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                color: Colors.black,
                child: Text(
                  " Parpaing : $epaisseur_p Cm : $hauteur_p Cm : $longueur_p Cm",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.white),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height/2 + 50,
                child: Editable(
                  key: _editableKey,
                  columns: cols,
                  rows: rows,
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
              Text(
                  "Nb: les consommations annoncées dans les tableaux de calculs sont  théoriques,"" indicatives et peuvent différer sensiblement en fonction des conditions de chantier, des habitudes de pose, des divers produits. "
                  "En tout état de cause nous ne saurions être tenus pour responsables si les consommations exactes chantier étaient différentes de celles annoncées dans nos calculs."
                  "calcule Base sur la regle 1M³ pour 400Kg de ciment et 1400Kg de sable"
                  ""
                  "ne pas oublier de conciderer un pourcentage de chute de 10-15%"),
            ],
          ),
        ),
      ),
    );
  }
}
