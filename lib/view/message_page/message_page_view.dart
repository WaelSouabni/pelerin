import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:pelerin/view/login_page/login_page_view.dart';


import 'package:shared_preferences/shared_preferences.dart';

import '../bottom_navigator.dart';
import '../home_page/components/colors.dart';
import '../home_page/components/size_config.dart';
import 'package:http/http.dart' as http;

import 'widgets/background_image.dart';

class MessagePageView extends StatefulWidget {
  const MessagePageView({Key? key}) : super(key: key);

  @override
  _MessagePageViewState createState() => _MessagePageViewState();
}

class _MessagePageViewState extends State<MessagePageView> {
  final TextEditingController descriptionController = new TextEditingController();
    late SharedPreferences sharedPreferences;
     checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getString("token") == null) {
          Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const LoginPageView()));    }
          
 

  }
   @override
  void initState() {
    checkLoginStatus();  
    super.initState();
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const BackgroundImage(),
                messageTextField(),
              ],
            ),
          ),
        ));
  }
  //

  messageTextField() {
    return Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          descriptionTextField(),
          SendButton(),
        ]));
  }

  //
  descriptionTextField() {
    SizeConfig().init(context);
    return Center(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            SizeConfig.screenWidth! / 20.55,
            SizeConfig.screenHeight! / 68.3,
            SizeConfig.screenWidth! / 20.55,
            SizeConfig.screenHeight! / 34.15),
        child: TextField(
          style: TextStyle(color: textColor),
          keyboardType: TextInputType.multiline,
          maxLines: 8,
          maxLength: 1000,
          cursorColor: textColor,
          controller: descriptionController,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.message),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                borderSide: BorderSide(
                    width: SizeConfig.screenWidth! / 205.5, color: textColor),

                /// 2
              ),
              enabledBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(width: 1, color: texthint),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              hintText: 'نص الرسالة',
              hintStyle: TextStyle(color: texthint.withOpacity(0.3)),
              labelText: 'نص الرسالة',
              labelStyle: TextStyle(color: texthint.withOpacity(0.6))),
        ),
      ),
    );
  }


  //
  SendButton() {
    
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.fromLTRB(
          SizeConfig.screenWidth!/20.55,
          SizeConfig.screenHeight!/17.075,
          SizeConfig.screenWidth!/20.55,
          SizeConfig.screenHeight!/45.54
      ),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)],
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            stops: [0.0, 1.0],
            colors: [buttonColor, lightColor,],
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            minimumSize: MaterialStateProperty.all(Size(SizeConfig.screenWidth!/1.37, SizeConfig.screenHeight!/13.66)),
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            shadowColor: MaterialStateProperty.all(Colors.transparent),
          ),
          onPressed: () {
           // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPageView()));
               _Registre(
                                    descriptionController.text,);
          },
          child: Text(
            "إرسال",
            style: TextStyle(fontSize: SizeConfig.screenHeight!/42.68,  fontWeight: FontWeight.w700, color: Colors.white,),   /// 16
          ),
        ),
      ),
    );
  }
  //
  //registre

  Future<void> _Registre(String description) async {
    //After successful login we will redirect to profile page. Let's create profile page now
  SharedPreferences sharedPreferences  = await SharedPreferences.getInstance();
    final response = await http.post(
      Uri.parse(sharedPreferences.getString("url")!+'/messages'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "description": description,
        "user_id": sharedPreferences.getInt("idUser")!,
        "etat":"1"
      }),
    );
    print(response.body.length);
    var datauser = json.decode(response.body);
    // print(datauser["success"]);
    if (datauser["success"]) {
      Future.delayed(Duration.zero, () => showAlert(context));
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MyHomePage()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const MessagePageView()));
    }
  }
     void showAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text("تم ترك رساله"),
              actions: <Widget>[
                // usually buttons at the bottom of the dialog
                new FlatButton(
                  child: new Text("إنهاء"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ));
  }
}
