import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'pelerinpackage.dart';



Future<List<PelerinPackage>> bringThePackagesPelerin() async {
  List<PelerinPackage> PackagePelerinsList = <PelerinPackage>[];
  SharedPreferences sharedPreferences  = await SharedPreferences.getInstance();

  var response = await http.get(
    Uri.parse('http://localhost:8000/api/listePackagesPelerins/'+sharedPreferences.getInt("idUser").toString()),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Access-Control-Allow-Origin': '*',
    },
  );

  var data = await json.decode(response.body) as List;
print(data);
  PackagePelerinsList = data.map((i) => PelerinPackage.fromJson(i)).toList();

 return PackagePelerinsList;
}

//


