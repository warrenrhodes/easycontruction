class AnalysePourtre {
  String longueur;
  String epaisseur;
  String hauteur;

  AnalysePourtre(this.longueur, this.epaisseur, this.hauteur, this.quantite);

  double volumePoteau;
  double volumeCiment;
  double volumeSable;
  double volumeAgregat;
  double volumeEau;
  double nbrecadre;
  String quantite;

  String qtciment(String sable, String agregat) {
    volumePoteau = (double.parse(longueur) *
        double.parse(epaisseur) /
        100 *
        double.parse(hauteur) /
        100)*double.parse(quantite);
    volumePoteau = (volumePoteau*0.10) + volumePoteau;
    volumeCiment =
        (1 / (double.parse(sable) + double.parse(agregat) + 1)) * volumePoteau;

    /*la densite du ciment est de 1440 Kg/m3 et a supposer que 50kg soit le poid dun sac de ciment */
    return arround(volumeCiment * 1200/ 50).toString();
  }

  String qtSable(String sable) {
    /*la densite du ciment est de 1650 Kg/m3*/
    volumeSable = (volumeCiment * double.parse(sable));
    return arround(volumeSable * 1705).toString();
  }

  String qtAgregat(String agregat) {
    /*la densite du ciment est de 1520 Kg/m3*/
    volumeAgregat = volumeCiment * double.parse(agregat);
    return arround(volumeAgregat * 1405).toString();
  }

  String qtEau() {
    return arround(volumeCiment * 780).toString();
  }

  String get volumepoteau {
    volumePoteau = (double.parse(longueur) *
        double.parse(epaisseur) /
        100 *
        double.parse(hauteur) /
        100)*double.parse(quantite);
    volumePoteau = (volumePoteau*0.10) + volumePoteau;
    return arround(volumePoteau).toString();
  }

  double nbrBarpoteau(String quantite, String nbrebar) {
    return arround(double.parse(longueur) *
        double.parse(nbrebar) *
        double.parse(quantite) /
        12);
  }

  String nbrBarCadre(String espacement, String quantite) {
    nbrecadre = (double.parse(longueur) / (double.parse(espacement) / 100)) *
        double.parse(quantite);
    double dimenssioncadre =
        (((((double.parse(hauteur) - 3 + double.parse(epaisseur) - 3) * 2) +
                        6) *
                    nbrecadre) /
                100) /
            12;

    return arround(dimenssioncadre).toString();
  }

  String get quantitecadre {
    return arround(nbrecadre).toString();
  }

  double arround(double number) {
    return (number * 100).ceil() / 100;
  }
}
