import 'package:flutter/material.dart';

import '../../home_page/components/size_config.dart';
import '../../login_page/widgets/text_title.dart';


class BackgroundImage extends StatelessWidget {
   BackgroundImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: SizeConfig.screenHeight!/6.5,    /// 160.0 4.268
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/main/background_image.png'),
                    fit: BoxFit.fill
                )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text("الاشتراك في تطيبيق معتمر ", style: TextStyle(color: Colors.white, fontSize: SizeConfig.screenHeight!/30, fontWeight: FontWeight.bold),)
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
