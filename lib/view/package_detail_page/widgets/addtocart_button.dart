import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../home_page/components/colors.dart';
import '../../home_page/components/size_config.dart';
import 'package:http/http.dart' as http;
import '../../checkout_page/checkout_page_view.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.fromLTRB(
        SizeConfig.screenWidth! / 20.55,
        SizeConfig.screenHeight! / 34.15,
        SizeConfig.screenWidth! / 20.55,
        0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(20),
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
                SizeConfig.screenHeight! / 11.66)),
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            shadowColor: MaterialStateProperty.all(Colors.transparent),
          ),
          onPressed: () => _Registre(context),
          child: Wrap(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(right: SizeConfig.screenWidth! / 51.38),

                /// 8.0
                child: Icon(
                  Icons.shopping_cart_rounded,
                  color: Colors.white,
                ),
              ),
              Text(
                "اشتراك شخصي كمعتمر",
                style: TextStyle(
                  fontSize: SizeConfig.screenHeight! / 34.15,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
   _Registre(context) async {
       SharedPreferences sharedPreferences  = await SharedPreferences.getInstance();

    //  print(password);
    final response = await http.post(
      Uri.parse(sharedPreferences.getString("url")!+'/accompgnateursPackages'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "user_id": sharedPreferences.getInt("idUser"),
        "package_id":sharedPreferences.getInt("idPackage"),
        "role": "0"
      }),
    );
        
if (response.statusCode == 200) {
       print("ffff");
      //
       Future.delayed(Duration.zero, () => showAlert(context));
       Navigator.pop(context);

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
}
