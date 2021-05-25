import 'package:flutter/material.dart';
import 'package:flutter_app2/dalle/dalle.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class Dosage extends StatefulWidget {
  @override
  _DosageState createState() => _DosageState();
}

//creation de chaque ligne cotenant un text et un Textfiel

class _DosageState extends State<Dosage> {
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Type De Mélange"),
      ),
      body: SingleChildScrollView(
        child: FormBuilder(
          key: _key,
          child: Container(
            padding: EdgeInsets.all(5),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Text(
                        "Ciment ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: Container(
                            margin: EdgeInsets.only(left: 260),
                            child: Text(
                              "1",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Text("Sable :",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2 - 30,
                        child: FormBuilderTextField(
                          name: "sable",
                          initialValue: "1.5",
                          textAlign: TextAlign.right,
                          keyboardType: TextInputType.number,
                          decoration: decoration("", ""),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Text("Gravier :",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2 - 30,
                        child: FormBuilderTextField(
                          name: "gravier",
                          initialValue: "3",
                          textAlign: TextAlign.right,
                          keyboardType: TextInputType.number,
                          decoration: decoration("", ""),
                        ),
                      ),
                    ],
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
                      onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Dalle(
                                      sable: _key
                                          .currentState.fields["sable"].value,
                                      gravier: _key
                                          .currentState.fields["gravier"].value,
                                    )),
                          )),
                ),
                Text(
                  "*** information ***",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                    "Dans une compostion 1 : 2 : 3 , pour 1 sac on a 2 sable  et 3 agregat (gravier).")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
