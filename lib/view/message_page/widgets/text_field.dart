import 'package:flutter/material.dart';

import '../../home_page/components/colors.dart';
import '../../home_page/components/size_config.dart';
import '../../login_page/widgets/text_field_widget/text_field_input.dart';

class RegisterTextField extends StatefulWidget {
  const RegisterTextField({Key? key}) : super(key: key);

  @override
  _RegisterTextFieldState createState() => _RegisterTextFieldState();
}

class _RegisterTextFieldState extends State<RegisterTextField> {

   final TextEditingController passwordController = new TextEditingController();
    bool passwordObscure = true;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFieldInput(text: "username", iconName: Icons.account_circle, ltext: "User Name"),
              TextFieldInput(text: "email", iconName: Icons.mail, ltext: "Email",),
             TextFieldPassword(),
              TextFieldPassword(),
            ]
        )
    );
  }

  //
  
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
   //
}
