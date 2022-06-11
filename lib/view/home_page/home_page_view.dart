
import 'package:flutter/material.dart';
import 'package:pelerin/view/login_page/login_page_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/size_config.dart';
import 'widgets/discount_cart.dart';
import 'widgets/username_text.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
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
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            UserNameText(),
            DiscountCard(),
          ],
        ),
      ),
    );
  }
}
