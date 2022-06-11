class User {
       int id;
       String name;
       String email;
       String type;


      User({required this.id,required this.name,required this.email,required this.type});

      factory User.fromJson(Map<String, dynamic> fichierJson) {
        return new User(
            id:fichierJson['id']as int,
            name: fichierJson['name'] ?? "",
            email: fichierJson['email'] ?? "",
            type: fichierJson['type'] ?? "",
           );
            
      }

      
      }