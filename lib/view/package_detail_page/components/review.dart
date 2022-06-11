import 'package:flutter/material.dart';
import '../../home_page/components/colors.dart';
import '../../home_page/components/size_config.dart';

class ReviewStars extends StatefulWidget {
  DateTime dateDepart;
  ReviewStars({Key? key, required this.dateDepart}) : super(key: key);

  @override
  _ReviewStarsState createState() => _ReviewStarsState();
}

class _ReviewStarsState extends State<ReviewStars> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: SizeConfig.screenHeight! / 45.54),

      /// 15.0
      child: Container(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.calendar_month,
                color: textColor,
              ),
              Text(
                "${widget.dateDepart.year}-${widget.dateDepart.month}-${widget.dateDepart.day}",
                style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: SizeConfig.screenHeight! / 45.54),
              ),

              /// 15.0
              Padding(
                padding: EdgeInsets.only(left: SizeConfig.screenWidth! / 51.38),

                /// 8.0
                child: Text("تاريخ",
                    style: TextStyle(color: Colors.black26)),
              )
            ],
          ),
          Container(
            height: SizeConfig.screenHeight! / 34.15,
            width: SizeConfig.screenWidth! / 137,
            decoration: BoxDecoration(
                color: Colors.black12, borderRadius: BorderRadius.circular(10)),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: SizeConfig.screenWidth! / 51.38),

                /// 8.0
                child: Icon(
                  Icons.verified,
                  color: freeDelivery,
                  size: SizeConfig.screenHeight! / 22.77,
                ),
              ),
              Text(
                " ",
                style: TextStyle(
                    color: freeDelivery,
                    fontWeight: FontWeight.bold,
                    fontSize: SizeConfig.screenHeight! / 42.69),
              )

              /// 16
            ],
          )
        ],
      )),
    );
  }
}
