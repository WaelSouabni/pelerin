import 'dart:convert';

import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:pelerin/view/login_page/login_page_view.dart';
import '../bottom_navigator.dart';

import 'package:shared_preferences/shared_preferences.dart';
import '../../configuration/user.dart';
import '../home_page/components/colors.dart';
import '../home_page/components/size_config.dart';
import 'package:http/http.dart' as http;

import 'widgets/background_image.dart';
import 'widgets/text_signin.dart';

class RegisterPageView extends StatefulWidget {
  const RegisterPageView({Key? key}) : super(key: key);

  @override
  _RegisterPageViewState createState() => _RegisterPageViewState();
}

class _RegisterPageViewState extends State<RegisterPageView> {
  final TextEditingController phoneController = new TextEditingController();
  final TextEditingController NumeroPasseController = new TextEditingController();
  DateTime? selectedDateEmmesion;
  DateTime? selectedDateExperation;



   late SharedPreferences sharedPreferences;

  //
  String labelle = "";

   checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getString("token") == null) {
          Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const LoginPageView()));    }
          
    setState(() {
      labelle = sharedPreferences.getString("labellePackage")!;
    });

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
                BackgroundImage(labelle:  labelle),
                RegisterTextField(),
                RegisterButton(),

              ],
            ),
          ),
        ));
  }
  //

  RegisterTextField() {
    return Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                 phoneTextField(),
                 numeroPassTextField(),
                 dateEmessionTextField(),
                 dateExperationTextField(),
        ]));
  }

    //nomTextField
  numeroPassTextField() {
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
          cursorColor: textColor,
          controller: NumeroPasseController,
          onChanged: (text) {
                //print("Text $text");
                  sharedPreferences.setString("numeroPassport", text);
              },
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.account_circle),
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
              hintText: 'رقم جواز السفر',
              hintStyle: TextStyle(color: texthint.withOpacity(0.3)),
              labelText:  'رقم جواز السفر',
              labelStyle: TextStyle(color: texthint.withOpacity(0.6))),
        ),
      ),
    );
  }
         
  //dateEmessionTextField
  dateEmessionTextField() {
    SizeConfig().init(context);
    return Center(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            SizeConfig.screenWidth! / 20.55,
            SizeConfig.screenHeight! / 68.3,
            SizeConfig.screenWidth! / 20.55,
            SizeConfig.screenHeight! / 34.15),
        child: DateTimeField(
            decoration: const InputDecoration(hintText: 'تاريخ استخراج جواز السفر'),
            selectedDate: selectedDateEmmesion,
            onDateSelected: (DateTime value) {
              setState(() {
                selectedDateEmmesion = value;
              });
               sharedPreferences.setString("dateEmession", value.toString());
            }),
      ),
    );
  }

  // dateExperationTextField()
  dateExperationTextField() {
    SizeConfig().init(context);
    return Center(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            SizeConfig.screenWidth! / 20.55,
            SizeConfig.screenHeight! / 68.3,
            SizeConfig.screenWidth! / 20.55,
            SizeConfig.screenHeight! / 34.15),
        child: DateTimeField(
            decoration: const InputDecoration(hintText: 'تاريخ انتاء صلاحية جواز السفر'),
            selectedDate: selectedDateExperation,
            onDateSelected: (DateTime value) {
              setState(() {
                selectedDateExperation = value;
              });
              sharedPreferences.setString("expiration", value.toString());
            }),
      ),
    );
  }

  //
  RegisterButton() {
    
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
                                    phoneController.text,
                                    NumeroPasseController.text,
                                   );
          },
          child: Text(
            "اشتراك",
            style: TextStyle(fontSize: SizeConfig.screenHeight!/42.68,  fontWeight: FontWeight.w700, color: Colors.white,),   /// 16
          ),
        ),
      ),
    );
  }
  //
  //phoneController ||
  phoneTextField() {
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
          cursorColor: textColor,
          controller: phoneController,
          onChanged: (text) {
            //print("Text $text");
            sharedPreferences.setString("phone", text);
          },
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.phone),
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
              hintText: 'رقم الهاتف',
              hintStyle: TextStyle(color: texthint.withOpacity(0.3)),
              labelText: 'رقم الهاتف',
              labelStyle: TextStyle(color: texthint.withOpacity(0.6))),
        ),
      ),
    );
  }

 
  //registre

  Future<void> _Registre(String phone, String numpassport) async {
    //After successful login we will redirect to profile page. Let's create profile page now
  SharedPreferences sharedPreferences  = await SharedPreferences.getInstance();
    final response = await http.post(
      Uri.parse(sharedPreferences.getString("url")!+'/Mobile/PelerinUpdat'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
       'telephoneTunisien': phone,
        'numeroDePassport': numpassport,
        'dateExpiration': sharedPreferences.getString("expiration")!,
        'dateEmission': sharedPreferences.getString("dateEmession")!,
        'package_id':  (sharedPreferences.getInt("idPackage")!),
        'user_id':  (sharedPreferences.getInt("idUser")!),

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
        Future.delayed(Duration.zero, () => showAlertErr(context));
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => RegisterPageView()));
    }
  }
     
          void showAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text("تم تسجيلك بنجاح"),
              actions: <Widget>[
                // usually buttons at the bottom of the dialog
                new FlatButton(
                  child: new Text("غلق"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ));
  }
  /// 
  void showAlertErr(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text("حدث خطأ أعد المحاولة مرة أخرى أو اترك رسالة "),
              actions: <Widget>[
                // usually buttons at the bottom of the dialog
                new FlatButton(
                  child: new Text("أعد المحاولة"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ));
  }
}
