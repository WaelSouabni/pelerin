import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:pelerin/view/login_page/login_page_view.dart';
import 'package:pelerin/view/password_page/widgets/background_image.dart';


import 'package:shared_preferences/shared_preferences.dart';

import '../bottom_navigator.dart';
import '../home_page/components/colors.dart';
import '../home_page/components/size_config.dart';
import 'package:http/http.dart' as http;



class PasswordPageView extends StatefulWidget {
  const PasswordPageView({Key? key}) : super(key: key);

  @override
  _PasswordPageViewState createState() => _PasswordPageViewState();
}

class _PasswordPageViewState extends State<PasswordPageView> {
  final TextEditingController passwordController = new TextEditingController();
    late SharedPreferences sharedPreferences;
    bool passwordObscure = true;
    final _formKey = GlobalKey<FormState>();
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
          child: Form(//SingleChildScrollView
          key: _formKey,
            child: Column(
              children: [
                const BackgroundImage(),
                passwordTextField(),
              ],
            ),
          ),
        ));
  }
  //

  passwordTextField() {
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
            SizeConfig.screenWidth!/20.55,
            SizeConfig.screenHeight!/68.3,
            SizeConfig.screenWidth!/20.55,
            SizeConfig.screenHeight!/34.15
        ),
        child: TextFormField(
          textAlign: TextAlign.right,
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
              labelStyle: TextStyle(color: texthint.withOpacity(0.6)),
          ),
           validator: (value) {
              if (value == null || value.isEmpty ||value.length < 8) {
                return 'الرجاء إدخال كلمة السر';
              }
              return null;
            },
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
                 if (_formKey.currentState!.validate()) {
               _Registre(
                passwordController.text,);
                }
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

  //
  //registre

  Future<void> _Registre(String password) async {
    //After successful login we will redirect to profile page. Let's create profile page now
  SharedPreferences sharedPreferences  = await SharedPreferences.getInstance();
    final response = await http.post(
      Uri.parse(sharedPreferences.getString("url")!+'/Mobile/updatePassword'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "password": password,
        "user_id": sharedPreferences.getInt("idUser")!,
      }),
    );
    print(response.body.length);
    var datauser = json.decode(response.body);
    // print(datauser["success"]);
    if (response.statusCode == 200) {
      Future.delayed(Duration.zero, () => showAlert(context));
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MyHomePage()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const PasswordPageView()));
    }
  }
     void showAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text("تم تعديل كلمة السر "),
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
