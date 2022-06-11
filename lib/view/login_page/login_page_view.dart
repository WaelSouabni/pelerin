import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../configuration/user.dart';
import '../bottom_navigator.dart';
import '../home_page/components/colors.dart';
import '../home_page/components/size_config.dart';
import 'widgets/forgot_password.dart';
import 'widgets/logo.dart';
import 'widgets//text_signup.dart';
import 'package:http/http.dart' as http;

class LoginPageView extends StatefulWidget {
  const LoginPageView({Key? key}) : super(key: key);

  @override
  _LoginPageViewState createState() => _LoginPageViewState();
}

class _LoginPageViewState extends State<LoginPageView> {
    final TextEditingController emailController = new TextEditingController();
    final TextEditingController passwordController = new TextEditingController();
    late SharedPreferences sharedPreferences;
    bool passwordObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              LogoImage(),
              LoginTextField(),
              ForgotPassword(),
              LoginButonColor(),
              TextSignUp()
            ],
          ),
        ),
      )
    );
  }
   LoginTextField(){
       return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFieldInput(),
            TextFieldPassword(),
          ]
        )
    );

   }

   //

    TextFieldInput(){
         SizeConfig().init(context);
    return Center(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            SizeConfig.screenWidth!/20.55,
            SizeConfig.screenHeight!/68.3,
            SizeConfig.screenWidth!/20.55,
            SizeConfig.screenHeight!/34.15
        ),
        child: TextField(
          style: TextStyle(color: textColor),
          cursorColor: textColor,
          controller: emailController,
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.mail),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                borderSide: BorderSide(width: SizeConfig.screenWidth!/205.5, color: textColor),  /// 2
              ),
              enabledBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(width: 1,color: texthint),
              ) ,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              hintText: "البريد الإلكتروني",
              hintStyle: TextStyle(color: texthint.withOpacity(0.3)),
              labelText: "البريد الإلكتروني",
              labelStyle: TextStyle(color: texthint.withOpacity(0.6))
          ),
        ),
      ),
    );
   }
   ///
   TextFieldPassword(){

        SizeConfig().init(context);
    return Center(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            SizeConfig.screenWidth!/20.55,
            SizeConfig.screenHeight!/68.3,
            SizeConfig.screenWidth!/20.55,
            SizeConfig.screenHeight!/34.15
        ),
        child: TextField(
          obscureText: passwordObscure,
          style: TextStyle(color: textColor),
          controller:  passwordController,
          cursorColor: textColor,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.vpn_key),
              suffixIcon: IconButton(
                onPressed: (){
                  setState((){
                    passwordObscure = !passwordObscure;
                  });
                },
                icon: Icon(
                  passwordObscure ? Icons.visibility_off : Icons.visibility
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                borderSide: BorderSide(width: SizeConfig.screenWidth!/205.5, color: textColor),      /// 2
              ),
              enabledBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(width: 1,color: texthint),
              ) ,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              hintText: "كلمة السر",
              hintStyle: TextStyle(color: texthint.withOpacity(0.3)),
              labelText: "كلمة السر",
              labelStyle: TextStyle(color: texthint.withOpacity(0.6))
          ),
        ),
      ),
    );

   }
   ///
   
   LoginButonColor(){
     SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.fromLTRB(
          SizeConfig.screenWidth! / 20.55,
          SizeConfig.screenHeight! / 7.59,
          SizeConfig.screenWidth! / 20.55,
          SizeConfig.screenHeight! / 45.54),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
          ],
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            stops: [0.0, 1.0],
            colors: [
              buttonColor,
              lightColor,
            ],
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
            minimumSize: MaterialStateProperty.all(Size(
                SizeConfig.screenWidth! / 1.37,
                SizeConfig.screenHeight! / 13.66)),
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            shadowColor: MaterialStateProperty.all(Colors.transparent),
          ),
          onPressed: () {
               // print(emailController.text);
               // print(passwordController.text);
                    _seConnecter(emailController.text,
                                        passwordController.text);
               // print(widget.password);
           // Navigator.pushReplacement(
          
                //context, MaterialPageRoute(builder: (context) => MyHomePage()));
          },
          child: Text(
            "الدخول",
            style: TextStyle(
              fontSize: SizeConfig.screenHeight! / 42.68,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),

            /// 16
          ),
        ),
      ),
    );
   }
   ///
     Future<void> _seConnecter(String mail, String password) async {
    //After successful login we will redirect to profile page. Let's create profile page now
  SharedPreferences sharedPreferences  = await SharedPreferences.getInstance();
    //print(mail);
    //  print(password);
    final response = await http.post(
      Uri.parse(sharedPreferences.getString("url")!+'/Mobile/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': mail,
        'password': password,
      }),
    );
    // print(response.body.length);
    var datauser = json.decode(response.body);
    // print(datauser["user"]);
    if (datauser["success"]) {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      print(datauser["user"][0]);
      User userdata = User.fromJson(datauser["user"][0]);
      sharedPreferences.setString("token", 'True');
      sharedPreferences.setInt("idUser", userdata.id);
      sharedPreferences.setString("userName", userdata.name);
      sharedPreferences.setString("userMail", userdata.email);

   Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => MyHomePage()));
    } else {
      Future.delayed(Duration.zero, () => showAlert(context));
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginPageView()));
    }
  }
   //
     void showAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text("أعد التثبت من المعلومات المقدمة"),
              actions: <Widget>[
                // usually buttons at the bottom of the dialog
                new FlatButton(
                  child: new Text("حاول مرة أخرى"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ));
  }
}
