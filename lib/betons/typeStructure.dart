import 'package:flutter/material.dart';
import 'package:flutter_app2/betons/poutre/poutre.dart';
import 'package:flutter_app2/betons/Volume/volume.dart';

import 'pillier/pilier.dart';

class Beton_element extends StatelessWidget {
  Beton_element({
    Key key,
    @required this.gravier,
    @required this.sable,
  }) : super(key: key);
  final String gravier;
  final String sable;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          /*automaticallyImplyLeading: false,*/
          ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Container(
                height: 150,
                child: InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Poutre(
                              gravier: gravier,
                              sable: sable,
                            )),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Poutre",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Image.asset(
                          "assets/image/p.jpg",
                          /* height: 150,
                  width: 250,*/
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                height: 40,
                thickness: 7,
                color: Colors.black,
              ),
              Container(
                height: 250,
                child: InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Pilier(
                              gravier: gravier,
                              sable: sable,
                            )),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Text(
                          "Pilier",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Image.asset(
                          "assets/image/5.PNG",
                          /* height: 150,
                  width: 250,*/
                        ),
                      ),
                      Expanded(
                        child: Image.asset(
                          "assets/image/6.PNG",
                          /* height: 150,
                  width: 250,*/
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                height: 40,
                thickness: 7,
                color: Colors.black,
              ),
              Container(
                height: 150,
                child: InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Volume(
                              gravier: gravier,
                              sable: sable,
                            )),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Volume",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Image.asset(
                          "assets/image/2.PNG",
                          /* height: 150,
                  width: 250,*/
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
