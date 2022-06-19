class Message {
  int id;
  String description;
  //int etat;
  String? reponseDescription;

  Message({
    required this.id,
    required this.description,
    //required this.etat,
    required this.reponseDescription,
  });

  factory Message.fromJson(Map<String, dynamic> fichierJson) {
    return Message(
      id: fichierJson['id'],
      description: fichierJson['description'].toString(),
      reponseDescription: fichierJson['reponseDescription'].toString(),
      //etat: fichierJson['etat'],
    );
  }
}
