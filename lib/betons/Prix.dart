import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app2/model.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';


class Prixpoteaux extends StatefulWidget {
  @override
  _PrixpoteauxState createState() => _PrixpoteauxState();
}

class _PrixpoteauxState extends State<Prixpoteaux> {


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
                  Textfeild( "ciment", Model.value.ciment50, "Ciment 50Kg", (String value){ Model.value.ciment50 = value;}),
                  Textfeild("fer" , Model.value.prixfer , "Prix fer${Model.value.fer } :",(String value){ Model.value.prixfer = value;}),
                  Textfeild( "fer6 :", Model.value.prixfer6, "Prix fer6", (String value){ Model.value.prixfer6 = value;}),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Textfeild extends StatelessWidget {
  String titre;
  String name;
  String initialvalue;
  Function onTap;

  Textfeild(this.name,this.initialvalue, this.titre, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 28.0, 0, 0),
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 2,
            child: Text(titre,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                )),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 2 - 30,
            child: FormBuilderTextField(
              name: name,
              initialValue: initialvalue,
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
              onChanged: onTap
            ),
          ),
        ],
      ),
    );
  }
}