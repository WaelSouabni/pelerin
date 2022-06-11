import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../configuration/food.dart';
import '../../../configuration/food_list.dart';
import '../../home_page/components/size_config.dart';

class DiscountCard extends StatefulWidget {
  const DiscountCard({Key? key}) : super(key: key);

  @override
  _DiscountCardState createState() => _DiscountCardState();
}

class _DiscountCardState extends State<DiscountCard> {
  @override
  Widget build(BuildContext context) {
    // to get size
    var size = MediaQuery.of(context).size;

    // style
    var cardTextStyle = const TextStyle(
        fontFamily: "Montserrat Regular",
        fontSize: 14,
        color: Color.fromRGBO(63, 63, 63, 1));

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Center(
        child: Wrap(
          spacing: 20,
          runSpacing: 20.0,
          children: <Widget>[
            SizedBox(
              width: 160.0,
              height: 160.0,
              child: Card(
                color: Colors.white,
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        "assets/main/accompganteurs.png",
                        width: 64.0,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "قائمة المرافقين ",
                        style: TextStyle(
                            color: Color.fromARGB(255, 21, 21, 21),
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "",
                        style: TextStyle(
                            color:Color.fromARGB(255, 21, 21, 21), fontWeight: FontWeight.w100),
                      )
                    ],
                  ),
                )),
              ),
            ),
            SizedBox(
              width: 160.0,
              height: 160.0,
              child: Card(
                color:  Colors.white,
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        "assets/main/vols.png",
                        width: 64.0,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "الرحلات",
                        style: TextStyle(
                            color: Color.fromARGB(255, 21, 21, 21),
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "",
                        style: TextStyle(
                            color: Color.fromARGB(255, 21, 21, 21), fontWeight: FontWeight.w100),
                      )
                    ],
                  ),
                )),
              ),
            ),
            SizedBox(
              width: 160.0,
              height: 160.0,
              child: Card(
                color: Colors.white,
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        "assets/main/message.jpg",
                        width: 64.0,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "شكوى أو طلب",
                        style: TextStyle(
                            color:Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "",
                        style: TextStyle(
                            color: Color.fromARGB(255, 21, 21, 21), fontWeight: FontWeight.w100),
                      )
                    ],
                  ),
                )),
              ),
            ),
            SizedBox(
              width: 160.0,
              height: 160.0,
              child: Card(
                color: Colors.white,
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        "assets/main/suivie.png",
                        width: 64.0,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "متابعة مطلب",
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                          "",
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.w100),
                      )
                    ],
                  ),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
