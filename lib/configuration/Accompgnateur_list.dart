import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'Accompgnateur.dart';
import 'package:http/http.dart' as http;

Future<List<Accompgnateur>> bringTheAccompgnateurs() async {
  SharedPreferences sharedPreferences  = await SharedPreferences.getInstance();
  List<Accompgnateur> AccompgnateurList = <Accompgnateur>[];


  /*var f1 = Accompgnateur(id: 1, nomArabe: "Chicken Curry Pasta",  prenomArabe: "Raspberries Cake",image: "assets/food/ChickenCurryPasta.jpg", telephoneTunisien: "Chicken",telephoneEtranger: "Fish", sexe: "1", userId: 1);
  var f2 = Accompgnateur(id: 2, nomArabe: "Explosion Burger", prenomArabe: "Raspberries Cake",image: "assets/food/ExplosionBurger.jpg", telephoneTunisien: "Fast Accompgnateur", telephoneEtranger: "Fish",sexe: "2",userId: 2);
  var f3 = Accompgnateur(id: 3, nomArabe: "Grilled Chicken",prenomArabe: "Raspberries Cake", image: "assets/food/GrilledChicken.jpg", telephoneTunisien: "Chicken", telephoneEtranger: "Fish",sexe: "1", userId: 2);
  var f4 = Accompgnateur(id: 4, nomArabe: "Grilled Fish",prenomArabe: "Raspberries Cake", image: "assets/food/GrilledFish.jpg", telephoneTunisien: "Fish", telephoneEtranger: "Fish",sexe: "1", userId: 2);
  var f5 = Accompgnateur(id: 5, nomArabe: "Heavenly Pizza",prenomArabe: "Raspberries Cake", image: "assets/food/HeavenlyPizza.jpg", telephoneTunisien: "Fast Accompgnateur",telephoneEtranger: "Fish", sexe: "2", userId: 2);
  var f6 = Accompgnateur(id: 6, nomArabe: "Mandarin Pancake",prenomArabe: "Raspberries Cake", image: "assets/food/MandarinPancake.jpg", telephoneTunisien: "Bakery", telephoneEtranger: "Fish",sexe: "1", userId: 2);
  var f7 = Accompgnateur(id: 7, nomArabe: "Organic Mandarin",prenomArabe: "Raspberries Cake", image: "assets/food/OrganicMandarin.jpg", telephoneTunisien: "Fruit",telephoneEtranger: "Fish", sexe: "2", userId: 4);
  var f8 = Accompgnateur(id: 8, nomArabe: "Organic Orange",prenomArabe: "Raspberries Cake", image: "assets/food/OrganicOrange.jpg", telephoneTunisien: "Fruit", telephoneEtranger: "Fish",sexe: "2", userId: 3);
  var f9 = Accompgnateur(id: 9,nomArabe: "Raspberries Cake",prenomArabe: "Raspberries Cake", image: "assets/food/RaspberriesCake.jpg", telephoneTunisien: "Bakery", telephoneEtranger: "Fish",sexe: "2", userId: 2);

  AccompgnateurList.add(f1);
  AccompgnateurList.add(f2);
  AccompgnateurList.add(f3);
  AccompgnateurList.add(f4);
  AccompgnateurList.add(f5);
  AccompgnateurList.add(f6);
  AccompgnateurList.add(f7);
  AccompgnateurList.add(f8);
  AccompgnateurList.add(f9);*/
  var response = await http.get(
    Uri.parse(sharedPreferences.getString("url")!+'/Mobile/accompg'),
    headers: <String, String>{
      'Content-Type': 'charset=UTF-8',
      'Access-Control-Allow-Origin': '*',
    },
  );

  var data = await json.decode(response.body)['accompagnateur'] as List;
print(data);
  AccompgnateurList = data.map((i) => Accompgnateur.fromJson(i)).toList();

 return AccompgnateurList;
}
