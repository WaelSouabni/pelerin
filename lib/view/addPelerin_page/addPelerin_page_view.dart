import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pelerin/view/addPelerin_page/widgets/compte.dart';
import 'package:pelerin/view/addPelerin_page/widgets/information.dart';
import 'package:pelerin/view/addPelerin_page/widgets/passeport.dart';
import 'package:pelerin/view/login_page/login_page_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../configuration/user.dart';
import '../home_page/components/colors.dart';
import '../home_page/components/size_config.dart';
import '../success_page/success_page_view.dart';

class AddPelerinPageView extends StatefulWidget {
  const AddPelerinPageView({Key? key}) : super(key: key);

  @override
  _AddPelerinPageViewState createState() => _AddPelerinPageViewState();
}

class _AddPelerinPageViewState extends State<AddPelerinPageView> {
  int currentStep = 0;
  bool isCompleted = false;
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

  //


  //
  List<Step> getSteps() => [
        Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 0,
          title: Text(
            "معلومات لفتح الحساب",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          content: Compte(),
        ),
        Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          title: Text(
            "معلومات الخاصة بالمعتمر",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          content: Information(),
        ),
                Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          title: Text(
            "معلومات الخاصة بجواز المعتمر",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          content: Passeport(),
        ),
      ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            labelle + " :الاشتراك في الرحلة",
            style: TextStyle(
                color: buttonColor, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Color.fromARGB(255, 0, 0, 0)),
                  onPressed: () => Navigator.of(context).pop(),
                ), 
          elevation: 0,
        ),
        body: isCompleted
            ? CheckCart()
            : Theme(
                data: Theme.of(context).copyWith(
                    colorScheme: ColorScheme.light(primary: buttonColor)),
                child: Stepper(
                  type: StepperType.vertical,
                  steps: getSteps(),
                  currentStep: currentStep,
                  onStepContinue: () {
                    final isLastStep = currentStep == getSteps().length - 1;
                    if (isLastStep) {
                      setState(() => isCompleted = true);
                      //print("Completed");

                      /// send data to server
                      ajouterPelerin();
                    } else {
                      /// code
                    }
                    setState(() => currentStep += 1);
                  },
                  onStepTapped: (step) => setState(() => currentStep = step),
                  onStepCancel: currentStep == 0
                      ? null
                      : () {
                          setState(() => currentStep -= 1);
                        },
                  controlsBuilder:
                      (BuildContext context, ControlsDetails controls) {
                    final isLastStep = currentStep == getSteps().length - 1;
                    return Container(
                      margin:
                          EdgeInsets.only(top: SizeConfig.screenHeight! / 68.3),

                      /// 10.0
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: controls.onStepContinue,
                              child: Container(
                                height: SizeConfig.screenHeight! / 13.66,

                                /// 50.0
                                decoration: BoxDecoration(
                                    color: buttonColor,
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: Center(
                                  child: Text(
                                    isLastStep ? "تأكيد" : "التالي",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            SizeConfig.screenHeight! / 37.95,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: SizeConfig.screenWidth! / 34.25,
                          ),

                          /// 12.0
                          if (currentStep != 0)
                            Expanded(
                              child: InkWell(
                                onTap: controls.onStepCancel,
                                child: Container(
                                  height: SizeConfig.screenHeight! / 13.66,

                                  /// 50.0
                                  decoration: BoxDecoration(
                                      color: buttonColor,
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  child: Center(
                                    child: Text(
                                      "رجوع",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              SizeConfig.screenHeight! / 37.95,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),

                                  /// 18
                                ),
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                )));
  }

  void ajouterPelerin() async {
    sharedPreferences = await SharedPreferences.getInstance();
//

 final response = await http.post(
      Uri.parse(sharedPreferences.getString("url")!+'/Mobile/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': sharedPreferences.getString("name")!,
        'email': sharedPreferences.getString("mail")!,
        'password': sharedPreferences.getString("password")!,
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

      sharedPreferences.setInt("idUserClient", userdata.id);
      sharedPreferences.setString("userNameClient", userdata.name);
      sharedPreferences.setString("userMailClient", userdata.email);
   final response = await http.post(
      Uri.parse(sharedPreferences.getString("url")!+'/pelerins'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'nomArabe': sharedPreferences.getString("nomarabe")!,
        'prenomArabe': sharedPreferences.getString("prenomarabe")!,
        'dateNaissance': sharedPreferences.getString("dateNaissance"),
        'sexe': sharedPreferences.getString("sexe")!,
        'telephoneTunisien': sharedPreferences.getString("phone")!,
        'numeroDePassport':  sharedPreferences.getString("numeroPassport")!,
        'dateExpiration': sharedPreferences.getString("expiration"),
        'dateEmission': sharedPreferences.getString("dateEmession"),
        'user_id':  (sharedPreferences.getInt("idUserClient")!),
        'createur_id': (sharedPreferences.getInt("idUser")!),
        'package_id':  (sharedPreferences.getInt("idPackage")!),
        'etat': '1',
      }),
      
    );
    if (response.statusCode == 200) {
    
      //
       Future.delayed(Duration.zero, () => showAlert(context));
       Navigator.pop(context);

}

    } else {
             Future.delayed(Duration.zero, () => showAlertErreur(context));

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => AddPelerinPageView()));
    }
  
  }
  void showAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text("تم تسجيل هذا المعتمر بنجاح"),
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

//
  void showAlertErreur(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text("حدث خطأ اعد المحاولة "),
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
