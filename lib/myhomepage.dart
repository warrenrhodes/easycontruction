import 'package:flutter/material.dart';
import './body.dart';
import 'package:share/share.dart';
import 'apropos.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Easy Construction"),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: <Color>[
                Colors.brown.shade500,
                Colors.brown.shade50
              ])),
              child: Text(
                'Easy construction',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
            ),
            CustumListTitle(Icons.home, "Home", () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
              );
            }),
            CustumListTitle(
              Icons.assignment_outlined,
              "A Propos",
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Propos()),
                );
              },
            ),
            CustumListTitle(
              Icons.share,
              "Partager",
                  () {
                Share.share("Please visite https://google.com");
              },
            ),
          ],
        ),
      ),
      body: Body(),
    );
  }
}

class CustumListTitle extends StatelessWidget {
  IconData icon;
   String titre;
  Function onTap;

  CustumListTitle(this.icon, this.titre, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: Container(
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black26))
        ),
        child: InkWell(
          splashColor: Colors.brown,
          child: Container(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(icon),
                    Text(
                      titre,
                      style: TextStyle(fontSize: 16.0),
                    )
                  ],
                ),
                Icon(Icons.arrow_right)
              ],
            ),
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
