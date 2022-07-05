import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:projeto_final_unb/models/AcertosCurtidasNotifier.dart';
import 'package:projeto_final_unb/models/ComentariosNotifier.dart';
import 'package:projeto_final_unb/models/CompartilhamentosNotifier.dart';
import 'package:projeto_final_unb/pages/Home.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AcertosCurtidasNotifier()),
        ChangeNotifierProvider(create: (context) => ComentariosNotifier()),
        ChangeNotifierProvider(
            create: (context) => CompartilhamentosNotifier()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        //supportedLocales: const [Locale('pt', 'BR')],
        home: Home(),
        //theme:
      ),
    );
  }
}
