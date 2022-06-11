import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../home_page/components/colors.dart';
import '../../home_page/components/size_config.dart';
import 'package:date_field/date_field.dart';
import 'package:select_form_field/select_form_field.dart';

class Compte extends StatefulWidget {
  const Compte({Key? key}) : super(key: key);

  @override
  _CompteState createState() => _CompteState();
}

class _CompteState extends State<Compte> {
 /* final TextEditingController passwordController = new TextEditingController();
  final TextEditingController nomController = new TextEditingController();
  final TextEditingController prenomController = new TextEditingController();
  final TextEditingController phoneController = new TextEditingController();
  
  DateTime? selectedDate;
  var sexe = '0';

  
  // select items
  final List<Map<String, dynamic>> _items = [
    {
      'value': '0',
      'label': 'رجل',
      'icon': const Icon(Icons.man),
    },
    {
      'value': '1',
      'label': 'امرأة',
      'icon': const Icon(Icons.woman),
    },
  ];*/
    final TextEditingController passwordController = new TextEditingController();
    final TextEditingController nameController = new TextEditingController();
    final TextEditingController mailController = new TextEditingController();
    late SharedPreferences sharedPreferences;
    bool passwordObscure = true;


  @override
  void initState() {
    checkLoginStatus();

    super.initState();
  }

  //
  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();

  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFieldInputusername(),
          TextFieldInputemail(),
          TextFieldPassword(),
        ],
      ),
    );
  }

// TextFieldInputusername
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
          onChanged: (text) {
            //print("Text $text");
            sharedPreferences.setString("name", text);
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
              hintText: ' اسم المستخدم ',
              hintStyle: TextStyle(color: texthint.withOpacity(0.3)),
              labelText: ' اسم المستخدم ',
              labelStyle: TextStyle(color: texthint.withOpacity(0.6))),
        ),
      ),
    );
  }

  //TextFieldInputemail
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
          onChanged: (text) {
            //print("Text $text");
            sharedPreferences.setString("mail", text);
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
              hintText: 'البريد الالكتروني',
              hintStyle: TextStyle(color: texthint.withOpacity(0.3)),
              labelText: 'البريد الالكتروني',
              labelStyle: TextStyle(color: texthint.withOpacity(0.6))),
        ),
      ),
    );
  }

  //TextFieldPassword
  TextFieldPassword() {
    SizeConfig().init(context);
    return Center(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            SizeConfig.screenWidth! / 20.55,
            SizeConfig.screenHeight! / 68.3,
            SizeConfig.screenWidth! / 20.55,
            SizeConfig.screenHeight! / 34.15),
        child:  TextField(
          obscureText: passwordObscure,
          style: TextStyle(color: textColor),
          controller: passwordController,
          cursorColor: textColor,
           onChanged: (text) {
            //print("Text $text");
            sharedPreferences.setString("password", text);
          },
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
}
