import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:projeto_final_unb/telas/Home.dart';
import 'package:projeto_final_unb/telas/Modulo1.dart';
import 'package:projeto_final_unb/telas/TelaCriacaoTexto.dart';
import '../widgets/theme.dart';

void main() {
  runApp(MaterialApp(
    localizationsDelegates: [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate
    ],
    supportedLocales: [const Locale('pt', 'BR')],
    home: Home(),
    debugShowCheckedModeBanner: false,
    //theme: basicTheme(),
  ));
}
