import 'package:flutter/material.dart';
import './logo.dart';
import './icons.dart';
import 'mur/mur.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.all(5),
          color: Colors.white,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 3 + 50,
                child: Logo(),
              ),
              Container(
                child: Divider(
                  thickness: 7,
                  color: Colors.black,
                ),
              ),
              Container(
                  margin: EdgeInsets.only(left: 20), child: IconsMaterials()),
              Container(
                child: Divider(
                  thickness: 7,
                  color: Colors.black,
                ),
              ),
            ],
          )),
    );
  }
}
