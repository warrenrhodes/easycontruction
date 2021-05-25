import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app2/betons/pillier/resultat_pilier.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'ResultaVolume.dart';

class Volume extends StatefulWidget {
  Volume({
    Key key,
    @required this.gravier,
    @required this.sable,
  }) : super(key: key);
  final String gravier;
  final String sable;
  @override
  _VolumeState createState() => _VolumeState();
}

class _VolumeState extends State<Volume> {
  List<String> _Volume = ['Volume_Connu', 'Volume_calculé'];
  String _Volumevalue = "Volume_Connu";
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
        title: Text("Volume"),
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
                            name: 'Volume',
                            initialValue: "Volume_Connu",
                            decoration: InputDecoration(
                              labelText: 'Type de Volume',
                            ),
                            // initialValue: 'Male',
                            allowClear: true,
                            hint: Text('Select type de Volume'),
                            items: _Volume.map((Volume) => DropdownMenuItem(
                                  value: Volume,
                                  child: Text('$Volume'),
                                )).toList(),
                            onChanged: (value) {
                              setState(() {
                                _Volumevalue = value;
                              });
                            },
                          ),
                          _Volumevalue == 'Volume_Connu'
                              ? Container(
                                  padding: EdgeInsets.all(10),
                                  child: FormBuilderTextField(
                                    name: "Volume_s",
                                    textAlign: TextAlign.right,
                                    keyboardType: TextInputType.number,
                                    decoration:
                                        decoration("Volume Connu(m³)", "m³"),
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
                                              decoration("Epaisseur", "Cm"),
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
                                              decoration("Longueur", "m"),
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
                                              decoration("Largeur", "m"),
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
                            print(_key.currentState.fields);
                            print("");
                            print(_key.currentState.fields.keys.toList());
                            _key.currentState.save();
                            final isValid = _key.currentState.validate();
                            if (isValid) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ResultatVolume(
                                          typedeVolume: _Volumevalue,
                                          largeur: _key.currentState
                                              .fields["largeur"]?.value,
                                          longueur: _key.currentState
                                              .fields["longueur"]?.value,
                                          epaisseur: _key.currentState
                                              .fields["epaisseur"]?.value,
                                          volume: _key.currentState
                                              .fields["Volume_s"]?.value,
                                          sable: widget.sable,
                                          gravier: widget.gravier)));
                            }
                          },
                        )),
                    Container(
                        height: MediaQuery.of(context).size.height / 2 - 50,
                        child: Image.asset(
                          "assets/image/dalle.jpg",
                        )),
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
