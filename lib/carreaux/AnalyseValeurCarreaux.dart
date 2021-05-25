import 'dart:math';

import 'package:flutter/cupertino.dart';

class Calcul {
  static Calcul value = Calcul();
  String typeSurface, largeurC, longueurC, zone, longueurS, hauteurS, ouverture, eppaisseurcarreaux, largeurjoint;
  double qtejoint, qtecimentjoint;
  double nbrecarreau;
  double surface;
  Calcul({this.typeSurface, this.longueurC, this.largeurC, this.zone,  this.longueurS, this.hauteurS, this.ouverture, this.eppaisseurcarreaux, this.largeurjoint});

  String nbrCarreaux() {
    if (typeSurface == "Surface calculée"){
      surface = (double.parse(longueurS)*double.parse(hauteurS))- double.parse(ouverture);
      if(surface % double.parse(longueurC) != 0){
        nbrecarreau = surface
            /(double.parse(longueurC)/100 * double.parse(largeurC)/100);
      }nbrecarreau = surface /(double.parse(longueurC)/100 * double.parse(largeurC)/100) + 1;
    }else{
      surface = double.parse(zone) - double.parse(ouverture);
      if(surface % double.parse(longueurC)!= 0){
        nbrecarreau = surface
            /(double.parse(longueurC)/100 * double.parse(largeurC)/100);
      }nbrecarreau = surface /(double.parse(longueurC)/100 * double.parse(largeurC)/100) + 1;
    }
    return ((nbrecarreau *0.05)+nbrecarreau).ceil().toString();
  }

  
  String QteColle() {
    double surfaceCarreaux;
    surfaceCarreaux =  double.parse(longueurC) * double.parse(largeurC);
   if (surfaceCarreaux <= (15*15))     return arround(surface * 4.5).toString();
    else return arround(surface * 9).toString();
  }

  String QteCiment() {
    qtejoint = (0.18 * double.parse(eppaisseurcarreaux) * double.parse(largeurjoint) * (double.parse(longueurC) + double.parse(largeurC)) / (double.parse(longueurC) * double.parse(largeurC))) * surface*10;
    qtecimentjoint = qtejoint / 50;
    return arround(double.parse(QteColle())/20    ).toString();
  }


  String get surfaces{
    if (typeSurface == "Surface calculée"){
      surface = (double.parse(longueurS)*double.parse(hauteurS))- double.parse(ouverture);
    }surface = double.parse(zone) - double.parse(ouverture);
    return arround(surface).toString();
  }

  String  get qtejoints{
    return arround(qtejoint).toString();
  }

  String get qtecimentjoins{
    return arround(qtecimentjoint).toString();
  }
  double get Surface{
    return  surface;
  }
  double arround(double number) {
    return (number * 100).ceil() / 100;
  }
}
