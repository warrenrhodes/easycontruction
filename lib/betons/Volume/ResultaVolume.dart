import 'package:editable/editable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'AnalyseValeurVolume.dart';

class ResultatVolume extends StatelessWidget {
  ResultatVolume(
      {Key key,
      @required this.typedeVolume,
      this.largeur,
      this.epaisseur,
      this.longueur,
      this.volume,
      this.sable,
      this.gravier})
      : super(key: key);
  final String sable, gravier;
  final String typedeVolume;
  final String largeur;
  final String epaisseur;
  final String longueur;
  final String volume;

  AnalyseVolume calcule;
  final _editableKey = GlobalKey<EditableState>();
  @override
  Widget build(BuildContext context) {
    calcule = AnalyseVolume(
        typedeVolume, longueur, largeur, epaisseur, sable, gravier, volume);

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
        "quantite": calcule.volumee,
        "unite": 'm³',
        "prix": "/",
      },
      {
        "description": "Ciment",
        "quantite": calcule.qtciment(),
        "unite": 'Sacs 50kg',
        "prix": "/",
      },
      {
        "description": "Sable",
        "quantite": calcule.qtSable(),
        "unite": 'kg',
        "prix": "/",
      },
      {
        "description": "Gravier",
        "quantite":calcule.qtAgregat(),
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultat Volume'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                color: Colors.black,
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(8),
                child: Text(
                  " 1 Ciment : $sable Sable : $gravier Gravier",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),
                ),
              ),
              Container(
                color: Colors.black12,
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "Donnée Générale",
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
          ),
        ),
      ),
    );
  }
}
