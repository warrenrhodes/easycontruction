import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app2/betons/Prix.dart';
import 'package:flutter_app2/betons/poutre/AnalyseValeurPoutre.dart';
import 'package:flutter_app2/betons/poutre/resultatPoutre.dart';
import 'package:flutter_app2/model.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../pillier/resultat_pilier.dart';

class Poutre extends StatefulWidget {
  Poutre({
    Key key,
    @required this.gravier,
    @required this.sable,
  }) : super(key: key);
  final String gravier;
  final String sable;
  List<String> _listbar = ["8", "10", "12", "14", "16"];

  String _listbarvalue = "8";
  @override
  _PoutreState createState() => _PoutreState();
}

class _PoutreState extends State<Poutre> {
  String espacementDefaut = "15";
  String nbreBar = "4";
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
                      text: "Donnee du Poutre"),
                  new Tab(
                      icon: Icon(Icons.attach_money), text: "Prix unitaire"),
                ], // <-- total of 2 tabs
              ),
            ),
            body: TabBarView(children: [
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  SystemChannels.textInput.invokeMethod("TextInput.hide");
                },
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: FormBuilder(
                      key: _key,
                      child: Column(
                        children: [
                          Container(
                            height: 100,
                            color: Colors.white,
                            width: MediaQuery.of(context).size.width,
                            child: Image.asset(
                              "assets/image/Capture.PNG",
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: FormBuilderTextField(
                                    name: "longueur",
                                    textAlign: TextAlign.right,
                                    keyboardType: TextInputType.number,
                                    decoration: decoration("Longueur", "m"),
                                    validator:
                                        FormBuilderValidators.required(context),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: FormBuilderTextField(
                                    name: "hauteur",
                                    textAlign: TextAlign.right,
                                    keyboardType: TextInputType.number,
                                    decoration: decoration("Hauteur", "Cm"),
                                    validator:
                                        FormBuilderValidators.required(context),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: FormBuilderTextField(
                                    name: "epaisseur",
                                    textAlign: TextAlign.right,
                                    keyboardType: TextInputType.number,
                                    decoration: decoration("Epaisseur", "Cm"),
                                    validator:
                                        FormBuilderValidators.required(context),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: FormBuilderTextField(
                                    name: "quantite",
                                    initialValue: "1",
                                    textAlign: TextAlign.right,
                                    keyboardType: TextInputType.number,
                                    decoration: decoration("Quantité", ""),
                                  ),
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
                                _visible == false
                                    ? Text("dérouler")
                                    : Text("enrouler"),
                                IconButton(
                                    color: Colors.white,
                                    icon: _visible == false
                                        ? Icon(Icons.arrow_circle_down)
                                        : Icon(Icons.arrow_circle_up),
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
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: FormBuilderDropdown(
                                            name: 'fer',
                                            initialValue: Model.value.fer,
                                            decoration: InputDecoration(
                                              labelText: 'Type de bar',
                                            ),
                                            // initialValue: 'Male',
                                            allowClear: true,
                                            hint: Text('Select type de fer'),
                                            items: widget._listbar
                                                .map((fer) => DropdownMenuItem(
                                                      value: fer,
                                                      child: Text('$fer'),
                                                    ))
                                                .toList(),
                                            onChanged: (value) {
                                              setState(() {
                                               Model.value.fer =value;
                                              });
                                            },
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(top: 20),
                                          child: FormBuilderTextField(
                                            name: "nbrebar",
                                            initialValue: "4",
                                            textAlign: TextAlign.right,
                                            keyboardType: TextInputType.number,
                                            decoration: decoration(
                                                "nombre de bar pour une poutre ",
                                                ""),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    color: Colors.brown.shade300,
                                    width: double.infinity,
                                    height: 40,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        _visible2 == false
                                            ? Text("dérouler")
                                            : Text("enrouler"),
                                        IconButton(
                                            color: Colors.white,
                                            icon: _visible2 == false
                                                ? Icon(Icons.arrow_circle_down)
                                                : Icon(Icons.arrow_circle_up),
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
                                        initialValue: "10",
                                        textAlign: TextAlign.right,
                                        keyboardType: TextInputType.number,
                                        decoration: decoration(
                                            "Espacement des cadres", ""),
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
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: () {
                                  _key.currentState.save();
                                  final isValid = _key.currentState.validate();
                                  if (isValid) {
                                    print(_key.currentState.fields);
                                    print("");
                                    print(
                                        _key.currentState.fields.keys.toList());
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Resultat(
                                                  longueur: _key.currentState
                                                      .fields["longueur"].value,
                                                  epaisseur: _key
                                                      .currentState
                                                      .fields["epaisseur"]
                                                      .value,
                                                  hauteur: _key.currentState
                                                      .fields["hauteur"].value,
                                                  sable: widget.sable,
                                                  gravier: widget.gravier,
                                                  quantite: _key.currentState
                                                      .fields["quantite"].value,
                                                  nbrebar: _key
                                                          .currentState
                                                          .fields["nbrebar"]
                                                          ?.value ??
                                                      nbreBar,
                                                  espacement: _key
                                                          .currentState
                                                          .fields["espacement"]
                                                          ?.value ??
                                                      espacementDefaut,
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
            ])));
  }
}

