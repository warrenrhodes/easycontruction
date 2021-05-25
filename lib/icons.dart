import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class IconsMaterials extends StatelessWidget {
  Widget icone(
      String image, String title, String route, BuildContext contexte) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(contexte, route);
      },
      child: Column(
        children: [
          Image.asset(
            image,
            height: 100,
            width: 100,
          ),
          Text(
            title,
            style: new TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const icon = [
      {
        "image": "assets/icon/dalles.jpg",
        "title": "Dalle",
        "next_page": "./dalle.dart"
      },
      {
        "image": "assets/icon/mur.png",
        "title": "Mur",
        "next_page": "./mur.dart"
      },
      {
        "image": "assets/icon/dalles4.png",
        "title": "Betons",
        "next_page": "./compositionBeton.dart"
      },
      {
        "image": "assets/icon/carreaux.jpg",
        "title": "Carrelage",
        "next_page": "./carrelage.dart"
      }
    ];

    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                /*width: MediaQuery.of(context).size.width/3,
                  height: MediaQuery.of(context).size.width/3,*/
                child: icone(icon[0]["image"], icon[0]["title"],
                    icon[0]["next_page"], context),
              ),
              Expanded(
                child: icone(icon[1]["image"], icon[1]["title"],
                    icon[1]["next_page"], context),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                /* width: MediaQuery.of(context).size.width/3,
                  height: MediaQuery.of(context).size.width/3,*/
                child: icone(icon[2]["image"], icon[2]["title"],
                    icon[2]["next_page"], context),
              ),
              Expanded(
                child: icone(icon[3]["image"], icon[3]["title"],
                    icon[3]["next_page"], context),
              )
            ],
          )
        ],
      ),
    );
  }
}
