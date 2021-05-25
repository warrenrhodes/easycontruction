import "dart:math";

class AnalysePilier {
  AnalysePilier(
      this.typePilier,
      this.longueur,
      this.largeur,
      this.base,
      this.cote,
      this.hauteur,
      this.sable,
      this.gravier,
      this.espacement,
      this.quantite,
      this.nbrebar,
      this.diametre);

  String typePilier;
  String gravier;
  String sable;
  String hauteur;
  String longueur;
  String largeur;
  String nbrebar;
  String quantite;
  String espacement;
  String cote;
  String base;
  String diametre;
  int nbrecadre;

  double volumePoteau;
  double volumeCiment;
  double volumeSable;
  double volumeAgregat;
  double volumeEau;

  /*calculer de la quantiter dfre ciment, sable , agregat et eau */

  String qtciment() {
    if (typePilier == "Pilier Circulaire") {
      volumePoteau =
          ((pow(double.parse(diametre) / 100, 2) * pi * double.parse(hauteur)) /
              4)*double.parse(quantite);
      volumePoteau = (volumePoteau*0.10) + volumePoteau;
    } else if (typePilier == "Pilier") {
      volumePoteau = (double.parse(longueur) /
          100 *
          double.parse(largeur) /
          100 *
          double.parse(hauteur))*double.parse(quantite);
      volumePoteau = (volumePoteau*0.10) + volumePoteau;

    } else {
      volumePoteau = (double.parse(base) /
          100 *
          double.parse(cote) /
          100 *
          double.parse(hauteur))*double.parse(quantite);
      volumePoteau = (volumePoteau*0.10) + volumePoteau;

    }
    volumeCiment =
        (1 / (double.parse(sable) + double.parse(gravier) + 1)) * volumePoteau;
    /*la densite du ciment est de 1440 Kg/m3 et a supposer que 50kg soit le poid dun sac de ciment */
    return arround(volumeCiment * 1200 / 50).toString();
  }

  String qtSable(String sable) {
    /*la densite du ciment est de 1650 Kg/m3*/
    volumeSable = (volumeCiment * double.parse(sable));
    return arround(volumeSable * 1705).toString();
  }

  String qtAgregat() {
    /*la densite du ciment est de 1520 Kg/m3*/
    volumeAgregat = volumeCiment * double.parse(gravier);
    return arround(volumeAgregat * 1405).toString();
  }

  String qtEau() {
    return arround(volumeCiment * 780).toString();
  }

  String get volumepoteau {
    if (typePilier == "Pilier Circulaire") {
      volumePoteau =
          ((pow(double.parse(diametre) / 100, 2) * pi * double.parse(hauteur)) /
              4*double.parse(quantite));
      volumePoteau = (volumePoteau*0.10) + volumePoteau;
    } else if (typePilier == "Pilier") {
      volumePoteau = (double.parse(longueur) /
          100 *
          double.parse(largeur) /
          100 *
          double.parse(hauteur))*double.parse(quantite);
      volumePoteau = (volumePoteau*0.10) + volumePoteau;
    } else {
      volumePoteau = (double.parse(base) /
          100 *
          double.parse(cote) /
          100 *
          double.parse(hauteur)*double.parse(quantite));
      volumePoteau = (volumePoteau*0.10) + volumePoteau;
    }
    return arround(volumePoteau).toString();
  }

  /*analyse de la quantite de bar pour pillier*/
  double nbrBarpoteau() {
    return arround(double.parse(hauteur) *
        double.parse(nbrebar) *
        double.parse(quantite) /
        12);
  }

  String nbrBarCadre() {
    double dimenssioncadre;
    nbrecadre = ((double.parse(hauteur) / (double.parse(espacement) / 100)) *
            double.parse(quantite))
        .ceil();
    if (typePilier == "Pilier Circulaire") {
      dimenssioncadre = ((pi * double.parse(diametre) * nbrecadre) / 100) / 12;
    } else if (typePilier == "Pilier") {
      dimenssioncadre =
          (((((double.parse(longueur) - 3 + double.parse(largeur) - 3) * 2) +
                          6) *
                      nbrecadre) /
                  100) /
              12;
    } else {
      dimenssioncadre =
          ((((double.parse(base) - 3 + ((double.parse(cote) - 3) * 2)) + 6) *
                      nbrecadre) /
                  100) /
              12;
    }

    return dimenssioncadre.toStringAsFixed(2);
  }

  String get quantitecadre {
    return nbrecadre.toString();
  }

  double arround(double number) {
    return (number * 100).ceil() / 100;
  }
}
