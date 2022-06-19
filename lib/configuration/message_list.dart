import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:pelerin/configuration/Message.dart';
import 'package:shared_preferences/shared_preferences.dart';


Future<List<Message>> bringTheMessagesList() async {
  List<Message> MessageList = <Message>[];
  SharedPreferences sharedPreferences  = await SharedPreferences.getInstance();

  var response = await http.get(
    Uri.parse(sharedPreferences.getString("url")!+'/Mobile/listMessage/'+sharedPreferences.getInt("idUser").toString()),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Access-Control-Allow-Origin': '*',
    },
  );

  var data = await json.decode(response.body)['messages'] as List;
print(data);
  MessageList = data.map((i) => Message.fromJson(i)).toList();

 return MessageList;
}
