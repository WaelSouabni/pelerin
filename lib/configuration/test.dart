import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

import 'Accompgnateur.dart';

class AccompagnateurApi {
  static Future<List<Accompgnateur>> getBooks(String query) async {
      SharedPreferences sharedPreferences  = await SharedPreferences.getInstance();
       final response = await http.get(Uri.parse(sharedPreferences.getString("url")!+'/Mobile/accompg'),
    headers: <String, String>{
      'Content-Type': 'charset=UTF-8',
      'Access-Control-Allow-Origin': '*',
    },);

    if (response.statusCode == 200) {
      final List books = json.decode(response.body)['accompagnateur'] as List;

      return books.map((json) => Accompgnateur.fromJson(json)).where((Accompgnateur) {
        final titleLower = Accompgnateur.nomArabe!.toLowerCase();
        final authorLower = Accompgnateur.prenomArabe!.toLowerCase();
        final searchLower = query.toLowerCase();

        return titleLower.contains(searchLower) ||
            authorLower.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}
