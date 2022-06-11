
import 'package:intl/intl.dart';

class PelerinPackage {

 String labelle;
  String etat;
 DateTime created_at;
  DateTime dateDepart;
 String? image;
 
  PelerinPackage({
    required this.labelle,
    required this.etat,
    required this.created_at,
    required this.dateDepart,
    required this.image,});

  factory PelerinPackage.fromJson(Map<String, dynamic> fichierJson) {
    return PelerinPackage(
      labelle: fichierJson['labelle'].toString(),
      etat: fichierJson['etat'].toString(),
      image: fichierJson["image"].toString(),
      created_at: DateFormat("yyyy-MM-dd").parse(fichierJson['created_at']),
      dateDepart: DateFormat("yyyy-MM-dd").parse(fichierJson['dateDepart']),
    );
  }
}