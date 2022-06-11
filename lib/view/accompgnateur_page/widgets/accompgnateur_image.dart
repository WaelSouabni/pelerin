import 'package:flutter/material.dart';

import '../../home_page/components/colors.dart';
import '../../home_page/components/size_config.dart';

class AccompgnateurDetail extends StatefulWidget {
  int id;
 String? nomArabe;
 String? prenomArabe;
 String? telephoneTunisien;
 String? telephoneEtranger;
 String? sexe;
 int? userId;
 String? image;


  AccompgnateurDetail({
    required this.id,
    required this.nomArabe,
    required this.prenomArabe,
    required this.telephoneTunisien,
     required this.telephoneEtranger,
    required this.sexe,
    required this.userId,
    required this.image,});

  @override
  _AccompgnateurDetailState createState() => _AccompgnateurDetailState();
}

class _AccompgnateurDetailState extends State<AccompgnateurDetail> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: SizeConfig.screenHeight!/6.21,           /// 110.0
          width: SizeConfig.screenWidth!/2.055,            /// 200.0
          decoration: BoxDecoration(
            image: DecorationImage(
              image: /*AssetImage(
                  "${widget.image}"),*/
                    NetworkImage('${widget.image}'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              Text(
                widget.prenomArabe!+" "+widget.nomArabe!,
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: SizeConfig.screenHeight!/34.15,          /// 20.0
                    fontWeight: FontWeight.w700),
              ),
              Text(
                "${widget.telephoneTunisien!}",
                style: TextStyle(
                    color: Colors.black38,
                    fontSize: SizeConfig.screenHeight!/42.69,         /// 16
                    fontWeight: FontWeight.w400),
              ),
              Padding(
                padding:
                EdgeInsets.only(top: SizeConfig.screenHeight!/136.6),  /// 5.0
                child: Text(
                  "${widget.telephoneEtranger!}",
                  style: TextStyle(
                      color: buttonColor,
                      fontSize: SizeConfig.screenHeight!/37.95,        /// 18
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
