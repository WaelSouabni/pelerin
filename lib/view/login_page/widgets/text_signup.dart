
import 'package:flutter/material.dart';
import 'package:pelerin/view/checkout_page/checkout_page_view.dart';
import 'package:pelerin/view/home_page/components/colors.dart';
import 'package:pelerin/view/home_page/components/size_config.dart';





class TextSignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.fromLTRB(
          SizeConfig.screenWidth!/20.55,
          SizeConfig.screenHeight!/136.6,
          SizeConfig.screenWidth!/20.55,
          0
      ),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("ليس لديك حساب؟", style: TextStyle(color: texthint),),
            GestureDetector(
              onTap: (){
                //Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPageView()));
                 // Navigator.push(context, MaterialPageRoute(builder: (context) => CheckoutPageView()));
                  
                     Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const CheckoutPageView()));
   
              },
              child: Text(
                " اشتراك",
                style: TextStyle(
                    color: buttonColor,
                    fontWeight: FontWeight.w600,
                    fontSize: SizeConfig.screenHeight!/45.54          /// 15
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
