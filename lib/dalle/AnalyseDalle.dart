import "dart:math";
import 'package:flutter/material.dart';

class AnalyseDalle{

  AnalyseDalle(
      this.typeDalle,
      this.longueur,
      this.largeur,
      this.epaisseur,
      this.sable,
      this.gravier,
      this.DalleCo
      );

  final  String typeDalle;
  final String gravier;
  final String sable;
  final String longueur;
  final  String largeur;
  final String epaisseur;
  final String DalleCo;

  double Dalle;
  double DalleCiment;
  double DalleSable;
  double DalleAgregat;
  double DalleEau;

  /*calculer de la quantiter dfre ciment, sable , agregat et eau */

  String qtciment(){
    if(typeDalle == "Dalle Calculée"){
      Dalle = double.parse(longueur) * double.parse(largeur) * double.parse(epaisseur)/100;
      Dalle = (Dalle*0.10) + Dalle;
    }
    else{
      Dalle = double.parse(DalleCo) ;
      Dalle = (Dalle*0.10) + Dalle;
    }
    DalleCiment =(1 / (double.parse(sable) + double.parse(gravier) + 1)) * Dalle;
    return arround(DalleCiment * 1200/ 50).toString();
  }

  String qtSable(){
    DalleSable = DalleCiment * double.parse(sable);
    return arround(DalleSable * 1705).toString();
  }

  String qtAgregat(){

    DalleAgregat = DalleCiment * double.parse(gravier);
    return arround(DalleAgregat * 1405).toString();
  }

  String qtEau(){
    return arround( DalleCiment * 780 ).toString();
  }

  String get Dallee{
    if(typeDalle == "Dalle Calculée"){
      Dalle = double.parse(longueur) * double.parse(largeur) * double.parse(epaisseur)/100;
      return arround(Dalle).toString();
    }else{
      Dalle = double.parse(DalleCo) ;
      return arround(Dalle).toString();
    }
  }

  double arround(double number) {
    return (number * 100).ceil() / 100;
  }
}
