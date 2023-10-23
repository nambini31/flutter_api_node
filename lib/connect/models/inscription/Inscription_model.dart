class InscriptionModel {
  String nom;
  String prenom;
  DateTime dateNaissance;
  String lieuNaissance;
  String email;
  String motDePasse;
  String numeroTelephone;

  InscriptionModel({
    required this.nom,
    required this.prenom,
    required this.dateNaissance,
    required this.lieuNaissance,
    required this.email,
    required this.motDePasse,
    required this.numeroTelephone,
  });
}
