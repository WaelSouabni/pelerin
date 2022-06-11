import 'package:flutter/material.dart';

import 'text_field_widget/text_field_input.dart';
import 'text_field_widget/text_field_password.dart';

class LoginTextField extends StatefulWidget {
  final  TextEditingController emailController;
  final TextEditingController passwordController;
  const LoginTextField({Key? key,required this.emailController,required this.passwordController}) : super(key: key);

  @override
  _LoginTextFieldState createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFieldInput(text: "البريد الإلكتروني", iconName: Icons.mail, ltext: "البريد الإلكتروني",ControllerName: widget.emailController,),
            TextFieldPassword(passwordController: widget.passwordController,),
          ]
        )
    );
  }
}
