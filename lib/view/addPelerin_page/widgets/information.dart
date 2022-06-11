import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:select_form_field/select_form_field.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../home_page/components/colors.dart';
import '../../home_page/components/size_config.dart';

class Information extends StatefulWidget {
  const Information({Key? key}) : super(key: key);

  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {
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
  ];
 late SharedPreferences sharedPreferences;

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
          prenomTextField(),
          nomTextField(),
          dateNaissanceTextField(),
          sexeTextField(),
          phoneTextField(),
        ],
      ),
    );
  }

//PrenomTextField
  prenomTextField() {
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
          controller: prenomController,
          onChanged: (text) {
            //print("Text $text");
            sharedPreferences.setString("prenomarabe", text);
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
              hintText: ' اللقب بالعربية',
              hintStyle: TextStyle(color: texthint.withOpacity(0.3)),
              labelText: ' اللقب بالعربية',
              labelStyle: TextStyle(color: texthint.withOpacity(0.6))),
        ),
      ),
    );
  }

  //nomTextField
  nomTextField() {
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
          controller: nomController,
          onChanged: (text) {
            //print("Text $text");
            sharedPreferences.setString("nomarabe", text);
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
              hintText: 'اسم الثلاثي بالعربية',
              hintStyle: TextStyle(color: texthint.withOpacity(0.3)),
              labelText: 'اسم الثلاثي بالعربية',
              labelStyle: TextStyle(color: texthint.withOpacity(0.6))),
        ),
      ),
    );
  }


  //SexeTextField ||
  sexeTextField() {
    SizeConfig().init(context);
    return Center(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            SizeConfig.screenWidth! / 20.55,
            SizeConfig.screenHeight! / 68.3,
            SizeConfig.screenWidth! / 20.55,
            SizeConfig.screenHeight! / 34.15),
        child: SelectFormField(
          type: SelectFormFieldType.dropdown, // or can be dialog
          initialValue: 'رجل',
          icon: Icon(Icons.man),
          labelText: 'الجنس',
          items: _items,
          onChanged: (val) => sharedPreferences.setString("sexe", val),
          onSaved: (val) => sharedPreferences.setString("sexe", val.toString()),
        ),
      ),
    );
  }

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

  //DateNaissanceTextField
  dateNaissanceTextField() {
    SizeConfig().init(context);
    return Center(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            SizeConfig.screenWidth! / 20.55,
            SizeConfig.screenHeight! / 68.3,
            SizeConfig.screenWidth! / 20.55,
            SizeConfig.screenHeight! / 34.15),
        child: DateTimeField(
            decoration: const InputDecoration(hintText: 'تاريخ الميلاد'),
            selectedDate: selectedDate,
            onDateSelected: (DateTime value) {
              setState(() {
                selectedDate = value;
              });
              sharedPreferences.setString("dateNaissance", value.toString());
            }),
      ),
    );
  }}
