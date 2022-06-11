import 'package:flutter/material.dart';
import '../../home_page/components/colors.dart';
import '../../home_page/components/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../login_page/login_page_view.dart';

class UserNameText extends StatefulWidget {
  const UserNameText({Key? key}) : super(key: key);

  @override
  _UserNameTextState createState() => _UserNameTextState();
}

class _UserNameTextState extends State<UserNameText> {
    String name = "";
  String mail = "";
   @override
  void initState() {
    checkLoginStatus();

    super.initState();
  }
  //
   checkLoginStatus() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    if (sharedPreferences.getString("token") == null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => LoginPageView()),
          (Route<dynamic> route) => false);
    }
    setState(() {
      name = sharedPreferences.getString("userName")!;
      mail = sharedPreferences.getString("userMail")!;
     
    });
  }
  //
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          SizeConfig.screenWidth!/14.17,                 /// 29.0
          SizeConfig.screenHeight!/23.55,                /// 29.0
          SizeConfig.screenWidth!/11.74,                 /// 35.0
          SizeConfig.screenHeight!/68.3                  /// 10.0
      ),
      child: Row(
     
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: SizeConfig.screenHeight!/85.38 ,bottom: SizeConfig.screenHeight!/113.84),          /// 8.0 - 6.0
                    child: Text(name+" مرحبا ", style: TextStyle(fontSize: SizeConfig.screenHeight!/29.7, fontWeight: FontWeight.bold, color: Colors.black87),),  /// 23
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: SizeConfig.screenHeight!/85.38),      /// 8.0
                    child: Container(
                      height: SizeConfig.screenHeight!/22.77,      /// 30.0
                      width: SizeConfig.screenWidth!/13.7,         /// 30.0
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/main/waving-hand.png")
                        )
                      ),
                    ),
                  )
                ],
              ),
              Text(" ", style: TextStyle(fontSize: SizeConfig.screenHeight!/40.18, color: Colors.black54),)   /// 17
            ],
          ),
          Stack(
            children: [
              Container(
                  height: SizeConfig.screenHeight!/17.07,            /// 40.0
                  width: SizeConfig.screenWidth!/5.13,               /// 80.0
                  decoration: BoxDecoration(
                      color: lightColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(30.0)
                  ),
              ),
              Container(
                  height: SizeConfig.screenHeight!/17.07,            /// 40.0
                  width: SizeConfig.screenWidth!/10.28,              /// 40.0
                  decoration: BoxDecoration(
                      color: buttonColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(30.0)
                  ),
                  child: Icon(Icons.notifications_none, color: Colors.white,)
              ),
              Positioned(
                right: SizeConfig.screenWidth!/20.55,              /// 20.0
                bottom: SizeConfig.screenHeight!/62.01,            /// 11.0
                child: Text("x", style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),)
              )
            ],
          ),
        ],
      ),
    );
  }
}
