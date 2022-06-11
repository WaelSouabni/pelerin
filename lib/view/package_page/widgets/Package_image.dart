import 'package:flutter/material.dart';
import '../../home_page/components/colors.dart';
import '../../home_page/components/size_config.dart';

import '../../package_detail_page/package_detail_view.dart';

class PackageDetail extends StatefulWidget {
  int id;
  String labelle;
  String description;
  String prix;
  int NombrePlace;
  int NombrePlaceRestant;
  DateTime dateDepart;
  String? image;
  int NombreAccRestant;

  PackageDetail(
      {required this.id,
      required this.labelle,
      required this.description,
      required this.NombrePlace,
      required this.NombrePlaceRestant,
      required this.dateDepart,
      required this.prix,
      required this.image,
      required this.NombreAccRestant});

  @override
  _PackageDetailState createState() => _PackageDetailState();
}

class _PackageDetailState extends State<PackageDetail> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: SizeConfig.screenHeight! / 6.21,

          /// 110.0
          width: SizeConfig.screenWidth! / 2.055,

          /// 200.0
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
            Navigator.push(context,
                MaterialPageRoute<void>(builder: (BuildContext context) {
              return PackageDetailView(
                  id: widget.id,
                  image: widget.image,
                  prix: widget.prix,
                  labelle: widget.labelle,
                  description: widget.description,
                  dateDepart: widget.dateDepart,
                  NombrePlace: widget.NombrePlace,
                  NombrePlaceRestant: widget.NombrePlaceRestant,
                  NombreAccRestant:widget.NombreAccRestant);
            }));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${widget.labelle}",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: SizeConfig.screenHeight! / 34.15,

                      /// 20.0
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  "${widget.prix}",
                  style: TextStyle(
                      color: Colors.black38,
                      fontSize: SizeConfig.screenHeight! / 42.69,

                      /// 16
                      fontWeight: FontWeight.w400),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: SizeConfig.screenHeight! / 136.6),

                  /// 5.0
                  child: Text(
                    "مقعدا ${widget.NombrePlaceRestant} تبقى",
                    style: TextStyle(
                        color: buttonColor,
                        fontSize: SizeConfig.screenHeight! / 37.95,

                        /// 18
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
