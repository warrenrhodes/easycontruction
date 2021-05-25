import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:flutter_app2/betons/Prix.dart';
import 'package:flutter_app2/betons/poutre/resultatPoutre.dart';
import 'package:flutter_app2/betons/pillier/resultat_pilier.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:flutter_app2/model.dart';

class Pilier extends StatefulWidget {
  Pilier({
    Key key,
    @required this.gravier,
    @required this.sable,
  }) : super(key: key);
  final String gravier;
  final String sable;
  @override
  _PilierState createState() => _PilierState();
}

class _PilierState extends State<Pilier> {
  String defaultespacement = "15";
  String defaultnbrebar = "4";
  List<String> _piliertype = [
    'Pilier Circulaire',
    "Pilier",
    "Pilier triangulaire"
  ];
  String _pilierValue = "Pilier Circulaire";
  List<String> _listbar = ["8", "10", "12", "14"];
  String _listbarValue = "8";
  bool _visible = false;
  bool _visible2 = false;
  final _key = GlobalKey<FormBuilderState>();
  InputDecoration decoration(String titre, String hint_text) {
    return InputDecoration(
      /*border: InputBorder.none,*/
      filled: true,
      fillColor: Colors.brown.shade50,
      labelText: titre,
      contentPadding: EdgeInsets.only(left: 10, bottom: 9, top: 9, right: 10),
      hintText: hint_text,
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.blue,
          width: 3,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          automaticallyImplyLeading: false,
          bottom: new TabBar(
            tabs: <Tab>[
              new Tab(
                  icon: Image.asset(
                    "assets/image/aa.PNG",
                    width: 45,
                  ),
                  text: "Donnee du Pilier"),
              new Tab(
                  icon: Icon(Icons.attach_money), text: "Prix unitaire"),
            ], // <-- total of 2 tabs
          ),
        ),
        body: TabBarView(
          children: [
            FormBuilder(
              key: _key,
              child: Container(
                color: Colors.white,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    SystemChannels.textInput.invokeMethod("TextInput.hide");
                  },
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Container(
                                  padding: EdgeInsets.all(20),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width,
                                        child: FormBuilderDropdown(
                                          name: 'pilier',
                                          initialValue: "Pilier Circulaire",
                                          decoration: InputDecoration(
                                            labelText: 'Type de pilier',
                                          ),
                                          // initialValue: 'Male',
                                          allowClear: true,
                                          hint: Text('Selectionner type de pilier'),
                                          items: _piliertype
                                              .map((pilier) => DropdownMenuItem(
                                            value: pilier,
                                            child: Text('$pilier'),
                                          ))
                                              .toList(),
                                          onChanged: (value) {
                                            setState(() {
                                              _pilierValue = value;
                                            });
                                          },
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        child: FormBuilderTextField(
                                          name: "hauteur",
                                          textAlign: TextAlign.right,
                                          keyboardType: TextInputType.number,
                                          decoration: decoration("Hauteur", "m"),
                                          validator:
                                          FormBuilderValidators.required(context),
                                        ),
                                      ),
                                      _pilierValue == 'Pilier'
                                          ? Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            child: FormBuilderTextField(
                                              name: "longueur",
                                              textAlign: TextAlign.right,
                                              keyboardType:
                                              TextInputType.number,
                                              decoration:
                                              decoration("Longueur", "Cm"),
                                              validator: FormBuilderValidators
                                                  .required(context),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            child: FormBuilderTextField(
                                              name: "largeur",
                                              textAlign: TextAlign.right,
                                              keyboardType:
                                              TextInputType.number,
                                              decoration:
                                              decoration("Largeur", "Cm"),
                                              validator: FormBuilderValidators
                                                  .required(context),
                                            ),
                                          )
                                        ],
                                      )
                                          : _pilierValue == 'Pilier triangulaire'
                                          ? Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            child: FormBuilderTextField(
                                              name: "base",
                                              textAlign: TextAlign.right,
                                              keyboardType:
                                              TextInputType.number,
                                              decoration:
                                              decoration("Base", "Cm"),
                                              validator:
                                              FormBuilderValidators
                                                  .required(context),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            child: FormBuilderTextField(
                                              name: "cote",
                                              textAlign: TextAlign.right,
                                              keyboardType:
                                              TextInputType.number,
                                              decoration:
                                              decoration("Coté", "Cm"),
                                              validator:
                                              FormBuilderValidators
                                                  .required(context),
                                            ),
                                          )
                                        ],
                                      )
                                          : Container(
                                        padding: EdgeInsets.all(10),
                                        child: FormBuilderTextField(
                                          name: "diametre",
                                          textAlign: TextAlign.right,
                                          keyboardType:
                                          TextInputType.number,
                                          decoration:
                                          decoration("Diametre", "Cm"),
                                          validator: FormBuilderValidators
                                              .required(context),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        child: FormBuilderTextField(
                                          name: "quantité",
                                          initialValue: "1",
                                          textAlign: TextAlign.right,
                                          keyboardType: TextInputType.number,
                                          decoration: decoration("Quantité", ""),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                    child: _pilierValue == 'Pilier Circulaire'
                                        ? Image.asset(
                                      "assets/image/6.PNG",
                                    )
                                        : Image.asset(
                                      "assets/image/5.PNG",
                                    )),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.brown.shade300,
                          width: double.infinity,
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _visible == false? Text("dérouler"):Text("enrouler"),
                              IconButton(
                                  color: Colors.white,
                                  icon: _visible == false? Icon(Icons.arrow_circle_down): Icon(Icons.arrow_circle_up),
                                  onPressed: () {
                                    setState(() {
                                      _visible = !_visible;
                                    });
                                  }),
                            ],
                          ),
                        ),
                        Visibility(
                          visible: _visible,
                          child: Container(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(15),
                                  child: Column(
                                    children: [
                                      Text("configuration de l'acier",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          )),
                                      Container(
                                        width: MediaQuery.of(context).size.width,
                                        child: FormBuilderDropdown(
                                          name: 'fer',
                                          initialValue: Model.value.fer,
                                          decoration: InputDecoration(
                                            labelText: 'Type de bar',
                                          ),
                                          // initialValue: 'Male',
                                          allowClear: true,
                                          hint: Text('Selectionner le type de fer'),
                                          items: _listbar
                                              .map((fer) => DropdownMenuItem(
                                            value: fer,
                                            child: Text('$fer'),
                                          ))
                                              .toList(),
                                          onChanged: (value) {
                                            Model.value.fer = value;
                                          },
                                        ),
                                      ),
                                      _pilierValue == "Pilier triangulaire"
                                          ? Container(
                                        padding: EdgeInsets.only(top: 20),
                                        child: FormBuilderTextField(
                                          name: "nbrBar",
                                          initialValue: "3",
                                          textAlign: TextAlign.right,
                                          keyboardType: TextInputType.number,
                                          decoration: decoration(
                                              "Nbr bar par poteau", ""),
                                        ),
                                      )
                                          : Container(
                                        padding: EdgeInsets.only(top: 20),
                                        child: FormBuilderTextField(
                                          name: "nbrBar",
                                          initialValue: "4",
                                          textAlign: TextAlign.right,
                                          keyboardType: TextInputType.number,
                                          decoration: decoration(
                                              "Nbr bar par poteau", ""),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  color: Colors.brown.shade300,
                                  width: double.infinity,
                                  height: 40,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      _visible2 == false? Text("dérouler"):Text("enrouler"),
                                      IconButton(
                                          color: Colors.white,
                                          icon: _visible2 == false? Icon(Icons.arrow_circle_down): Icon(Icons.arrow_circle_up),
                                          onPressed: () {
                                            setState(() {
                                              _visible2 = !_visible2;
                                            });
                                          }),
                                    ],
                                  ),
                                ),
                                Visibility(
                                  visible: _visible2,
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    child: FormBuilderTextField(
                                      name: "espacement",
                                      initialValue: "15",
                                      textAlign: TextAlign.right,
                                      keyboardType: TextInputType.number,
                                      decoration: decoration("Espacement des cadres", ""),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                            width: 180,
                            margin: EdgeInsets.only(top: 50, bottom: 20),
                            child: RaisedButton(
                              color: Colors.brown.shade700,
                              child: Text(
                                "Suivant",
                                style: TextStyle(
                                    color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {
                                _key.currentState.save();
                                final isValid = _key.currentState.validate();
                                if (isValid) {
                                  /*print( _key.currentState.fields);
                          print("");
                          print( _key.currentState.fields.keys.toList())*/
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ResultatPilier(
                                            typePilier: _pilierValue,
                                            diametre: _key.currentState
                                                .fields["diametre"]?.value,
                                            hauteur: _key.currentState
                                                .fields["hauteur"]?.value,
                                            sable: widget.sable,
                                            gravier: widget.gravier,
                                            quantite: _key.currentState
                                                .fields["quantité"]?.value,
                                            nbrebar: _key.currentState
                                                .fields["nbrebar"]?.value ??
                                                defaultnbrebar,
                                            base: _key.currentState.fields["base"]
                                                ?.value,
                                            cote: _key.currentState.fields["cote"]
                                                ?.value,
                                            longueur: _key.currentState
                                                .fields["longueur"]?.value,
                                            largeur: _key.currentState
                                                .fields["largeur"]?.value,
                                            espacement: _key
                                                .currentState
                                                .fields["espacement"]
                                                ?.value ??
                                                defaultespacement,
                                          )));
                                }
                              },
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Prixpoteaux()
          ],
        )
      ),
    );
  }
}
