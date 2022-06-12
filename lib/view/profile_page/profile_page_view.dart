
import 'package:flutter/material.dart';
import 'package:pelerin/view/login_page/login_page_view.dart';
import 'package:pelerin/view/profile_page/widgets/top_custom_shape.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../home_page/components/size_config.dart';
import '../message_page/message_page_view.dart';

class ProfilePageView extends StatefulWidget {
  const ProfilePageView({Key? key}) : super(key: key);

  @override
  _ProfilePageViewState createState() => _ProfilePageViewState();
}

class _ProfilePageViewState extends State<ProfilePageView> {
   late SharedPreferences sharedPreferences;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
     /* appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text("الملف الشخصي",style: TextStyle(color: Colors.white),),
      ),*/
        appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 82, 147, 221),
        title: Text("الملف الشخصي",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopCustomShape(),
          SizedBox(height: SizeConfig.screenHeight!/34.15,),                              /// 20.0
          MessageSection(icon_name: Icons.message, section_text: " ترك رسالة"),
          pelerinsSection(icon_name: Icons.shopping_basket, section_text: "قائمة الاشتراكات القديمة"),
          SeDeconnecterSection(icon_name: Icons.close,section_text: "الخروج"),
        ],
      ),
    );
  }
  
  MessageSection({required IconData icon_name, required String section_text}) {
     return Padding(
      padding: EdgeInsets.fromLTRB(
          SizeConfig.screenWidth!/13.7,          /// 30.0
          0,
          SizeConfig.screenWidth!/27.4,          /// 15.0
          SizeConfig.screenHeight!/34.15         /// 20.0
      ),
      child:GestureDetector(
              onTap: (){
              // Add what you want to do on tap
                Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const MessagePageView()));
   
              },
              child: Row(
                    children: [
                      Icon(icon_name, color: Colors.black54,),
                      SizedBox(width: SizeConfig.screenWidth!/41.1,),
                      Text(section_text, style: TextStyle(color: Colors.black54, fontSize: SizeConfig.screenHeight!/42.68),),      /// 16
                      Spacer(),
                      Icon(Icons.keyboard_arrow_right, color: Colors.black45,size: SizeConfig.screenHeight!/21.34,)                /// 32
                    ],
                  ),
            ),
    );
 
  }

//

  pelerinsSection({required IconData icon_name, required String section_text}) {
     return Padding(
      padding: EdgeInsets.fromLTRB(
          SizeConfig.screenWidth!/13.7,          /// 30.0
          0,
          SizeConfig.screenWidth!/27.4,          /// 15.0
          SizeConfig.screenHeight!/34.15         /// 20.0
      ),
      child:GestureDetector(
              onTap: (){
         
              },
              child: Row(
                    children: [
                      Icon(icon_name, color: Colors.black54,),
                      SizedBox(width: SizeConfig.screenWidth!/41.1,),
                      Text(section_text, style: TextStyle(color: Colors.black54, fontSize: SizeConfig.screenHeight!/42.68),),      /// 16
                      Spacer(),
                      Icon(Icons.keyboard_arrow_right, color: Colors.black45,size: SizeConfig.screenHeight!/21.34,)                /// 32
                    ],
                  ),
            ),
    );
 
  }

//

 SeDeconnecterSection({required IconData icon_name, required String section_text}) {
     return Padding(
      padding: EdgeInsets.fromLTRB(
          SizeConfig.screenWidth!/13.7,          /// 30.0
          0,
          SizeConfig.screenWidth!/27.4,          /// 15.0
          SizeConfig.screenHeight!/34.15         /// 20.0
      ),
      child:GestureDetector(
              onTap: () async {
              // Add what you want to do on tap

                 sharedPreferences = await SharedPreferences.getInstance();

    if(sharedPreferences.getString("token") != null) {
      sharedPreferences.clear();
      sharedPreferences.commit();
          Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const LoginPageView()));
   

    }
         
              },
              child: Row(
                    children: [
                      Icon(icon_name, color: Colors.black54,),
                      SizedBox(width: SizeConfig.screenWidth!/41.1,),
                      Text(section_text, style: TextStyle(color: Colors.black54, fontSize: SizeConfig.screenHeight!/42.68),),      /// 16
                      Spacer(),
                      Icon(Icons.keyboard_arrow_right, color: Colors.black45,size: SizeConfig.screenHeight!/21.34,)                /// 32
                    ],
                  ),
            ),
    );
 
  }

}

