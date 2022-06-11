import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../home_page/components/colors.dart';
import '../../home_page/components/size_config.dart';

class Passeport extends StatefulWidget {
  const Passeport({Key? key}) : super(key: key);

  @override
  _PasseportState createState() => _PasseportState();
}

class _PasseportState extends State<Passeport> {
  final TextEditingController NumeroPasseController = new TextEditingController();
  DateTime? selectedDateEmmesion;
  DateTime? selectedDateExperation;
 late SharedPreferences sharedPreferences;

   /* savevalueInsharedPref() async {
   sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("numeroPassport", NumeroPasseController.text);
    sharedPreferences.setString("dateEmession", selectedDateEmmesion.toString());
    sharedPreferences.setString("expiration", selectedDateExperation.toString());

  }*/
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
          numeroPassTextField(),
          dateEmessionTextField(),
          dateExperationTextField(),
        ],
      ),
    );
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

}
