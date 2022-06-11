class Package {
  int id;
  String labelle;
  String description;
  int NombrePlace;
  int NombrePlaceRestant;
  int prix;
  DateTime dateDepart;
  String? image;
  int NombreAccRestant;

  Package({
    required this.id,
    required this.labelle,
    required this.description,
    required this.NombrePlace,
    required this.NombrePlaceRestant,
    required this.prix,
    required this.dateDepart,
    required this.image,
    required this.NombreAccRestant,
  });

  factory Package.fromJson(Map<String, dynamic> fichierJson) {
    return Package(
      id: fichierJson['id'],
      labelle: fichierJson['labelle'].toString(),
      description: fichierJson['description'].toString(),
      NombrePlace: fichierJson['NombrePlace'],
      NombrePlaceRestant: fichierJson['NombrePlaceRestant'],
      prix: fichierJson['prix'],
      image: fichierJson["image"].toString(),
      dateDepart: DateTime.parse(fichierJson['dateDepart']),
      NombreAccRestant: fichierJson['NombreAccRestant'],
    );
  }
}
