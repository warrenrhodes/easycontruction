import 'dart:math';

class Calcul {
  int Nbreparpaing;
  double nbreciment;
  double nbresable;
  double volumeMaconnerie;
  double volumeSenJoint;
  double quantiteCiment;
  double volumemortier;

  String Nbre_parpaing(
    String type_de_surface,
    String hauteur_p,
    String longueur_p,
    String zone,
    String ouverture,
    String hauteur_surf,
    String longueur_surf,
    String epaisseurM,
    String epaisseurP,
  ) {
    double surface;
    volumeSenJoint = (double.parse(longueur_p) / 100) *
        (double.parse(hauteur_p) / 100) *
        (double.parse(epaisseurP) / 100);
    if (type_de_surface == "Surface en m²") {
      print(double.parse(zone));
      surface = double.parse(zone) - double.parse(ouverture);
    } else {
      surface = (double.parse(hauteur_surf) * double.parse(longueur_surf)) -
          double.parse(ouverture);
    }
    volumeMaconnerie = surface * (double.parse(epaisseurM) / 100);
    Nbreparpaing = (volumeMaconnerie / volumeSenJoint).ceil();
    volumemortier = ((double.parse(epaisseurM) /
                100 *
                double.parse(longueur_p) /
                100 *
                0.010) +
            (double.parse(epaisseurM) /
                100 *
                double.parse(hauteur_p) /
                100 *
                0.010)) *
        Nbreparpaing;
    return Nbreparpaing.toString();
  }

  /* String QuantiteMotier() {
    VolumeOcuppeParBrique = Nbreparpaing * volumeSenJoint;
*/ /*Volume occupé par les briques = nombre de briques x volume d’une brique

Volume de briques = 500 x 0,001539 = 0,7695 m3

Volume de mortier = Volume de mur – Volume de briques

Volume de mortier = 1,0 – 0,7695 = 0,2305 m3*/ /*

  }*/

  String nbreSacCiment() {
    quantiteCiment = volumemortier * 400;
    nbreciment = quantiteCiment / 50;
    return arround(nbreciment).toString();
  }

  String qteSable() {
    double quantitesable = (quantiteCiment * 1400 / 400);
    return "${arround(quantitesable)}";
  }

  String qteEau() {
    return (nbreciment * 50).ceil().toString();
  }

  String get quantiteMotier {
    return "${arround(volumemortier)}";
  }

  double arround(double number) {
    return (number * 100).ceil() / 100;
  }
}
