
import 'package:flutter/material.dart';


import '../../home_page/components/size_config.dart';
import '../components/arrow_back.dart';


class PackageImage extends StatefulWidget {
  String? image;
  PackageImage({required this.image});

  @override
  _PackageImageState createState() => _PackageImageState();
}

class _PackageImageState extends State<PackageImage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.screenHeight! * 0.45,
      decoration: BoxDecoration(
        color: Colors.blue,
        image: DecorationImage(
            image: NetworkImage('${widget.image}'),
            fit: BoxFit.fitWidth
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth!/13.7, vertical: SizeConfig.screenHeight!/34.15),     /// 30.0 - 20.0
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ArrowBack(),

            ],
          ),
        ),
      ),
    );
  }
}
