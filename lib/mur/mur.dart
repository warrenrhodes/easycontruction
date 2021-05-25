import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app2/model.dart';
import 'package:flutter_app2/mur/PrixParpaing.dart';
import 'package:flutter_app2/mur/builwall.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class Murs extends StatefulWidget {
  @override
  _MursState createState() => _MursState();
}

class _MursState extends State<Murs> {
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
  void iniState() {
    super.initState();
  }

  final globalKey = GlobalKey<ScaffoldState>();
  final _formkey = GlobalKey<FormBuilderState>();
  String surface = "Surface en m²";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          key: globalKey,
          appBar: AppBar(
            toolbarHeight: 80,

            automaticallyImplyLeading: false,
            bottom: new TabBar(
              tabs: <Tab>[
                new Tab(
                    icon: Image.asset("assets/icon/parpain12.png", width: 45,),
                    text: "Donnee du Parpaing"),
                new Tab(icon: Icon(Icons.attach_money), text: "Prix unitaire"),
              ], // <-- total of 2 tabs
            ),
          ),
          body: TabBarView(
            children: [
              Container(
                child: FormBuilder(
                  key: _formkey,
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      SystemChannels.textInput.invokeMethod("TextInput.hide");
                    },
                    child: Container(
                        child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(20),
                            /* color: Colors.red, */
                            child: Column(
                              children: [
                                Text(
                                  "Paramètre du parpaing",
                                  style: TextStyle(fontSize: 20),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: FormBuilderTextField(
                                    initialValue: Model.value.epaisseurParpaing,
                                    name: "epaisseur",
                                    textAlign: TextAlign.right,
                                    keyboardType: TextInputType.number,
                                    decoration:
                                        decoration("Epaisseur (Cm)", "Cm"),
                                    onChanged: (value){
                                      setState(() {
                                        Model.value.epaisseurParpaing = value;
                                        _formkey.currentState.fields["epaisseur_m"].didChange(value);
                                      });
                                    },
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: FormBuilderTextField(
                                    name: "hauteur",
                                    initialValue: Model.value.hauteurParpaing,
                                    textAlign: TextAlign.right,
                                    keyboardType: TextInputType.number,
                                    decoration:
                                        decoration("Hauteur (Cm)", "Cm"),
                                    onChanged: (value){
                                      setState(() {
                                        Model.value.hauteurParpaing = value;
                                      });
                                    },
                                  ),
                                  ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: FormBuilderTextField(
                                    name: "longueur",
                                    initialValue: Model.value.longueurParpaing,
                                    textAlign: TextAlign.right,
                                    keyboardType: TextInputType.number,
                                    decoration:
                                        decoration("longueur (Cm)", "Cm"),
                                    onChanged: (value){
                                      setState(() {
                                        Model.value.longueurParpaing = value;
                                      });
                                    },
                                  ),

                                  ),
                              ],
                            ),
                          ),
                          Divider(
                            height: 3,
                            color: Colors.black,
                            thickness: 3,
                          ),
                          Container(
                            padding: EdgeInsets.all(20),
                            /* color: Colors.green, */
                            child: Column(
                              children: [
                                FormBuilderRadioGroup(
                                  decoration: InputDecoration(
                                      labelText: 'Mesure de surface'),
                                  enabled: true,
                                  name: 'surface',
                                  initialValue: "Surface en m²",
                                  validator:
                                      FormBuilderValidators.required(context),
                                  options: ["Surface en m²", "Surface calculée"]
                                      .map((surface) => FormBuilderFieldOption(
                                          value: surface))
                                      .toList(growable: false),
                                  onChanged: (value) {
                                    setState(() {
                                      surface = value;
                                    });
                                  },
                                ),
                                surface == "Surface calculée"
                                    ? Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            child: FormBuilderTextField(
                                              name: "longueur_surf",
                                              textAlign: TextAlign.right,
                                              keyboardType:
                                                  TextInputType.number,
                                              decoration: decoration(
                                                  "longueur (m)", "m"),
                                              validator: FormBuilderValidators
                                                  .required(context),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            child: FormBuilderTextField(
                                              name: "hauteur_surf",
                                              textAlign: TextAlign.right,
                                              keyboardType:
                                                  TextInputType.number,
                                              decoration: decoration(
                                                  "Hauteur (m)", "m"),
                                              validator: FormBuilderValidators
                                                  .required(context),
                                            ),
                                          ),
                                        ],
                                      )
                                    : Container(
                                        padding: EdgeInsets.all(10),
                                        child: FormBuilderTextField(
                                          name: "zone",
                                          textAlign: TextAlign.right,
                                          keyboardType: TextInputType.number,
                                          decoration:
                                              decoration("Zone (m²):", "m²"),
                                          validator:
                                              FormBuilderValidators.required(
                                                  context),
                                        ),
                                      ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: FormBuilderTextField(
                                    name: "epaisseur_m",
                                    textAlign: TextAlign.right,
                                    initialValue: Model.value.epaisseurParpaing,
                                    keyboardType: TextInputType.number,
                                    validator: (String value) {
                                      if (double.parse(value) <
                                          double.parse(_formkey.currentState
                                              .fields["epaisseur"]?.value)) {
                                        globalKey.currentState
                                            .showSnackBar(SnackBar(
                                                duration: Duration(seconds: 3),
                                                content: Text(
                                                  "l'épaisseur du mur ne doit pas etre inferieur a l'épaisseur du parpaing",
                                                  textScaleFactor: 1.5,
                                                )));
                                        return "error épaisseur dur mur inférieur a celui du parpaing";
                                      } else if (value.isEmpty)
                                        return "valeur de l'épaisseur vide";
                                      return null;
                                    },
                                    decoration:
                                        decoration("Epaisseur Mur:", "Cm"),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: FormBuilderTextField(
                                    name: "ouverture",
                                    initialValue: " 0",
                                    textAlign: TextAlign.right,
                                    keyboardType: TextInputType.number,
                                    decoration:
                                        decoration("Ouverture (m²):", "m²"),
                                    validator: (String value) {
                                      double surfaces;
                                      if (surface == "Surface calculée") {
                                        surfaces = double.parse(_formkey
                                                .currentState
                                                .fields["longueur_surf"]
                                                .value) *
                                            double.parse(_formkey.currentState
                                                .fields["hauteur_surf"].value);
                                      }
                                      surfaces = double.parse(_formkey
                                          .currentState.fields["zone"].value);
                                      if (double.parse(value) >= surfaces) {
                                        globalKey.currentState
                                            .showSnackBar(SnackBar(
                                                duration: Duration(seconds: 3),
                                                content: Text(
                                                  "l'ouverture ne doit pas être supérieur ou égale a la surface",
                                                  textScaleFactor: 1.5,
                                                )));
                                        return "error ouverture superieur a la  surface";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            height: 3,
                            color: Colors.black,
                            thickness: 3,
                          ),
                          Container(
                              width: 350,
                              margin: EdgeInsets.only(top: 10),
                              child: Column(
                                children: [
                                  RaisedButton(
                                      child: Text(
                                        "Calculer",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      onPressed: () {
                                        _formkey.currentState.save();
                                        double surface;

                                        if (_formkey.currentState.validate()) {
                                          if (_formkey.currentState
                                                  .fields["surface"]?.value ==
                                              "Surface calculée") {
                                            print(_formkey.currentState.value);
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Buildwall(
                                                          epaisseur_M: _formkey
                                                              .currentState
                                                              .fields[
                                                                  "epaisseur_m"]
                                                              .value,
                                                          type_de_surface:
                                                              _formkey
                                                                  .currentState
                                                                  .fields[
                                                                      "surface"]
                                                                  .value,
                                                          longueur_p: _formkey
                                                              .currentState
                                                              .fields[
                                                                  "longueur"]
                                                              .value,
                                                          hauteur_p: _formkey
                                                              .currentState
                                                              .fields["hauteur"]
                                                              .value,
                                                          epaisseur_p: _formkey
                                                              .currentState
                                                              .fields[
                                                                  "epaisseur"]
                                                              .value,
                                                          hauteur_surf: _formkey
                                                              .currentState
                                                              .fields[
                                                                  "hauteur_surf"]
                                                              .value,
                                                          longueur_surf: _formkey
                                                              .currentState
                                                              .fields[
                                                                  "longueur_surf"]
                                                              .value,
                                                          ouverture: _formkey
                                                              .currentState
                                                              .fields[
                                                                  "ouverture"]
                                                              .value,
                                                        )));
                                          } else {
                                            print(_formkey.currentState.value);
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Buildwall(
                                                          epaisseur_M: _formkey
                                                              .currentState
                                                              .fields[
                                                                  "epaisseur_m"]
                                                              .value,
                                                          type_de_surface:
                                                              _formkey
                                                                  .currentState
                                                                  .fields[
                                                                      "surface"]
                                                                  .value,
                                                          longueur_p: _formkey
                                                              .currentState
                                                              .fields[
                                                                  "longueur"]
                                                              .value,
                                                          hauteur_p: _formkey
                                                              .currentState
                                                              .fields["hauteur"]
                                                              .value,
                                                          epaisseur_p: _formkey
                                                              .currentState
                                                              .fields[
                                                                  "epaisseur"]
                                                              .value,
                                                          zone: _formkey
                                                              .currentState
                                                              .fields["zone"]
                                                              .value,
                                                          ouverture: _formkey
                                                              .currentState
                                                              .fields[
                                                                  "ouverture"]
                                                              .value,
                                                        )));
                                          }
                                        } else {
                                          print("validation false");
                                        }
                                      }),
                                ],
                              ))
                        ],
                      ),
                    )),
                  ),
                ),
              ),
              PrixParpaing()
            ],
          ),
        ));
  }
}
