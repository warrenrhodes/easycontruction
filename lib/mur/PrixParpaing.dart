import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app2/model.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';


class PrixParpaing extends StatefulWidget {
  @override
  _PrixParpaingState createState() => _PrixParpaingState();
}

class _PrixParpaingState extends State<PrixParpaing> {


  List<String> _listmonaie = ["XAF", "EUR"
      "O", "USD"];
  String _listmonaieValue = "XAF";
  final _formkey = GlobalKey<FormBuilderState>();
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FormBuilder(
        key: _formkey,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            SystemChannels.textInput.invokeMethod("TextInput.hide");
          },
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: FormBuilderDropdown(
                      name: 'devise',
                      initialValue: Model.value.devise,
                      decoration: InputDecoration(
                        labelText: 'Devise',
                      ),
                      // initialValue: 'Male',
                      allowClear: true,
                      hint: Text('Selectionner la Devise'),
                      items: _listmonaie
                          .map((fer) => DropdownMenuItem(
                        value: fer,
                        child: Text('$fer'),
                      ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _listmonaieValue = value;
                          Model.value.devise = value;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 28.0, 0, 0),
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Text("Ciment 50Kg :",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 2 - 30,
                          child: FormBuilderTextField(
                            name: "ciment5",
                            textAlign: TextAlign.right,
                            initialValue: Model.value.ciment50,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              suffixText: Model.value.devise,
                              filled: true,
                              fillColor: Colors.brown.shade50,
                              contentPadding: EdgeInsets.only(
                                  left: 10, bottom: 9, top: 9, right: 10),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                  width: 3,
                                ),
                              ),
                            ),
                            onChanged: (String value) {
                              Model.value.ciment50 = value;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 28.0, 0, 0),
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Text("Prix Parpaing \n ${Model.value.longueurParpaing} x ${Model.value.epaisseurParpaing} x ${Model.value.hauteurParpaing}:",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 2 - 30,
                          child: FormBuilderTextField(
                            name: "parpaing",
                            initialValue: Model.value.prixParpaint,
                            textAlign: TextAlign.right,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              suffixText: Model.value.devise,
                              filled: true,
                              fillColor: Colors.brown.shade50,
                              contentPadding: EdgeInsets.only(
                                  left: 10, bottom: 9, top: 9, right: 10),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                  width: 3,
                                ),
                              ),
                            ),
                            onChanged: (String value) {
                              Model.value.prixParpaint= value;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
