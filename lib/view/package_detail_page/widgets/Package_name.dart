import 'package:flutter/material.dart';

import '../../home_page/components/size_config.dart';


class PackageName extends StatefulWidget {
 String labelle;
 String prix;
  PackageName({required this.labelle,required this.prix});

  @override
  _PackageNameState createState() => _PackageNameState();
}

class _PackageNameState extends State<PackageName> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Row(
        children: [
        Text("\$${widget.prix}", style: TextStyle(color: Colors.black87, fontSize: SizeConfig.screenHeight!/22.77),),  /// 30
        Spacer(),
        Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Text("${widget.labelle}", style: TextStyle(color: Colors.black, fontSize: SizeConfig.screenHeight!/22.77, fontFamily: "Roboto")),  /// 30

              ]
          ),
        ]
    );
  }
}
