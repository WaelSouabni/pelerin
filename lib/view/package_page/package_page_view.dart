
import 'package:flutter/material.dart';
import 'package:pelerin/view/login_page/login_page_view.dart';
import 'package:pelerin/view/package_page/widgets/background_image.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../configuration/package_list.dart';
import '../../configuration/package.dart';
import '../calendar_page/calendar_page_view.dart';
import '../home_page/components/size_config.dart';
import 'widgets/Package_image.dart';

class PackagePageView extends StatefulWidget {
  const PackagePageView({Key? key}) : super(key: key);

  @override
  _PackagePageViewState createState() => _PackagePageViewState();
}

class _PackagePageViewState extends State<PackagePageView> {
    late SharedPreferences sharedPreferences;
     checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getString("token") == null) {
          Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const LoginPageView()));    }
          
 

  }
   @override
  void initState() {
    checkLoginStatus();  
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
           
      body: SingleChildScrollView(
        child: Column(
          children: [
          BackgroundImage(),
           
           Padding(
        
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.screenWidth! / 20.0,
            vertical: SizeConfig.screenHeight! / 136.6),

        /// 20.0 - 5.0
        child: FutureBuilder<List<Package>>(
            future: bringThePackages(),
            builder: (context, snapshot) {
              print(snapshot.data);
              if (snapshot.hasData) {
                 var PackageList = snapshot.data;
                return GridView.builder(
                    shrinkWrap: true,
                    itemCount: PackageList!.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      childAspectRatio: 3.2 / 4,
                    ),
                    itemBuilder: (context, index) {
                      var Package = PackageList[index];
                      return Stack(
                        children: [
                          Container(
                              //height: SizeConfig.screenHeight! / 3.10,

                              /// 220.0
                             // width: SizeConfig.screenWidth! / 2.06,

                              /// 200.0
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30.0),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0, 3),
                                      blurRadius: 6,
                                      color: Colors.black.withOpacity(0.1),
                                    )
                                  ]),
                              child: Stack(
                                children: [
                                  
                                  PackageDetail(
                                    id: Package.id,
                                    image: Package.image.toString(),
                                    labelle: Package.labelle,
                                    description: Package.description,
                                    prix: Package.prix.toString(),
                                    NombrePlace: Package.NombrePlace,
                                    NombrePlaceRestant: Package.NombrePlaceRestant,
                                    dateDepart: Package.dateDepart,
                                    ),
                                                                    IconButton(
                                icon: const Icon(Icons.calendar_month),
                                onPressed: () {
                                  // Do something.
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => CalendarCart(dateDepart: Package.dateDepart,Labelle: Package.labelle,)));
                                }),
                                ],
                              )),
                        ],
                      );
                    });
              } else {
                return Padding(
                  padding:
                     EdgeInsets.only(top: SizeConfig.screenHeight! / 3.10),
                  /// 200.0
                  child: Column(
                    children: [
                      Center(
                          child: Icon(
                        Icons.flight,
                        color: Colors.black12,
                        size: SizeConfig.screenHeight! / 11.39,
                      )),
                      /// 60.0
                   
                      /// 20.0
                      Center(
                          child: Text(
                        " ",
                        style: TextStyle(
                            color: Colors.black12,
                            fontSize: SizeConfig.screenHeight! / 34.15),
                      ))

                      /// 20.0
                    ],
                  ),
                );
              }
            }),
      ),
          ],
        ),
      ),
    );
  }
}
