import 'package:flutter/material.dart';
import 'package:pelerin/view/home_page/components/colors.dart';
import 'package:pelerin/view/home_page/components/size_config.dart';

class MessageText extends StatefulWidget {
  String description;
  String? reponseDescription;
  
  MessageText({Key? key, required this.description, required this.reponseDescription}) : super(key: key);

  @override
  _MessageTextState createState() => _MessageTextState();
}

class _MessageTextState extends State<MessageText> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${widget.description}",
          style: TextStyle(color: Colors.black, fontSize: SizeConfig.screenHeight!/42.69),                 /// 16
          maxLines: 2,
        ),
        SizedBox(height: SizeConfig.screenHeight!/341.5),        /// 2.0
        Text.rich(
          TextSpan(
            text: "${widget.reponseDescription}",
            style: TextStyle(
                fontWeight: FontWeight.w600, color: buttonColor, fontSize: SizeConfig.screenHeight!/37.95   /// 18
            ),
            children: [
            ],
          ),
        ),
      ],
    );
  }
}
