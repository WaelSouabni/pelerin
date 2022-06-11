import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pelerin/view/bottom_navigator.dart';
import 'package:pelerin/view/checkout_page/widgets/address.dart';
import 'package:pelerin/view/checkout_page/widgets/payment.dart';


import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


import '../../configuration/user.dart';
import '../home_page/components/colors.dart';
import '../home_page/components/size_config.dart';
import '../success_page/success_page_view.dart';

class CheckoutPageView extends StatefulWidget {
  const CheckoutPageView({Key? key}) : super(key: key);

  @override
  _CheckoutPageViewState createState() => _CheckoutPageViewState();
}

class _CheckoutPageViewState extends State<CheckoutPageView> {
  int currentStep = 0;
  bool isCompleted = false;
  late SharedPreferences sharedPreferences;

  //
 
   @override
  void initState() {
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
          content: Address(),
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
          content: Payment(),
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
            "  الاشتراك في تطيبيق مرافق معتمر ",
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

      sharedPreferences.setString("token", 'True');
      sharedPreferences.setInt("idUser", userdata.id);
      sharedPreferences.setString("userName", userdata.name);
      sharedPreferences.setString("userMail", userdata.email);

         final response = await http.post(
      Uri.parse(sharedPreferences.getString("url")!+'/Mobile/PelerinStore'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'nomArabe': sharedPreferences.getString("nomarabe")!,
        'prenomArabe': sharedPreferences.getString("prenomarabe")!,
        'sexe': sharedPreferences.getString("sexe")!,
        'dateNaissance':  (sharedPreferences.getString("dateNaissance")!),
        'user_id':  (sharedPreferences.getInt("idUser")!),
        'etat': '0',
      }),
     
    );
        Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MyHomePage()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => CheckoutPageView()));
    }
  
  }
}
