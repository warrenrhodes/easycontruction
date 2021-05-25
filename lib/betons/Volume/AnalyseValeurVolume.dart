import "dart:math";
import 'package:flutter/material.dart';


class AnalyseVolume {
  AnalyseVolume(this.typeVolume, this.longueur, this.largeur, this.epaisseur,
      this.sable, this.gravier, this.volumeCo);

  final String typeVolume;
  final String longueur;
  final String largeur;
  final String epaisseur;
  final String sable;
  final String gravier;
  final String volumeCo;
  double volume;
  double volumeCiment;
  double volumeSable;
  double volumeAgregat;
  double volumeEau;

  /*calculer de la quantiter dfre ciment, sable , agregat et eau */

  String qtciment() {
    if (typeVolume == "Volume_calculé") {
      volume = double.parse(longueur) *
          double.parse(largeur) *
          double.parse(epaisseur) /
          100;
      volume = (volume*0.10) + volume;
    } else {
      volume = double.parse(volumeCo);
      volume = (volume*0.10) + volume;
    }
    volumeCiment =(1 / (double.parse(sable) + double.parse(gravier) + 1)) * volume;
    return arround(volumeCiment * 1200/ 50).toString();
  }

  String qtSable() {
    volumeSable = volumeCiment * double.parse(sable);
    return arround(volumeSable * 1705).toString();
  }

  String qtAgregat() {
    volumeAgregat = volumeCiment * double.parse(gravier);
    return arround(volumeAgregat * 1405).toString();
  }

  String qtEau() {
    return arround(volumeCiment * 780).toString();
  }

  String get volumee {
    if (typeVolume == "Volume_calculé") {
      volume = double.parse(longueur) *
          double.parse(largeur) *
          double.parse(epaisseur) /
          100;
      return arround(volume).toString();
    } else {
      volume = double.parse(volumeCo);
      return arround(volume).toString();
    }
  }

  double arround(double number) {
    return (number * 100).ceil() / 100;
  }
}
