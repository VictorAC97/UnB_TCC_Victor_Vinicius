import 'package:flutter/material.dart';
import 'package:projeto_final_unb/telas/Home.dart';
import 'package:projeto_final_unb/telas/Modulo1.dart';
import 'package:projeto_final_unb/telas/VideoIntro.dart';

void main() {
  runApp(MaterialApp(
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
