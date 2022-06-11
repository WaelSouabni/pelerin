
import 'package:flutter/material.dart';
import 'package:pelerin/view/login_page/login_page_view.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../home_page/components/size_config.dart';
import 'widgets/Package_image.dart';
import 'widgets/detail_widget.dart';

class PackageDetailView extends StatefulWidget {
  int id;
  String labelle;
  String description;
  String prix;
  int NombrePlace;
  int NombrePlaceRestant;
  DateTime dateDepart;
  String? image;
  
  PackageDetailView({
    required this.id,
    required this.labelle,
    required this.description,
    required this.NombrePlace,
    required this.NombrePlaceRestant,
    required this.dateDepart,
    required this.prix,
    required this.image,
    
  });

  @override
  _PackageDetailViewState createState() => _PackageDetailViewState();
}

class _PackageDetailViewState extends State<PackageDetailView> {
  late SharedPreferences sharedPreferences;
  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt("idPackage", widget.id);
    sharedPreferences.setString("labellePackage", widget.labelle);
        if(sharedPreferences.getString("token") == null) {
          Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const LoginPageView()));    }
          
 
  }

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            PackageImage(image: widget.image!),
            DetailWidget(
                labelle: widget.labelle,
                description: widget.description,
                prix: widget.prix,
                NombrePlace: widget.NombrePlace,
                dateDepart: widget.dateDepart,
                NombrePlaceRestant: widget.NombrePlaceRestant,
                ),
          ],
        ),
      ),
    );
  }
}
