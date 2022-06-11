
import 'package:flutter/material.dart';
import '../../home_page/components/size_config.dart';
import '../components/review.dart';
import 'Package_description.dart';
import 'Package_name.dart';
import 'addtocart_button.dart';

class DetailWidget extends StatefulWidget {
  String labelle;
  String description;
  String prix;
  int NombrePlace;
  DateTime dateDepart;
  int NombrePlaceRestant;
 

  DetailWidget({
    required this.labelle,
    required this.description,
    required this.NombrePlace,
    required this.dateDepart,
    required this.prix,
    required this.NombrePlaceRestant,
   
  });
  @override
  _DetailWidgetState createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: EdgeInsets.only(top: SizeConfig.screenHeight! * 0.35),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
          boxShadow: [
            BoxShadow(
                color: Colors.black54, blurRadius: 10, offset: Offset(0, -1))
          ]),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Container(
              width: SizeConfig.screenWidth! / 3.43,

              /// 120.0
              height: SizeConfig.screenHeight! / 227.67,

              /// 3.0
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black12),
            ),
            // SizedBox(height: SizeConfig.screenHeight!/34.15,),      /// 20.0
            PackageName(labelle: widget.labelle, prix: widget.prix),
            ReviewStars(dateDepart: widget.dateDepart),
            PackageDescription(description: widget.description),
            // FeaturesFood(),
            (widget.NombrePlaceRestant > 0)
                ? AddToCartButton()
                : Text(
                    "لم يعد هناك مقاعد",
                    style: TextStyle(
                        color: Colors.black38,
                        fontSize: SizeConfig.screenHeight! / 42.69,

                        /// 16
                        fontWeight: FontWeight.w400),
                  ),
           
            //
          ],
        ),
      ),
    );
  }
}
