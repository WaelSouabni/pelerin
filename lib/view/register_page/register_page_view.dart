import 'dart:convert';

import 'package:flutter/material.dart';
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
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController mailController = new TextEditingController();

  bool passwordObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                BackgroundImage(),
                RegisterTextField(),
                RegisterButton(),
                TextSignIn()
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
          TextFieldInputusername(),
          TextFieldInputemail(),
          TextFieldPassword(),
          TextFieldPassword(),
        ]));
  }

  //
  TextFieldInputusername() {
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
          controller: nameController,
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
              hintText: 'اسم االمستخدم',
              hintStyle: TextStyle(color: texthint.withOpacity(0.3)),
              labelText: 'اسم االمستخدم',
              labelStyle: TextStyle(color: texthint.withOpacity(0.6))),
        ),
      ),
    );
  }

  //
  TextFieldInputemail() {
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
          controller: mailController,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.mail),
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
              hintText: 'البريد الالكتروني',
              hintStyle: TextStyle(color: texthint.withOpacity(0.3)),
              labelText: 'البريد الالكتروني',
              labelStyle: TextStyle(color: texthint.withOpacity(0.6))),
        ),
      ),
    );
  }

  //
  TextFieldPassword() {
    SizeConfig().init(context);
    return Center(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            SizeConfig.screenWidth! / 20.55,
            SizeConfig.screenHeight! / 68.3,
            SizeConfig.screenWidth! / 20.55,
            SizeConfig.screenHeight! / 34.15),
        child: TextField(
          obscureText: passwordObscure,
          style: TextStyle(color: textColor),
          controller: passwordController,
          cursorColor: textColor,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.vpn_key),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    passwordObscure = !passwordObscure;
                  });
                },
                icon: Icon(
                    passwordObscure ? Icons.visibility_off : Icons.visibility),
              ),
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
              hintText: "كلمة السر",
              hintStyle: TextStyle(color: texthint.withOpacity(0.3)),
              labelText: "كلمة السر",
              labelStyle: TextStyle(color: texthint.withOpacity(0.6))),
        ),
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
                                    nameController.text,
                                    mailController.text,
                                    passwordController.text);
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
  //registre

  Future<void> _Registre(String name, String mail, String password) async {
    //After successful login we will redirect to profile page. Let's create profile page now
  SharedPreferences sharedPreferences  = await SharedPreferences.getInstance();
    final response = await http.post(
      Uri.parse(sharedPreferences.getString("url")!+'/Mobile/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'email': mail,
        'password': password,
      }),
    );
    print(response.body.length);
    var datauser = json.decode(response.body);
    // print(datauser["success"]);
    if (datauser["success"]) {
      User userdata = User.fromJson(datauser["user"]);
      // print(datauser);
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      sharedPreferences.setString("token", 'True');
      sharedPreferences.setInt("idUser", userdata.id);
      sharedPreferences.setString("userName", userdata.name);
      sharedPreferences.setString("userMail", userdata.email);
    

     /* Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MyHomePage()));*/
        Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MyHomePage()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => RegisterPageView()));
    }
  }
}
