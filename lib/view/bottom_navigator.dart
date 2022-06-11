
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:pelerin/view/profile_page/profile_page_view.dart';

import 'accompgnateur_page/accompgnateur_page_view.dart';

import 'home_page/components/colors.dart';
import 'home_page/components/size_config.dart';
import 'home_page/home_page_view.dart';
import 'packagePelerin_page/package_pelerin_page_view.dart';
import 'package_page/package_page_view.dart';






class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int index = 0;

  final screen = [
    HomePageView(),
    PackagePageView(),
    packagesPelerinPageView(),
    AccompgnateurPageView(),
    ProfilePageView(),
  ];
  @override
  Widget build(BuildContext context) {
    final items = [
      Icon(Icons.home, size: SizeConfig.screenHeight!/22.77),          /// 30.0
      Icon(Icons.airplanemode_on, size: SizeConfig.screenHeight!/22.77),
      Icon(Icons.shopping_cart, size: SizeConfig.screenHeight!/22.77),
      Icon(Icons.supervised_user_circle_outlined , size: SizeConfig.screenHeight!/22.77),
      Icon(Icons.person, size: SizeConfig.screenHeight!/22.77),
    ];
    Size size = MediaQuery.of(context).size;
    return Container(
      color: buttonColor,
      child: SafeArea(
        top: false,
        child: Scaffold(
          extendBody: true,
          backgroundColor: Colors.white,
          body: screen[index],
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
                iconTheme: IconThemeData(color: Colors.white)
            ),
            child: CurvedNavigationBar(
              key: navigationKey,
              color: Colors.black45,
              backgroundColor: buttonColor,
              buttonBackgroundColor: buttonColor,
              height: SizeConfig.screenHeight!/11.39,               /// 60.0
              animationCurve: Curves.easeInOut,
              animationDuration: Duration(milliseconds: 400),
              index: index,
              items: items,
              onTap: (index) => setState(() => this.index = index),
            ),
          ),
        ),
      ),
    );
  }
}
