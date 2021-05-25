import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app2/betons/pillier/resultat_pilier.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'ResultatDalle.dart';


class Dalle extends StatefulWidget {
  Dalle ({
    Key key,
    @required this.gravier,
    @required this.sable,


  }) : super(key: key);
  final String gravier;
  final String sable;
  @override
  _DalleState createState() => _DalleState();
}

class _DalleState extends State<Dalle> {
  List<String> _Dalle = ['Dalle Connue', 'Dalle Calculée'];
  String _Dallevalue ="Dalle Connue";
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

  final _key = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dalle"),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            SystemChannels.textInput.invokeMethod("TextInput.hide");
          },
          child: SingleChildScrollView(
            child: FormBuilder(
              key: _key,
              child: Container(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          FormBuilderDropdown(
                            name: 'Dalle',
                            initialValue: "Dalle Connue",
                            decoration: InputDecoration(
                              labelText: 'Type de Dalle',
                            ),
                            // initialValue: 'Male',
                            allowClear: true,
                            hint: Text('Select type de Dalle'),
                            items: _Dalle
                                .map((Dalle) => DropdownMenuItem(
                              value: Dalle,
                              child: Text('$Dalle'),
                            ))
                                .toList(),
                            onChanged: (value){
                              setState(() {
                                _Dallevalue = value;
                              });
                            },
                          ),
                          _Dallevalue ==
                              'Dalle Connue'
                              ? Container(
                            padding: EdgeInsets.all(10),
                            child: FormBuilderTextField(
                              name: "Dalle_s",
                              textAlign: TextAlign.right,
                              keyboardType: TextInputType.number,
                              decoration:
                              decoration("Dalle Connue(m³)", "m³"),
                              validator:
                              FormBuilderValidators.required(context),
                            ),
                          )
                              : Container(
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: FormBuilderTextField(
                                    name: "epaisseur",
                                    textAlign: TextAlign.right,
                                    keyboardType: TextInputType.number,
                                    decoration:
                                    decoration("Epaisseur(C)", "Cm"),
                                    validator:
                                    FormBuilderValidators.required(
                                        context),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: FormBuilderTextField(
                                    name: "longueur",
                                    textAlign: TextAlign.right,
                                    keyboardType: TextInputType.number,
                                    decoration:
                                    decoration("Longueur(A)", "m"),
                                    validator:
                                    FormBuilderValidators.required(
                                        context),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: FormBuilderTextField(
                                    name: "largeur",
                                    textAlign: TextAlign.right,
                                    keyboardType: TextInputType.number,
                                    decoration:
                                    decoration("Largeur(B)", "m"),
                                    validator:
                                    FormBuilderValidators.required(
                                        context),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),

                    Container(
                        height: MediaQuery.of(context).size.height / 2 - 50,
                        child: Image.asset(
                          "assets/image/herbe.png",
                        )),

                    Container(
                        width: 180,
                        margin: EdgeInsets.only(top: 10, bottom: 10),
                        child: RaisedButton(
                          color: Colors.brown.shade700,
                          child: Text(
                            "Suivant",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            print( _key.currentState.fields);
                            print("");
                            print( _key.currentState.fields.keys.toList());
                            _key.currentState.save();
                            final isValid = _key.currentState.validate();
                            if (isValid) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ResultatDalle(
                                          typedeDalle: _Dallevalue,
                                          largeur: _key.currentState.fields["largeur"]?.value,
                                          longueur: _key.currentState.fields["longueur"]?.value,
                                          epaisseur: _key.currentState.fields["epaisseur"]?.value,
                                          Dalle: _key.currentState.fields["Dalle_s"]?.value,
                                          sable: widget.sable,
                                          gravier: widget.gravier
                                      )));
                            }
                          },
                        )
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}
