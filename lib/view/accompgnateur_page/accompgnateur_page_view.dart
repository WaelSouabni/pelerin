
import 'package:flutter/material.dart';
import 'package:pelerin/view/accompgnateur_page/widgets/background_image.dart';
import 'package:pelerin/view/login_page/login_page_view.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../configuration/Accompgnateur.dart';
import '../../configuration/Accompgnateur.dart';
import '../../configuration/Accompgnateur_list.dart';

import '../home_page/components/size_config.dart';
import 'widgets/accompgnateur_image.dart';

class AccompgnateurPageView extends StatefulWidget {
  const AccompgnateurPageView({Key? key}) : super(key: key);

  @override
  _AccompgnateurPageViewState createState() => _AccompgnateurPageViewState();
}

class _AccompgnateurPageViewState extends State<AccompgnateurPageView> {
  
  late SharedPreferences sharedPreferences;
   checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getString("token") == null) {
          Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const LoginPageView()));    }

  }
   @override
  void initState() {
    checkLoginStatus();  
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
     
      body:SingleChildScrollView(
        child: Column(
          children: [
          BackgroundImage(),
           
    Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.screenWidth! / 20.0,
            vertical: SizeConfig.screenHeight! / 136.6),

        /// 20.0 - 5.0
        child: FutureBuilder<List<Accompgnateur>>(
            future: bringTheAccompgnateurs(),
            builder: (context, snapshot) {
              print(snapshot.data);
              if (snapshot.hasData) {
                var AccompgnateurList = snapshot.data;
                return GridView.builder(
                    shrinkWrap: true,
                    itemCount: AccompgnateurList!.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      childAspectRatio: 3.2 / 4,
                    ),
                    itemBuilder: (context, index) {
                      var Accompgnateur = AccompgnateurList[index];
                      return Stack(
                        children: [
                          Container(
                              height: SizeConfig.screenHeight! / 3.10,

                              /// 220.0
                              width: SizeConfig.screenWidth! / 2.06,

                              /// 200.0
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30.0),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0, 3),
                                      blurRadius: 6,
                                      color: Colors.black.withOpacity(0.1),
                                    )
                                  ]),
                              child: Stack(
                                children: [
                                  AccompgnateurDetail(
                                    id: Accompgnateur.id,
                                    image: Accompgnateur.image.toString(),
                                    nomArabe: Accompgnateur.nomArabe,
                                    prenomArabe: Accompgnateur.prenomArabe,
                                    userId: Accompgnateur.userId,
                                    sexe: Accompgnateur.sexe,
                                    telephoneTunisien:
                                        Accompgnateur.telephoneTunisien,
                                    telephoneEtranger:
                                        Accompgnateur.telephoneEtranger,
                                  ),
                                ],
                              )),
                        ],
                      );
                    });
              } else {
                return Padding(
                  padding:
                      EdgeInsets.only(top: SizeConfig.screenHeight! / 3.10),

                  /// 200.0
                  child: Column(
                    children: [
                      Center(
                          child: Icon(
                        Icons.verified_user,
                        color: Colors.black12,
                        size: SizeConfig.screenHeight! / 11.39,
                      )),

                      /// 60.0
                      SizedBox(
                        height: SizeConfig.screenHeight! / 34.15,
                      ),

                      /// 20.0
                      Center(
                          child: Text(
                        " ",
                        style: TextStyle(
                            color: Colors.black12,
                            fontSize: SizeConfig.screenHeight! / 34.15),
                      ))

                      /// 20.0
                    ],
                  ),
                );
              }
            }),
      ),
          ],
        ),
      ),
    );
  }
}
