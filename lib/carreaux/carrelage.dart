import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app2/carreaux/PrixCarreaux.dart';
import 'package:flutter_app2/carreaux/resultatCarreux.dart';
import 'package:flutter_app2/model.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class Carreaux extends StatefulWidget {
  @override
  _CarreauxState createState() => _CarreauxState();
}

class _CarreauxState extends State<Carreaux> with AutomaticKeepAliveClientMixin <Carreaux>{
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

  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
          key: globalKey,
          body: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                new SliverAppBar(
                  floating: true,
                  pinned: true,
                  snap: true,
                  toolbarHeight: 0,
                  automaticallyImplyLeading: false,
                  bottom: new TabBar(
                    tabs: <Tab>[
                      new Tab(
                          icon: Image.asset("assets/image/cc1.PNG", width: 20,),
                          text: "Donnee du Carreaux"),
                      new Tab(
                          icon: Icon(Icons.attach_money), text: "Prix unitaire"),
                    ], // <-- total of 2 tabs
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: [
                Center(
                  child: Container(
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
                                      "Paramètre du carreaux",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      child: FormBuilderTextField(
                                        name: "longueur",
                                        initialValue: Model.value.longCarreaux,
                                        textAlign: TextAlign.right,
                                        keyboardType: TextInputType.number,
                                        decoration:
                                            decoration("longueur (Cm)", "Cm"),
                                        onChanged: (value){
                                          setState(() {

                                          Model.value.longCarreaux = value;
                                          });
                                        },
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      child: FormBuilderTextField(
                                        name: "largeur",
                                        initialValue: Model.value.largeurCarreaux,
                                        textAlign: TextAlign.right,
                                        keyboardType: TextInputType.number,
                                        decoration:
                                            decoration("Largeur (Cm)", "Cm"),
                                        onChanged: (value){
                                          setState(() {

                                          Model.value.largeurCarreaux = value;
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
                                          labelText: 'Mesure de surface de pose'),
                                      enabled: true,
                                      name: 'surface',
                                      initialValue: "Surface en m²",
                                      validator:
                                          FormBuilderValidators.required(context),
                                      options: [
                                        "Surface en m²",
                                        "Surface calculée"
                                      ]
                                          .map((surface) =>
                                              FormBuilderFieldOption(
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
                                                  name: "longueurS",
                                                  textAlign: TextAlign.right,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  decoration: decoration(
                                                      "longueur (Cm)", "Cm"),
                                                  validator: FormBuilderValidators
                                                      .required(context),
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.all(10),
                                                child: FormBuilderTextField(
                                                  name: "hauteurS",
                                                  textAlign: TextAlign.right,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  decoration: decoration(
                                                      "Hauteur (Cm)", "Cm"),
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
                                        name: "ouverture",
                                        initialValue: "0",
                                        textAlign: TextAlign.right,
                                        keyboardType: TextInputType.number,
                                        decoration:
                                            decoration("Ouverture (m²):", "m²"),
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
                                padding: EdgeInsets.all(10),
                                child: FormBuilderTextField(
                                  name: "largeurjoint",
                                  initialValue: "5",
                                  textAlign: TextAlign.right,
                                  keyboardType: TextInputType.number,
                                  decoration: decoration(
                                      "Largeur des joints (mm):", "mm"),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                child: FormBuilderTextField(
                                  name: "epaisseurCarreau",
                                  initialValue: "8",
                                  textAlign: TextAlign.right,
                                  keyboardType: TextInputType.number,
                                  decoration: decoration(
                                      "Eppaisseur du Carreaux (mm):", "mm"),
                                ),
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
                                            FocusScope.of(context).unfocus();
                                            if (_formkey.currentState
                                                .validate()) {
                                              if (_formkey.currentState
                                                      .fields["surface"]?.value ==
                                                  "Surface calculée") {
                                                surface = double.parse(_formkey
                                                        .currentState
                                                        .fields["longueur_surf"]
                                                        .value) *
                                                    double.parse(_formkey
                                                        .currentState
                                                        .fields["hauteur_surf"]
                                                        .value);
                                              } else {
                                                surface = double.parse(_formkey
                                                    .currentState
                                                    .fields["zone"]
                                                    .value);
                                              }
                                              if (double.parse(_formkey
                                                      .currentState
                                                      .fields["ouverture"]
                                                      .value) >=
                                                  surface) {
                                                globalKey.currentState
                                                    .showSnackBar(SnackBar(
                                                        duration:
                                                            Duration(seconds: 3),
                                                        content: Text(
                                                          "l'ouverture ne doit pas être supérieur ou égale a la surface",
                                                          textScaleFactor: 1.5,
                                                        )));
                                                _formkey.currentState
                                                    .fields["ouverture"]
                                                    .reset();
                                              } else {
                                                print(
                                                    _formkey.currentState.value);
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ResultatCarreaux(
                                                              type_de_surface:
                                                                  _formkey
                                                                      .currentState
                                                                      .fields[
                                                                          "surface"]
                                                                      ?.value,
                                                              zone: _formkey
                                                                  .currentState
                                                                  .fields["zone"]
                                                                  ?.value,
                                                              largeurC: _formkey
                                                                  .currentState
                                                                  .fields[
                                                                      "largeur"]
                                                                  ?.value,
                                                              longueurC: _formkey
                                                                  .currentState
                                                                  .fields[
                                                                      "longueur"]
                                                                  ?.value,
                                                              longueur_surf: _formkey
                                                                  .currentState
                                                                  .fields[
                                                                      "longueurS"]
                                                                  ?.value,
                                                              hauteur_surf: _formkey
                                                                  .currentState
                                                                  .fields[
                                                                      "hauteurS"]
                                                                  ?.value,
                                                              ouverture: _formkey
                                                                  .currentState
                                                                  .fields[
                                                                      "ouverture"]
                                                                  ?.value,
                                                              epaisseurCarreaux:
                                                                  _formkey
                                                                      .currentState
                                                                      .fields[
                                                                          "epaisseurCarreau"]
                                                                      ?.value,
                                                              largeurjoint: _formkey
                                                                  .currentState
                                                                  .fields[
                                                                      "largeurjoint"]
                                                                  ?.value,
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
                ),
                PrixCarreaux()
              ],
            ),
          )),
    );
  }
}
