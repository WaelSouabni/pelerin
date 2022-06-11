

import 'package:flutter/material.dart';
import '../../home_page/components/colors.dart';
import '../../home_page/components/size_config.dart';
import 'package:intl/intl.dart';



class PackagesPelerinDetail extends StatefulWidget {
 String labelle;
 String etat;
 DateTime created_at;
 String? image;


  PackagesPelerinDetail({
    required this.labelle,
    required this.etat,
    required this.created_at,
    required this.image,});

  @override
  _PackagesPelerinDetailState createState() => _PackagesPelerinDetailState();
}

class _PackagesPelerinDetailState extends State<PackagesPelerinDetail> {
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
              image: NetworkImage('${widget.image}'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
          ),
        ),
      GestureDetector(
    onTap: () { 
       //print("Click event on Container"); 
  
    },
    child:   Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              Text(
                "${widget.labelle}",
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: SizeConfig.screenHeight!/34.15,          /// 20.0
                    fontWeight: FontWeight.w700),
              ),
               (widget.etat== '1')
                ? Text(
                              "في إنتظار",
                              style: TextStyle(
                                  color: Colors.black38,
                                  fontSize: SizeConfig.screenHeight!/42.69,         /// 16
                                  fontWeight: FontWeight.w400),
                            )
                :  (widget.etat== '2')
                ? Text(
                              "مؤكد",
                              style: TextStyle(
                                  color: Colors.black38,
                                  fontSize: SizeConfig.screenHeight!/42.69,         /// 16
                                  fontWeight: FontWeight.w400),
                            )
                : Text(
                              "مرفوض",
                              style: TextStyle(
                                  color: Colors.black38,
                                  fontSize: SizeConfig.screenHeight!/42.69,         /// 16
                                  fontWeight: FontWeight.w400),
                            ),
             
              Padding(
                padding:
                EdgeInsets.only(top: SizeConfig.screenHeight!/136.6),  /// 5.0
                child: Text(
                  "${widget.created_at.day}-${widget.created_at.month}-${widget.created_at.year}",
                  style: TextStyle(
                      color: buttonColor,
                      fontSize: SizeConfig.screenHeight!/37.95,        /// 18
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        )
      ,
)],
    );
  }
}
