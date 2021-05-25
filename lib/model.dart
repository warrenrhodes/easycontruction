import 'package:flutter/material.dart';

class Model {
   static Model value = Model();
   String prixParpaint;
   String devise;
   String prixfer6;
   String fer;
   String fer10;
   String fer12;
   String fer14;
   String prixfer;
   String longCarreaux;
   String largeurCarreaux;
   String longueurParpaing;
   String epaisseurParpaing;
   String hauteurParpaing;
   String ciment20;
   String ciment50;
   String prixCarreaux;

  Model({
    this.prixfer= "4000",
    this.hauteurParpaing= "20" ,
    this.longueurParpaing = "40",
    this.epaisseurParpaing = "20",
    this.prixCarreaux = "8000",
    this.ciment20 = "2500",
    this.ciment50 = '4700',
    this.longCarreaux = "40",
    this.largeurCarreaux = "40",
    this.devise = "XAF",
    this.prixParpaint="250",
  this.prixfer6 = "2500",
  this.fer= "8",
  this.fer10 = "0",this.fer12 = "0",this.fer14 = "0"});
}