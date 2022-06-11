import 'package:flutter/material.dart';


import '../../../configuration/package.dart';
import '../../home_page/components/size_config.dart';

class PackageDescription extends StatelessWidget {
   final String description;
  const PackageDescription({Key? key, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: SizeConfig.screenHeight!/45.54),            /// 15.0
      child: Container(
        child: Text(
         description,
          style: TextStyle(color: Colors.black),
          textAlign: TextAlign.justify,),
      ),
    );
  }
}
