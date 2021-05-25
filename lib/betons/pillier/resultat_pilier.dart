import 'package:editable/editable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app2/betons/pillier/AnalyseValeurpillier.dart';
import 'package:flutter_app2/model.dart';

class ResultatPilier extends StatelessWidget {
  ResultatPilier(
      {Key key,
      this.longueur,
      this.largeur,
      this.base,
      this.cote,
      this.hauteur,
      this.sable,
      this.gravier,
      this.espacement,
      this.quantite,
      this.nbrebar,
        this.fer,
        this.typePilier,
      this.diametre})
      : super(key: key);
  final String fer;
  final String typePilier;
  final String gravier;
  final String sable;
  final String hauteur;
  final String longueur;
  final String nbrebar;
  final String quantite;
  final String espacement;
  final String largeur;
  final String cote;
  final String base;
  final String diametre;

  AnalysePilier calcule;
  final _editableKey = GlobalKey<EditableState>();
  final _editableKeys = GlobalKey<EditableState>();
  @override
  Widget build(BuildContext context) {
    calcule = AnalysePilier(typePilier, longueur, largeur, base, cote, hauteur,
        sable, gravier, espacement, quantite, nbrebar, diametre);
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
        "quantite": calcule.qtciment(),
        "unite": 'Sacs 50kg',
        "prix": "/",
      },
      {
        "description": "Sable",
        "quantite": calcule.qtSable(sable),
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
    List rows_poutre = [
      {
        "description": "Nombre De Bar Pour Pillier",
        "quantite": calcule.nbrBarpoteau().toString(),
        "unite": '1/12 M',
        "prix": calcule.nbrBarpoteau()*double.parse(Model.value.prixfer),
      },
      {
        "description": "Nombre De Bar Pour Cadre",
        "quantite":calcule.nbrBarCadre(),
        "unite": '1/12m',
        "prix": "/",
      },
      {
        "description": "Quantité de cadre",
        "quantite":calcule.quantitecadre,
        "unite": 'un',
        "prix": double.parse(calcule.quantitecadre) * double.parse(Model.value.prixfer6),
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
                  padding: EdgeInsets.all(15),
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
                      )

                    ],
                  )),
              Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Container(
                        color: Colors.black12,
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          "Donnée Poteau",
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
              /*Container(
                child: Text(
                  "NB: il est important de noté que les données renvoyées respecte les normes"
                      "de ferraillage "
                      ""
                ),
              )*/
            ],
          ),
        ),
      ),
    );
  }

  Widget tableresult() => DataTable(
    dataRowHeight: 70,
        columns: <DataColumn>[
          DataColumn(
            label: Text("Description"),
          ),
          DataColumn(
            label: Text("Quantité"),
          ),
          DataColumn(
            label: Text("Unité"),
          ),
        ],
        rows: [
          DataRow(
            cells: <DataCell>[
              DataCell(Text("Volume")),
              DataCell(Text(calcule.volumepoteau)),
              DataCell(Text("m³"))
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text("Ciment")),
              DataCell(Text(calcule.qtciment())),
              DataCell(Text("Sacs 50.0 kg"))
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text("Sable")),
              DataCell(Text(calcule.qtSable(sable))),
              DataCell(Text("kg"))
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text("Gravier")),
              DataCell(Text(calcule.qtAgregat())),
              DataCell(Text("Kg"))
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text("Eau")),
              DataCell(Text(calcule.qtEau())),
              DataCell(Text("L"))
            ],
          ),
        ],
      );
  Widget poteauresult() => DataTable(
    dataRowHeight: 70,
    columns: <DataColumn>[
      DataColumn(
        label: Container(
            width: 80,
            child: Text("Description")),
      ),
      DataColumn(
        label: Container(
            child: Text("Quantité",)),
      ),
      DataColumn(
        label: Container(
            width: 80,
            child: Text("Unité")),
      ),
    ],
    rows: [
      DataRow(
        cells: <DataCell>[
          DataCell(Text("Nombre De Bar Pour Poutre")),
          DataCell(Text(calcule.nbrBarpoteau().toString())),
          DataCell(Text("un (12 m )"), )
        ],
      ),
      DataRow(
        cells: <DataCell>[
          DataCell(Text("Nombre De Bar Pour Cadre")),
          DataCell(Text(calcule.nbrBarCadre())),
          DataCell(Text("un (12 m)"))
        ],
      ),
      DataRow(
        cells: <DataCell>[
          DataCell(Text("Quantité de cadre")),
          DataCell(Text(calcule.quantitecadre)),
          DataCell(Text("un"))
        ],
      ),
    ],
  );
}
