import 'package:flutter/material.dart';
import 'package:pelerin/view/home_page/components/size_config.dart';

class MessageImage extends StatefulWidget {
  const MessageImage({Key? key}) : super(key: key);

  @override
  _MessageImageState createState() => _MessageImageState();
}

class _MessageImageState extends State<MessageImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight!/8.54,                 /// 80.0
      width: SizeConfig.screenWidth!/4.57,                   /// 90.0
      decoration: BoxDecoration(
        image: DecorationImage(   
          image: ExactAssetImage('assets/main/envelope-clipart-svg-5.png'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
    );
  }
}
