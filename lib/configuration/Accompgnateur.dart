

class Accompgnateur {
 int id;
 String? nomArabe;
 String? prenomArabe;
 String? telephoneTunisien;
 String? telephoneEtranger;
 String? sexe;
 int? userId;
 String? image;
 
  Accompgnateur({
    required this.id,
    required this.nomArabe,
    required this.prenomArabe,
    required this.telephoneTunisien,
    required this.telephoneEtranger,
    required this.sexe,
    required this.userId, 
    required this.image,});

  factory Accompgnateur.fromJson(Map<String, dynamic> fichierJson) {
    return Accompgnateur(
      id: fichierJson['id'],
      nomArabe: fichierJson['nomArabe'].toString(),
      prenomArabe: fichierJson['prenomArabe'].toString(),
      telephoneTunisien: fichierJson['telephoneTunisien'].toString(),
      telephoneEtranger: fichierJson['telephoneEtranger'].toString(),
      sexe: fichierJson['sexe'].toString(),
      image: fichierJson["image"].toString(),
      userId: fichierJson['user_id'],
    );
  }
}