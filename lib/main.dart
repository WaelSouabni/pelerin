
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pelerin/view/splash_screen.dart';
import 'package:syncfusion_localizations/syncfusion_localizations.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'مرافق معتمر',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch:  Colors.blue,
      ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        // ... app-specific localization delegate[s] here
        SfGlobalLocalizations.delegate
      ],
      //ignore: always_specify_types
      supportedLocales: const [
        Locale('ar'),
      ],
      locale: const Locale('ar'),
      home: const SplashScreen(),
    );
  }
}