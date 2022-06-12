import 'package:flutter/material.dart';
import 'package:pelerin/view/login_page/widgets/text_title.dart';
import '../../home_page/components/colors.dart';
import '../../home_page/components/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/CustomShape.dart';

class TopCustomShape extends StatefulWidget {
  const TopCustomShape({Key? key}) : super(key: key);

  @override
  _TopCustomShapeState createState() => _TopCustomShapeState();
}

class _TopCustomShapeState extends State<TopCustomShape> {
  String nom = '', email = '';
  
    @override
  void initState() {
    super.initState();
	 checkLoginStatus();
  }
    checkLoginStatus() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  
  setState(() {
      nom = sharedPreferences.getString("userName")!;
      email= sharedPreferences.getString("userMail")!;
    });

  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight! / 2.84,

      /// 240.0
      child: Stack(
        children: [
          ClipPath(
            clipper: CustomShape(),
            child: Container(
              height: SizeConfig.screenHeight! / 4.56,

              /// 150.0
              color: buttonColor,
               child:const Center(
                  child: Text("قائمة الرحلات"),
                ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  height: SizeConfig.screenHeight! / 4.88,

                  /// 140.0
                  width: SizeConfig.screenWidth! / 2.93,

                  /// 140.0
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: Colors.white,
                          width: SizeConfig.screenWidth! / 51.37),
                      color: Colors.white,
                      image: DecorationImage(
                          image: AssetImage("assets/main/avatar.png"))),
                ),
                Text(
                  nom,
                  style: TextStyle(fontSize: 22),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight! / 136.6,
                ),

                /// 5.0
                Text(
                  email,
                  style: TextStyle(
                      fontWeight: FontWeight.w400, color: Colors.black45),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
