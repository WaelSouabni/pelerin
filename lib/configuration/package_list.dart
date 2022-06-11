import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package.dart';

Future<List<Package>> bringThePackages() async {
  List<Package> PackageList = <Package>[];
  SharedPreferences sharedPreferences  = await SharedPreferences.getInstance();

  var response = await http.get(
    Uri.parse(sharedPreferences.getString("url")!+'/Mobile/volaccom'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Access-Control-Allow-Origin': '*',
    },
  );

  var data = await json.decode(response.body)['packages'] as List;
print(data);
  PackageList = data.map((i) => Package.fromJson(i)).toList();

 return PackageList;
}
