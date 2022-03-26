import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:projeto_final_unb/telas/Home.dart';
import 'package:projeto_final_unb/telas/Modulo1.dart';
import 'package:projeto_final_unb/telas/VideoIntro.dart';

void main() {
  runApp(MaterialApp(
    localizationsDelegates: [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate
    ],
    supportedLocales: [const Locale('pt', 'BR')],
    initialRoute: "/home",
    debugShowCheckedModeBanner: false,
    routes: {
      //"/": (context) => SplashScreen(),
      "/video": (context) => VideoIntro(),
      "/home": (context) => Home(),
      "/modulo1": (context) => Modulo1(),
    },
  ));
}
