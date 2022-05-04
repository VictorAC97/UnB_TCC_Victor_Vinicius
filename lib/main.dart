import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:projeto_final_unb/telas/Home.dart';

void main() {
  runApp(MaterialApp(
    localizationsDelegates: [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    supportedLocales: const [Locale('pt', 'BR')],
    home: Home(),
    debugShowCheckedModeBanner: false,
    //theme: basicTheme(),
  ));
}
