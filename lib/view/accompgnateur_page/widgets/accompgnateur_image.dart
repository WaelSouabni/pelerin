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
                Align(alignment: Alignment.centerRight, child: Text(
                widget.nomArabe!+" "+widget.prenomArabe!,
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: SizeConfig.screenHeight!/50,          /// 20.0 34.15
                    fontWeight: FontWeight.w700),
              ),),
               Align(alignment: Alignment.centerRight, child:Text(
                "${widget.telephoneEtranger!}",
                style: TextStyle(
                    color: Colors.black38,
                    fontSize: SizeConfig.screenHeight!/42.69,         /// 16
                    fontWeight: FontWeight.w400),
              ),),
            ],
          ),
        )
      ],
    );
  }
}
